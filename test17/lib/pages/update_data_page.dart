import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class UpdateDataPage extends StatefulWidget {
  final int id;
  final Map<String, dynamic> earning;
  final VoidCallback onUpdate;

  const UpdateDataPage({
    super.key,
    required this.id,
    required this.earning,
    required this.onUpdate,
  });

  @override
  State<UpdateDataPage> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  late TextEditingController distanceController;
  late TextEditingController rateController;
  late TextEditingController tipController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    distanceController = TextEditingController(
      text: widget.earning['distance']?.toString() ?? '',
    );
    rateController = TextEditingController(
      text: widget.earning['rate']?.toString() ?? '',
    );
    tipController = TextEditingController(
      text: widget.earning['tip']?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    distanceController.dispose();
    rateController.dispose();
    tipController.dispose();
    super.dispose();
  }

  Future<void> _updateEarning() async {
    final distance = double.tryParse(distanceController.text);
    final rate = double.tryParse(rateController.text);
    final tip = double.tryParse(tipController.text) ?? 0;

    if (distance == null || rate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid values')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final baseFare = distance * rate;
      final platformCommission = baseFare * 0.02;
      final totalEarnings = baseFare - platformCommission + tip;

      await SupabaseService.updateEarnings(
        id: widget.id,
        distance: distance,
        rate: rate,
        baseFare: baseFare,
        platformCommission: platformCommission,
        tip: tip,
        totalEarnings: totalEarnings,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Earnings updated successfully!')),
        );
        widget.onUpdate();
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error updating earnings: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Update Earnings Data",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: distanceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Distance (km)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Rate per km (Rs)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: tipController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Tip Amount (Rs)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Current values display
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Values:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      'Base Fare',
                      'Rs. ${widget.earning['base_fare']?.toString() ?? 'N/A'}',
                    ),
                    _buildInfoRow(
                      'Commission',
                      'Rs. ${widget.earning['platform_commission']?.toString() ?? 'N/A'}',
                    ),
                    _buildInfoRow(
                      'Total Earnings',
                      'Rs. ${widget.earning['total_earnings']?.toString() ?? 'N/A'}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _updateEarning,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Update",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
