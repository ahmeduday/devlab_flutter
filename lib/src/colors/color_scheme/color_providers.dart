import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

var selectedColor = StateProvider<Color>((ref) {
  return Colors.white;
});

ThemeData theme = ThemeData();

var containerColorProvider = StateProvider<List<Color>>((ref) => containerColors);
var textColorProvider = StateProvider<List<Color>>((ref) => textColors);
var namesProvider = StateProvider<List<String>>((ref) => names);

List<Color> get containerColors => <Color>[
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

List<Color> get textColors => <Color>[
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
  theme = Get.theme;
}

// void changeColor(Color color) {
//    selectedColor = color;
// }

// class ColorsController {
  // var selectedColor = StateProvider<Color>((ref) {
  //   return Colors.white;
  // });

  // static ThemeData get theme => Get.theme;

  // List<Color> containerColor = [
  //   theme.colorScheme.primary,
  //   theme.colorScheme.primaryContainer,
  //   theme.colorScheme.secondary,
  //   theme.colorScheme.secondaryContainer,
  //   theme.colorScheme.tertiary,
  //   theme.colorScheme.tertiaryContainer,
  //   theme.colorScheme.error,
  //   theme.colorScheme.errorContainer,
  //   theme.colorScheme.background,
  //   theme.colorScheme.surface,
  //   theme.colorScheme.surfaceVariant,
  //   theme.colorScheme.outline,
  //   theme.colorScheme.outlineVariant,
  //   theme.colorScheme.shadow,
  //   theme.colorScheme.scrim,
  //   theme.colorScheme.inverseSurface,
  //   theme.colorScheme.onInverseSurface,
  //   theme.colorScheme.inversePrimary,
  //   theme.colorScheme.surfaceTint,
  // ];

  // List<Color> textColor = [
  //   theme.colorScheme.onPrimary,
  //   theme.colorScheme.onPrimaryContainer,
  //   theme.colorScheme.onSecondary,
  //   theme.colorScheme.onSecondaryContainer,
  //   theme.colorScheme.onTertiary,
  //   theme.colorScheme.onTertiaryContainer,
  //   theme.colorScheme.onError,
  //   theme.colorScheme.onErrorContainer,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onSurface,
  //   theme.colorScheme.onSurfaceVariant,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  //   theme.colorScheme.onBackground,
  // ];

  // void initialize() {}

  // changeColor(Color value) {
  //   selectedColor = value;
  // }

//   final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
//   return false;
// });

// final conversionTypeProvider = StateProvider<JsonCsvConversionType>((ref) {
//   return JsonCsvConversionType.jsonToCsv;
// });

// final indentationProvider = StateProvider<Indentation>((ref) {
//   return Indentation.fourSpaces;
// });

// // final csvStyleProvider = StateProvider<YamlStyle>((ref) => YamlStyle.generic);

// final inputTextProvider = StateProvider<String>((ref) => "");

// final outputTextProvider = StateProvider((ref) {
//   final text = ref.watch(inputTextProvider);
//   final conversionType = ref.watch(conversionTypeProvider);
//   // final yamlStyle = ref.watch(csvStyleProvider);
//   final sortAlphabetically = ref.watch(sortAlphabeticallyProvider);
//   String result;
//   if (conversionType == JsonCsvConversionType.jsonToCsv) {
//     result = convertJsonToCsv(text, sortAlphabetically: sortAlphabetically);
//   } else {
//     result = convertCsvToJson(text, sortAlphabetically: sortAlphabetically, indentation: ref.watch(indentationProvider));
//   }

//   return result;
// });
// }
