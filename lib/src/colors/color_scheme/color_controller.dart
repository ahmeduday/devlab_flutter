import 'package:flutter/material.dart';
import 'package:get/get.dart';

// var selectedColor = StateProvider<Color>((ref) {
//   return Colors.white;
// });

// ThemeData theme = ThemeData();

// var containerColorProvider = StateProvider<List<Color>>((ref) => containerColors);
// var textColorProvider = StateProvider<List<Color>>((ref) => textColors);
// var namesProvider = StateProvider<List<String>>((ref) => names);

// List<Color> get containerColors => <Color>[
//       theme.colorScheme.primary,
//       theme.colorScheme.primaryContainer,
//       theme.colorScheme.secondary,
//       theme.colorScheme.secondaryContainer,
//       theme.colorScheme.tertiary,
//       theme.colorScheme.tertiaryContainer,
//       theme.colorScheme.error,
//       theme.colorScheme.errorContainer,
//       theme.colorScheme.background,
//       theme.colorScheme.surface,
//       theme.colorScheme.surfaceVariant,
//       theme.colorScheme.outline,
//       theme.colorScheme.outlineVariant,
//       theme.colorScheme.shadow,
//       theme.colorScheme.scrim,
//       theme.colorScheme.inverseSurface,
//       theme.colorScheme.onInverseSurface,
//       theme.colorScheme.inversePrimary,
//       theme.colorScheme.surfaceTint,
//     ];

// List<Color> get textColors => <Color>[
//       theme.colorScheme.onPrimary,
//       theme.colorScheme.onPrimaryContainer,
//       theme.colorScheme.onSecondary,
//       theme.colorScheme.onSecondaryContainer,
//       theme.colorScheme.onTertiary,
//       theme.colorScheme.onTertiaryContainer,
//       theme.colorScheme.onError,
//       theme.colorScheme.onErrorContainer,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onSurface,
//       theme.colorScheme.onSurfaceVariant,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//       theme.colorScheme.onBackground,
//     ];

// List<String> get names => <String>[
//       'primary',
//       'primaryContainer',
//       'secondary',
//       'secondaryContainer',
//       'tertiary',
//       'tertiaryContainer',
//       'error',
//       'errorContainer',
//       'background',
//       'surface',
//       'surfaceVariant',
//       'outline',
//       'outlineVariant',
//       'shadow',
//       'scrim',
//       'inverseSurface',
//       'onInverseSurface',
//       'inversePrimary',
//       'surfaceTint',
//     ];

// void initialize() {
//   theme = Get.theme;
// }

// void changeColor(Color color) {
//    selectedColor = color;
// }

class ColorsController {
  Rx<Color> selectedColor = Colors.white.obs;

  var containerColorProvider = RxList<Color>();
  var textColorProvider = RxList<Color>();
  var namesProvider = RxList<String>();

  ThemeData theme = ThemeData();

  List<Color> get containerColor => [
        theme.colorScheme.primary,
        theme.colorScheme.primaryContainer,
        theme.colorScheme.secondary,
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.tertiary,
        theme.colorScheme.tertiaryContainer,
        theme.colorScheme.error,
        theme.colorScheme.errorContainer,
        theme.colorScheme.background,
        theme.colorScheme.surface,
        theme.colorScheme.surfaceVariant,
        theme.colorScheme.outline,
        theme.colorScheme.outlineVariant,
        theme.colorScheme.shadow,
        theme.colorScheme.scrim,
        theme.colorScheme.inverseSurface,
        theme.colorScheme.onInverseSurface,
        theme.colorScheme.inversePrimary,
        theme.colorScheme.surfaceTint,
      ];

  List<Color> get textColor => [
        theme.colorScheme.onPrimary,
        theme.colorScheme.onPrimaryContainer,
        theme.colorScheme.onSecondary,
        theme.colorScheme.onSecondaryContainer,
        theme.colorScheme.onTertiary,
        theme.colorScheme.onTertiaryContainer,
        theme.colorScheme.onError,
        theme.colorScheme.onErrorContainer,
        theme.colorScheme.onBackground,
        theme.colorScheme.onSurface,
        theme.colorScheme.onSurfaceVariant,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
        theme.colorScheme.onBackground,
      ];

  List<String> get names => <String>[
        'primary',
        'primaryContainer',
        'secondary',
        'secondaryContainer',
        'tertiary',
        'tertiaryContainer',
        'error',
        'errorContainer',
        'background',
        'surface',
        'surfaceVariant',
        'outline',
        'outlineVariant',
        'shadow',
        'scrim',
        'inverseSurface',
        'onInverseSurface',
        'inversePrimary',
        'surfaceTint',
      ];

  void initialize() {
    selectedColor.value = Colors.white;
    theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: selectedColor.value),
      useMaterial3: true,
    );

    containerColorProvider = RxList<Color>(containerColor);
    textColorProvider = RxList<Color>(textColor);
    namesProvider = RxList<String>(names);
  }

  changeColor(Color value) {
    selectedColor.value = value;
    theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: selectedColor.value),
      useMaterial3: true,
    );

    containerColorProvider.value = containerColor;
    textColorProvider.value = textColor;
    // namesProvider = RxList<String>(names);
  }
}
