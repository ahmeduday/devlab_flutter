import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/encoders/base64_text/base64_text_encoder_page.dart';
import 'package:devlab_flutter/src/encoders/encoders_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Base64TextEncoderTool implements Tool {
  const Base64TextEncoderTool() : super();

  @override
  IconData get icon => Icons.text_snippet_sharp;

  @override
  String get fullTitle => "base64_text encoder";

  @override
  String get route => Routes.base64TextEncoder;

  @override
  String get description => "base64_text_encoder description";

  @override
  Group get group => const EncodersGroup();

  @override
  String get name => "base64text";

  @override
  String get shortTitle => "base64_text encoder";

  @override
  Widget get page => const Base64TextEncoderPage();
}
