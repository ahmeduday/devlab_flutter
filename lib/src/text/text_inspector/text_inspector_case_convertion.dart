import 'package:devlab_flutter/src/described_enum.dart';

enum CaseConvertion {
  originalText("Original text"),
  lowerCase("lower case"),
  upperCase("UPPER CASE"),
  constantCase("CONSTANT_CASE"),
  sentenceCase("Sentence case"),
  snakeCase("snake_case"),
  paramCase("param-case"),
  pathCase("path/case"),
  pascalCase("PascalCase"),
  headerCase("Header-Case"),
  titleCase("Title Case"),
  camelCase("camelCase"),
  dotCase("dot.case");

  @override
  final String description;

  const CaseConvertion(this.description);
}
