# numeric_steeper

[![pub version](https://img.shields.io/pub/v/numeric_steeper.svg)](https://pub.dev/packages/numeric_steeper)
[![likes](https://img.shields.io/pub/likes/numeric_steeper.svg)](https://pub.dev/packages/numeric_steeper)
[![pub points](https://img.shields.io/pub/points/numeric_steeper.svg)](https://pub.dev/packages/numeric_steeper)

A custom, minimal **iOS-style stepper widget** for Flutter.  
Inspired by Swift’s `UIStepper`, this widget allows users to increment or decrement a numeric value with a sleek, iOS-like look.

![demo](example/demo.gif)

---

## ✨ Features

- Fully **iOS-styled**.
- Lightweight and dependency-free.
- Supports custom step size, min/max limits, and change callbacks.
- Support interval to increment/decrement when button is pressed.
- Customizable icons for increment and decrement buttons.
- Works with any number type values.
- Customizable appearance to fit your app's theme (background, buttons background, borders, outlines, etc.).
- Easy to integrate into any Flutter project.
- Works with Flutter web, mobile, and desktop.
- Supports Fontawesome icons or any other icon pack.

---

## 🚀 Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  numeric_steeper: ^0.1.0
```

Import the package:

```dart
import 'package:numeric_steeper/numeric_steeper.dart';
```

Use the `NumericSteeper` widget in your Flutter app:

```dart
              NumericSteeper(
                minValue: 8,
                maxValue: 30,
                step: 1,
                increaseIcon: Icons.add,
                decreaseIcon: Icons.remove,
                backgroundColor: Colors.grey.shade200,
                buttonsBackgroundColor: Colors.transparent,
                overlayColor: Colors.grey.shade400,
                iconsColor: Colors.black,
                dividerColor: Colors.grey.shade400,
                changed: (value) {
                  // Handle value change
                  print('New value: $value');
                },
              );
```

### Example




