import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String message;
  final VoidCallback onConfirm;
  final String canceltext;
  final String confirmText;

  const ConfirmationDialog({
    super.key,
    this.title,
    required this.message,
    required this.onConfirm,
    required this.confirmText,
    required this.canceltext,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            if (title != null)
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF04315A),
                ),
                textAlign: TextAlign.center,
              ),

            const SizedBox(height: 16),

            /// Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 24),

            /// Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel Button
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    canceltext,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

                // Confirm Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    onConfirm(); // Perform action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF04315A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    confirmText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
