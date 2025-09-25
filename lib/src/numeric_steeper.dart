import 'package:flutter/material.dart';

class NumericSteeper extends StatefulWidget {
  final IconData increaseIcon;
  final IconData decreaseIcon;
  final num minValue;
  final num maxValue;
  final num step;
  final Color backgroundColor;
  final Color overlayColor;
  final Color buttonsBackgroundColor;
  final Color iconsColor;
  final Color dividerColor;
  final num value;

  final ValueChanged<num>? changed;

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

class _NumericSteeperState extends State<NumericSteeper> {
  num value = 0;

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
          VerticalDivider(
            color: widget.dividerColor,
            width: 1,
            endIndent: 5,
            indent: 5,
          ),
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
