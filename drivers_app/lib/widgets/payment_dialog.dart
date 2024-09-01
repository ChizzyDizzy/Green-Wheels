import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import '../methods/common_methods.dart';

class PaymentDialog extends StatefulWidget {
  final String fareAmount;

  PaymentDialog({super.key, required this.fareAmount});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  CommonMethods cMethods = CommonMethods();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white, // Changed background color to white
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Changed container background color to white
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.green, // Added green border color
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 21),

            const Text(
              "COLLECT CASH",
              style: TextStyle(
                color: Colors.black87, // Adjusted text color for contrast
                fontWeight: FontWeight.bold,
                fontSize: 18, // Added font size for better visibility
              ),
            ),

            const SizedBox(height: 21),

            const Divider(
              height: 1.5,
              color: Colors.black87, // Changed divider color to match the theme
              thickness: 1.0,
            ),

            const SizedBox(height: 16),

            Text(
              "LKR ${widget.fareAmount}", // Removed backslash before LKR
              style: const TextStyle(
                color: Colors.black87, // Adjusted text color for contrast
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "This is fare amount ( LKR ${widget.fareAmount} ) to be charged from the user.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87, // Adjusted text color for contrast
                ),
              ),
            ),

            const SizedBox(height: 31),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);

                cMethods.turnOnLocationUpdatesForHomePage();

                Restart.restartApp();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "COLLECT CASH",
                style: TextStyle(
                  color: Colors.white, // Ensured button text color is white for visibility
                ),
              ),
            ),

            const SizedBox(height: 41),
          ],
        ),
      ),
    );
  }
}
