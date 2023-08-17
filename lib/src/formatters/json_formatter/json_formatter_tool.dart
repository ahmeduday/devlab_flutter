import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/formatters/formatters_group.dart';
import 'package:devlab_flutter/src/formatters/json_formatter/json_formatter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class JsonFormatterTool implements Tool {
  const JsonFormatterTool() : super();

  @override
  IconData get icon => Icons.data_object;

  @override
  String get fullTitle => "json formatter";

  @override
  String get route => Routes.jsonFormatter;

  @override
  Group get group => const FormattersGroup();

  @override
  String get description => "Indent or minify JSON data";

  @override
  String get name => "jsonformat";

  @override
  String get shortTitle => "JSON";

  @override
  Widget get page => const JsonFormatterPage();
}
