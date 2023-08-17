import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/text/text_group.dart';
import 'package:devlab_flutter/src/text/text_inspector/text_inspector_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextInspectorTool implements Tool {
  const TextInspectorTool() : super();

  @override
  IconData get icon => Icons.text_fields;

  @override
  String get fullTitle => "text inspector";

  @override
  String get route => Routes.textInspector;

  @override
  String get description => "text_inspector description";

  @override
  Group get group => const TextGroup();

  @override
  String get name => "textInspector";

  @override
  String get shortTitle => "text inspector";

  @override
  Widget get page => const TextInspectorPage();
}
