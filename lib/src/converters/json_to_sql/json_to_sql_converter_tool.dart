import 'package:devlab_flutter/src/converters/converters_group.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/page/json_to_sql_converter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToSqlConverterTool implements Tool {
  const JsonToSqlConverterTool() : super();

  @override
  IconData get icon => Icons.storage;

  @override
  String get fullTitle => "json_to sql";

  @override
  String get route => Routes.jsonToSql;

  @override
  String get description => "json_to_sql description";

  @override
  Group get group => const ConvertersGroup();

  @override
  String get name => "jsonToSql";

  @override
  String get shortTitle => "json_to sql";

  @override
  Widget get page => const JsonToSqlConverterPage();
}
