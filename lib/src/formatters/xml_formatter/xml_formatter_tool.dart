import 'package:devlab_flutter/src/formatters/xml_formatter/xml_formatter_page.dart';
import 'package:devlab_flutter/src/routes.dart';
import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/formatters/formatters_group.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class XmlFormatterTool implements Tool {
  const XmlFormatterTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get fullTitle => "xml formatter";

  @override
  String get route => Routes.xmlFormatter;

  @override
  String get description => "xml_formatter description";

  @override
  String get name => "xmlformat";

  @override
  String get shortTitle => "xml formatter";

  @override
  Group get group => const FormattersGroup();

  @override
  Widget get page => const XmlFormatterPage();
}
