import 'package:devlab_flutter/src/formatters/indentation.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:xml/xml.dart';

String formatXml(String input, {Indentation indentation = Indentation.fourSpaces}) {
  XmlDocument? xml;

  try {
    input = applyWebSpaceFix(input);
    xml = XmlDocument.parse(input);
  } on FormatException catch (_) {
    return "invalid_xml_data";
  }

  return xml.toXmlString(pretty: indentation != Indentation.compact, indent: indentation.toString());
}
