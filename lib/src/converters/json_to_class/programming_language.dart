import 'package:devlab_flutter/src/described_enum.dart';

enum ProgrammingLanguage {
  dart("Dart");

  @override
  final String description;
  const ProgrammingLanguage(this.description);
}
