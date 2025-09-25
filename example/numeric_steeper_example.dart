import 'package:flutter/material.dart';
import 'package:numeric_steeper/numeric_steeper.dart';

/// The main function to run the example app.
void main() {
  runApp(const NumericSteeperExampleApp());
}

/// A simple example of how to use the NumericSteeper widget.
class NumericSteeperExampleApp extends StatelessWidget {
  // Constructor
  const NumericSteeperExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numeric Steeper Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Numeric Steeper Example')),
        body: const Center(
          child: NumericSteeperExample(),
        ),
      ),
    );
  }
}

/// The example widget that demonstrates the NumericSteeper.
class NumericSteeperExample extends StatefulWidget {
  // Constructor
  const NumericSteeperExample({super.key});

  @override
  State<NumericSteeperExample> createState() => _NumericSteeperExampleState();
}

/// The state for the NumericSteeperExample widget.
class _NumericSteeperExampleState extends State<NumericSteeperExample> {
  // Initial value for the NumericSteeper.
  int _value = 5;

  // Build method to render the NumericSteeper widget.
  @override
  Widget build(BuildContext context) {
    // Return the NumericSteeper widget with specified properties.
    return NumericSteeper(
      value: _value,
      changed: (newValue) {
        setState(() {
          _value = newValue.toInt();
        });
      },
      backgroundColor: Colors.grey.shade300,
      buttonsBackgroundColor: Colors.grey.shade600,
      iconsColor: Colors.white,
      minValue: 0,
      maxValue: 10,
      step: 1,
    );
  }
}
