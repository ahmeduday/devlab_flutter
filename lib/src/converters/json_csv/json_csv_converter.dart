import 'dart:convert';
import 'package:devlab_flutter/src/converters/json_csv/json2csv.dart';
import 'package:devlab_flutter/src/formatters/json_formatter/json_formatter.dart';
import 'package:devlab_flutter/src/formatters/indentation.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:yaml/yaml.dart';

String convertJsonToCsv(String text, {required bool sortAlphabetically}) {
  text = applyWebSpaceFix(text);

  try {
    var json = jsonDecode(text);
    if (sortAlphabetically) {
      json = sortJson(json);
      json = jsonDecode(const JsonEncoder().convert(json));
    }
    return jsonToCsv(
      json,
    );
  } on FormatException catch (_) {
    return "invalid_data";
  }
}

String convertCsvToJson(String text, {Indentation? indentation, required bool sortAlphabetically}) {
  text = applyWebSpaceFix(text);

  try {
    final csv = csvToJson(text);

    // return formatJson(jsonEncode(csv), indentation: indentation ?? Indentation.fourSpaces, sortAlphabetically: sortAlphabetically);
    return csv;
  } on YamlException catch (_) {
    return "Invalid CSV data";
  }
}
