import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/encoders/encoders_group.dart';
import 'package:devlab_flutter/src/encoders/url/url_encoder_page.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UrlEncoderTool implements Tool {
  const UrlEncoderTool() : super();

  @override
  IconData get icon => Icons.link;

  @override
  String get fullTitle => "url encoder";

  @override
  String get route => Routes.urlEncoder;

  @override
  String get description => "url_encoder description";

  @override
  Group get group => const EncodersGroup();

  @override
  String get name => "url-encode";

  @override
  String get shortTitle => "url encoder";

  @override
  Widget get page => const UrlEncoderPage();
}
