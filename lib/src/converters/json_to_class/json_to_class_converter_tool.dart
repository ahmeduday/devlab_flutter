import 'package:devlab_flutter/src/converters/converters_group.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/converters/json_to_class/json_to_class_converter_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToClassConverterTool implements Tool {
  const JsonToClassConverterTool() : super();

  @override
  IconData get icon => Icons.data_object;

  @override
  String get fullTitle => "json_to class";

  @override
  String get route => Routes.jsonToClass;

  @override
  String get description => "json_to_class description";

  @override
  Group get group => const ConvertersGroup();

  @override
  String get name => "jsonToClass";

  @override
  String get shortTitle => "json_to class";

  @override
  Widget get page => const JsonToClassConverterPage();
}
