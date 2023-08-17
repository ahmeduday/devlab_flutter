import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/home/home_group.dart';
import 'package:devlab_flutter/src/settings/settings_page.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class SettingsTool implements Tool {
  const SettingsTool() : super();

  @override
  IconData get icon => Icons.settings;

  @override
  String get fullTitle => "settings";

  @override
  String get route => Routes.settings;

  @override
  Group get group => const HomeGroup();

  @override
  String get description => "settings";

  @override
  String get name => "settings";

  @override
  String get shortTitle => "Settings";

  @override
  Widget get page => const SettingsPage();
}
