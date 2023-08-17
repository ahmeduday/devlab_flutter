import 'package:devlab_flutter/src/generators/generators_group.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/generators/uuid/uuid_generator_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UuidGeneratorTool implements Tool {
  const UuidGeneratorTool() : super();

  @override
  IconData get icon => Icons.person;

  @override
  String get fullTitle => "uuid generator";

  @override
  String get route => Routes.uuidGenerator;

  @override
  String get description => "uuid_generator description";

  @override
  Group get group => const GeneratorsGroup();

  @override
  String get name => "uuid";

  @override
  String get shortTitle => "uuid";

  @override
  Widget get page => const UuidGeneratorPage();
}
