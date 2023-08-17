import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/text/text_diff/text_diff_page.dart';
import 'package:devlab_flutter/src/text/text_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class TextDiffTool implements Tool {
  const TextDiffTool() : super();

  @override
  IconData get icon => Icons.difference;

  @override
  String get fullTitle => "text diff";

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff description";

  @override
  Group get group => const TextGroup();

  @override
  String get name => "diff";

  @override
  String get shortTitle => "text diff";

  @override
  Widget get page => const TextDiffPage();
}
