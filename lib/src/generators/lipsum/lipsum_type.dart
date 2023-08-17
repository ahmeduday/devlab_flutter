import 'package:devlab_flutter/src/described_enum.dart';

enum LipsumType {
  words("words"),
  sentences("sentences"),
  paragraphs("paragraphs");

  @override
  final String description;
  const LipsumType(this.description);
}