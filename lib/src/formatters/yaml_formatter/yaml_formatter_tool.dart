import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/formatters/formatters_group.dart';
import 'package:devlab_flutter/src/formatters/yaml_formatter/yaml_formatter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class YamlFormatterTool implements Tool {
  const YamlFormatterTool() : super();

  @override
  IconData get icon => Icons.short_text;

  @override
  String get fullTitle => "yaml formatter";

  @override
  String get route => Routes.yamlFormatter;

  @override
  Group get group => const FormattersGroup();

  @override
  String get description => "yaml_formatter description";

  @override
  String get name => "yamlformat";

  @override
  String get shortTitle => "yaml formatter";

  @override
  Widget get page => const YamlFormatterPage();
}
