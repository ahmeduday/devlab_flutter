import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/encoders/base64_image/base64_image_encoder_page.dart';
import 'package:devlab_flutter/src/encoders/encoders_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Base64ImageEncoderTool implements Tool {
  const Base64ImageEncoderTool() : super();

  @override
  IconData get icon => Icons.image;

  @override
  String get fullTitle => "base64_image encoder";

  @override
  String get route => Routes.base64ImageEncoder;

  @override
  String get description => "base64_image_encoder description";

  @override
  Group get group => const EncodersGroup();

  @override
  String get name => "base64image";

  @override
  String get shortTitle => "base64_image encoder";

  @override
  Widget get page => const Base64ImageEncoderPage();
}
