import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/text/markdown_preview/markdown_preview_page.dart';
import 'package:devlab_flutter/src/text/text_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class MarkdownPreviewTool implements Tool {
  const MarkdownPreviewTool() : super();

  @override
  IconData get icon => Icons.insert_drive_file_sharp;

  @override
  String get fullTitle => "markdown preview";

  @override
  String get route => Routes.markdownPreview;

  @override
  String get description => "markdown_preview description";

  @override
  Group get group => const TextGroup();

  @override
  String get name => "markdown";

  @override
  String get shortTitle => "markdown preview";

  @override
  Widget get page => const MarkdownPreviewPage();
}
