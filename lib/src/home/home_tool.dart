import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/home/home_group.dart';
import 'package:devlab_flutter/src/home/home_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class HomeTool implements Tool {
  const HomeTool() : super();

  @override
  IconData get icon => Icons.home;

  @override
  String get fullTitle => "all tools";

  @override
  String get route => Routes.home;

  @override
  Group get group => const HomeGroup();

  @override
  String get description => "all tools";

  @override
  String get name => "home";

  @override
  String get shortTitle => "all tools";

  @override
  Widget get page => const HomePage();
}
