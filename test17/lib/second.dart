import 'package:flutter/material.dart';
import 'services/supabase_service.dart';

class FinalRider extends StatefulWidget {
  final double baseFare;
  final double platformCommission;
  final double tip;
  final double distance;
  final double rate;

  const FinalRider({
    super.key,
    required this.baseFare,
    required this.platformCommission,
    required this.tip,
    required this.distance,
    required this.rate,
  });

  @override
  State<FinalRider> createState() => _FinalRiderState();
}

class _FinalRiderState extends State<FinalRider> {
  late double totalEarnings;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    totalEarnings = widget.baseFare - widget.platformCommission + widget.tip;
  }

  Future<void> _saveEarnings() async {
    setState(() => isLoading = true);
    try {
      await SupabaseService.insertEarnings(
        distance: widget.distance,
        rate: widget.rate,
        baseFare: widget.baseFare,
        platformCommission: widget.platformCommission,
        tip: widget.tip,
        totalEarnings: totalEarnings,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Earnings saved successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving earnings: $e')));
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
          "Final Rider Earnings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    // "Your Earnings" Text
                    const Text(
                      "Your Earnings for This Delivery:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Earnings Amount Box
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Rs. ${totalEarnings.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Breakdown
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Column(
                        children: [
                          _buildBreakdownRow(
                            "Distance",
                            "${widget.distance} km",
                          ),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            "Rate per km",
                            "Rs. ${widget.rate}",
                          ),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            "Base Fare",
                            "Rs. ${widget.baseFare.toStringAsFixed(2)}",
                          ),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            "Commission (2%)",
                            "Rs. ${widget.platformCommission.toStringAsFixed(2)}",
                          ),
                          const SizedBox(height: 8),
                          _buildBreakdownRow(
                            "Tip",
                            "Rs. ${widget.tip.toStringAsFixed(2)}",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Info Text
                    const Text(
                      "This amount includes the optional tip",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Save Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : _saveEarnings,
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
                        "Save to Database",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
