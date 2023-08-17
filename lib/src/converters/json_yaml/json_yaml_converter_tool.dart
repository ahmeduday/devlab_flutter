import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/converters/converters_group.dart';
import 'package:devlab_flutter/src/converters/json_yaml/json_yaml_converter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class JsonYamlConverterTool implements Tool {
  const JsonYamlConverterTool() : super();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get fullTitle => "json_yaml converter";

  @override
  String get route => Routes.jsonYamlConverter;

  @override
  String get description => "json_yaml_converter description";

  @override
  Group get group => const ConvertersGroup();

  @override
  String get name => "jsonYaml";

  @override
  String get shortTitle => "json_yaml converter";

  @override
  Widget get page => const JsonYamlConverterPage();
}