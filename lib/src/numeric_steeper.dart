import 'package:flutter/material.dart';

/// This widget allows users to increase or decrease a numeric value within a defined range.
/// It supports customization of icons, colors, step size, and callbacks.
class NumericSteeper extends StatefulWidget {
  /// Icon to display for the increase button. Defaults to [Icons.add].
  final IconData increaseIcon;

  /// Icon to display for the decrease button. Defaults to [Icons.remove].
  final IconData decreaseIcon;

  /// The minimum value that the stepper can reach. Defaults to 0.
  final num minValue;

  /// The maximum value that the stepper can reach. Defaults to 100.
  final num maxValue;

  /// The amount to increment or decrement the value by. Defaults to 1.
  final num step;

  /// Background color of the container surrounding the stepper. Defaults to [Colors.black12].
  final Color backgroundColor;

  /// Overlay color shown when a button is pressed. Defaults to [Colors.black12].
  final Color overlayColor;

  /// Background color of the increment/decrement buttons. Defaults to transparent.
  final Color buttonsBackgroundColor;

  /// Color of the icons inside the buttons. Defaults to [Colors.black].
  final Color iconsColor;

  /// Color of the vertical divider between the buttons. Defaults to [Colors.black12].
  final Color dividerColor;

  /// The current numeric value to display.
  final num value;

  /// Callback triggered when the value changes (either incremented or decremented).
  final ValueChanged<num>? changed;

  /// Creates a [NumericSteeper] widget.
  ///
  /// The [value] parameter is required and represents the current numeric value.
  /// Optional parameters allow customization of visuals and behavior.
  const NumericSteeper({
    super.key,
    required this.value,
    this.increaseIcon = Icons.add,
    this.decreaseIcon = Icons.remove,
    this.backgroundColor = Colors.black12,
    this.buttonsBackgroundColor = Colors.transparent,
    this.overlayColor = Colors.black12,
    this.minValue = 0,
    this.maxValue = 100,
    this.step = 1,
    this.iconsColor = Colors.black,
    this.dividerColor = Colors.black12,
    this.changed,
  });

  @override
  State<NumericSteeper> createState() => _NumericSteeperState();
}

/// The internal state for the [NumericSteeper] widget.
class _NumericSteeperState extends State<NumericSteeper> {
  /// The current value being manipulated.
  num value = 0;

  /// The button style used for the increment and decrement buttons.
  ButtonStyle _steeperButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    overlayColor: WidgetStateProperty.all(Colors.grey.shade400),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ),
  );

  @override
  void didUpdateWidget(covariant NumericSteeper oldWidget) {
    super.didUpdateWidget(oldWidget);

    value = widget.value;

    _steeperButtonStyle = ButtonStyle(
      overlayColor: WidgetStateProperty.all(widget.overlayColor),
      backgroundColor: WidgetStateProperty.all(widget.buttonsBackgroundColor),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.backgroundColor,
      ),
      child: Row(
        children: [
          // Decrease button
          Expanded(
            child: FilledButton(
              style: _steeperButtonStyle,
              onPressed: () {
                if (widget.changed == null) return;
                if (widget.value > widget.minValue) {
                  value = (widget.value - widget.step) < widget.minValue
                      ? widget.minValue
                      : widget.value - widget.step;
                  widget.changed!(value);
                }
              },
              child: Center(
                child: Icon(
                  widget.decreaseIcon,
                  size: 14,
                  color: widget.iconsColor,
                ),
              ),
            ),
          ),

          // Divider
          VerticalDivider(
            color: widget.dividerColor,
            width: 1,
            endIndent: 5,
            indent: 5,
          ),

          // Increase button
          Expanded(
            child: FilledButton(
              style: _steeperButtonStyle,
              onPressed: () {
                if (widget.changed == null) return;
                if (widget.value < widget.maxValue) {
                  value = (widget.value + widget.step) > widget.maxValue
                      ? widget.maxValue
                      : widget.value + widget.step;
                  widget.changed!(value);
                }
              },
              child: Center(
                child: Icon(
                  widget.increaseIcon,
                  size: 14,
                  color: widget.iconsColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}