import 'package:devlab_flutter/src/converters/json_csv/json_csv_conversion_type.dart';
import 'package:devlab_flutter/src/converters/json_csv/json_csv_converter.dart';
import 'package:devlab_flutter/src/formatters/indentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
  return false;
});

final conversionTypeProvider = StateProvider<JsonCsvConversionType>((ref) {
  return JsonCsvConversionType.jsonToCsv;
});

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});

// final csvStyleProvider = StateProvider<YamlStyle>((ref) => YamlStyle.generic);

final inputTextProvider = StateProvider<String>((ref) => "");

final outputTextProvider = StateProvider((ref) {
  final text = ref.watch(inputTextProvider);
  final conversionType = ref.watch(conversionTypeProvider);
  // final yamlStyle = ref.watch(csvStyleProvider);
  final sortAlphabetically = ref.watch(sortAlphabeticallyProvider);
  String result;
  if (conversionType == JsonCsvConversionType.jsonToCsv) {
    result = convertJsonToCsv(text, sortAlphabetically: sortAlphabetically);
  } else {
    result = convertCsvToJson(text, sortAlphabetically: sortAlphabetically, indentation: ref.watch(indentationProvider));
  }

  return result;
});
