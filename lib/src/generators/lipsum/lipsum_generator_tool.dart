import 'package:devlab_flutter/src/generators/generators_group.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/generators/lipsum/lipsum_generator_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LipsumGeneratorTool implements Tool {
  const LipsumGeneratorTool() : super();

  @override
  IconData get icon => Icons.text_snippet_rounded;

  @override
  String get fullTitle => "lipsum generator";

  @override
  String get route => Routes.lipsumGenerator;

  @override
  String get description => "lipsum_generator description";

  @override
  Group get group => const GeneratorsGroup();

  @override
  String get name => "lipsum";

  @override
  String get shortTitle => "lipsum";

  @override
  Widget get page => const LipsumGeneratorPage();
}
