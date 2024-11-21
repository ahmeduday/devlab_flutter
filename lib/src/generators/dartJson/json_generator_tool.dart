import 'package:devlab_flutter/src/generators/dartJson/json_generator_page.dart';
import 'package:devlab_flutter/src/generators/generators_group.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class DartJsonGeneratorTool implements Tool {
  const DartJsonGeneratorTool() : super();

  @override
  IconData get icon => Icons.text_snippet_rounded;

  @override
  String get fullTitle => "Dart to Json generator";

  @override
  String get route => Routes.lipsumGenerator;

  @override
  String get description => "dartjson_generator description";

  @override
  Group get group => const GeneratorsGroup();

  @override
  String get name => "Json";

  @override
  String get shortTitle => "Json";

  @override
  Widget get page => const DartJsonGeneratorPage();
}
