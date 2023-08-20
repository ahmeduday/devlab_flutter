import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/converters/converters_group.dart';
import 'package:devlab_flutter/src/converters/json_csv/json_csv_converter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class JsonCsvConverterTool implements Tool {
  const JsonCsvConverterTool() : super();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get fullTitle => "JSON <> CSV";

  @override
  String get route => Routes.jsonCsvConverter;

  @override
  String get description => "Convert JSON data to CSV and vice versa";

  @override
  Group get group => const ConvertersGroup();

  @override
  String get name => "jsonCsv";

  @override
  String get shortTitle => "JSON <> CSV";

  @override
  Widget get page => const JsonCsvConverterPage();
}
