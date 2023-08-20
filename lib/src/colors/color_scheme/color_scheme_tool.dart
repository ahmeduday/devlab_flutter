import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/colors/color_scheme/flutter_colors_page.dart';
import 'package:devlab_flutter/src/colors/colors_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class ColorSchemeTool implements Tool {
  const ColorSchemeTool() : super();

  @override
  IconData get icon => Icons.color_lens;

  @override
  String get fullTitle => "Color Scheme";

  @override
  String get route => Routes.colorScheme;

  @override
  String get description => "experiment with colors";

  @override
  Group get group => const ThemeGroup();

  @override
  String get name => "colorScheme";

  @override
  String get shortTitle => "Color Scheme";

  @override
  Widget get page => FlutterColorsPage();
}
