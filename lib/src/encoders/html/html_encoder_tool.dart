import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/encoders/encoders_group.dart';
import 'package:devlab_flutter/src/encoders/html/html_encoder_page.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:flutter/material.dart';

class HtmlEncoderTool implements Tool {
  const HtmlEncoderTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get fullTitle => "html encoder";

  @override
  String get route => Routes.htmlEncoder;

  @override
  String get description => "Encode or decode all the applicable characters to their corresponding HTML entities";

  @override
  Group get group => const EncodersGroup();

  @override
  String get name => "html";

  @override
  String get shortTitle => "html encoder";

  @override
  Widget get page => const HtmlEncoderPage();
}
