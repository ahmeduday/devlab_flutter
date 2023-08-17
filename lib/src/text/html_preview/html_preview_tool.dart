import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/text/html_preview/html_preview_page.dart';
import 'package:devlab_flutter/src/text/text_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class HtmlPreviewTool implements Tool {
  const HtmlPreviewTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get fullTitle => "html preview";

  @override
  String get route => Routes.htmlPreview;

  @override
  String get description => "html_preview description";

  @override
  Group get group => const TextGroup();

  @override
  String get name => "htmlpreview";

  @override
  String get shortTitle => "html preview";

  @override
  Widget get page => const HtmlPreviewPage();
}
