import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        final isCompleted = index < currentStep;
        final isActive = index == currentStep;

        return Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: isCompleted
                  ? Theme.of(context).colorScheme.primary
                  : isActive
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300],
              child: isCompleted && !isActive
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            if (index != 2) ...[
              const SizedBox(width: 4),
              Container(
                width: 70,
                height: 2,
                color: Colors.grey[300],
              ),
              const SizedBox(width: 0),
            ]
          ],
        );
      }),
    );
  }
}
