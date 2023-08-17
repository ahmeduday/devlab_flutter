import 'package:devlab_flutter/src/described_enum.dart';

enum Base64EncodingType {
  utf8("UTF-8"),
  ascii("ASCII");

  @override
  final String description;

  const Base64EncodingType(this.description);
}
