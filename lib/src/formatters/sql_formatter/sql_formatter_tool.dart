import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/formatters/formatters_group.dart';
import 'package:devlab_flutter/src/formatters/sql_formatter/sql_formatter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class SqlFormatterTool implements Tool {
  const SqlFormatterTool() : super();

  @override
  IconData get icon => Icons.storage;

  @override
  String get fullTitle => "SQL Formatter";

  @override
  Group get group => const FormattersGroup();

  @override
  String get route => Routes.sqlFormatter;

  @override
  String get description => "Indent SQL queries";

  @override
  String get name => "sql_formatter";

  @override
  String get shortTitle => "SQL";

  @override
  Widget get page => const SqlFormatterPage();
}
