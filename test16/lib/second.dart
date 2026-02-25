import 'package:flutter/material.dart';

class FinalRider extends StatefulWidget {
  final double baseFare;
  final double platformCommission;
  final double tip;

  const FinalRider({
    super.key,
    required this.baseFare,
    required this.platformCommission,
    required this.tip,
  });

  @override
  State<FinalRider> createState() => _FinalRiderState();
}

class _FinalRiderState extends State<FinalRider> {
  late double totalEarnings;

  @override
  void initState() {
    super.initState();
    totalEarnings = widget.baseFare - widget.platformCommission + widget.tip;
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
        ],
      ),
    );
  }
}
