import 'package:flutter/material.dart';

class DangerDialogBox extends StatelessWidget {
  final String? title;
  final String message;
  final VoidCallback onConfirm;
  final String canceltext;
  final String confirmText;

  const DangerDialogBox({
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
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 24),

            /// Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Cancel Button
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    backgroundColor: Color(0xFFC3C3C3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    canceltext,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

                // Confirm Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    onConfirm(); // Perform action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
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
