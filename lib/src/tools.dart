// import 'package:devlab_flutter/src/brazil/cpf_cnpj/cnpj_generator_tool.dart';
// import 'package:devlab_flutter/src/brazil/cpf_cnpj/cpf_generator_tool.dart';
import 'package:devlab_flutter/src/converters/json_to_class/json_to_class_converter_tool.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/json_to_sql_converter_tool.dart';
import 'package:devlab_flutter/src/converters/json_yaml/json_yaml_converter_tool.dart';
import 'package:devlab_flutter/src/encoders/base64_image/base64_image_encoder_tool.dart';
import 'package:devlab_flutter/src/encoders/base64_text/base64_text_encoder_tool.dart';
import 'package:devlab_flutter/src/encoders/html/html_encoder_tool.dart';
import 'package:devlab_flutter/src/encoders/url/url_encoder_tool.dart';
import 'package:devlab_flutter/src/formatters/json_formatter/json_formatter_tool.dart';
import 'package:devlab_flutter/src/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:devlab_flutter/src/formatters/xml_formatter/xml_formatter_tool.dart';
import 'package:devlab_flutter/src/formatters/yaml_formatter/yaml_formatter_tool.dart';
import 'package:devlab_flutter/src/generators/lipsum/lipsum_generator_tool.dart';
import 'package:devlab_flutter/src/generators/uuid/uuid_generator_tool.dart';
import 'package:devlab_flutter/src/home/home_tool.dart';
import 'package:devlab_flutter/src/settings/settings_tool.dart';
import 'package:devlab_flutter/src/text/html_preview/html_preview_tool.dart';
import 'package:devlab_flutter/src/text/markdown_preview/markdown_preview_tool.dart';
import 'package:devlab_flutter/src/text/text_diff/text_diff_tool.dart';
import 'package:devlab_flutter/src/text/text_escape/text_escape_tool.dart';
import 'package:devlab_flutter/src/text/text_inspector/text_inspector_tool.dart';
import 'package:devlab_flutter/tool.dart';

const allTools = [
  HomeTool(),
  HtmlEncoderTool(),
  SettingsTool(),
  JsonFormatterTool(),
  SqlFormatterTool(),
  TextEscapeTool(),
  XmlFormatterTool(),
  MarkdownPreviewTool(),
  TextDiffTool(),
  UrlEncoderTool(),
  // CpfGeneratorTool(),
  LipsumGeneratorTool(),
  UuidGeneratorTool(),
  Base64TextEncoderTool(),
  Base64ImageEncoderTool(),
  JsonToClassConverterTool(),
  JsonYamlConverterTool(),
  // CnpjGeneratorTool(),
  HtmlPreviewTool(),
  TextInspectorTool(),
  JsonToSqlConverterTool(),
  YamlFormatterTool()
];

Tool getToolByName(String name) => allTools.firstWhere((t) => t.name == name);
