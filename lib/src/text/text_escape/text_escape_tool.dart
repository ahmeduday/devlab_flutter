import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/text/text_escape/text_escape_page.dart';
import 'package:devlab_flutter/src/text/text_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

class TextEscapeTool implements Tool {
  const TextEscapeTool() : super();

  @override
  IconData get icon => Icons.text_format;

  @override
  String get fullTitle => "Text Escape / Unescape";

  @override
  String get route => Routes.textEscape;

  @override
  String get description => "Escapes or unescapes a string, removing characters that could prevent parsing.";

  @override
  Group get group => const TextGroup();

  @override
  String get name => "escape";

  @override
  String get shortTitle => "Escape / Unescape";

  @override
  Widget get page => const TextEscapePage();
}
