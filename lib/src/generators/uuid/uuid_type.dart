import 'package:devlab_flutter/src/described_enum.dart';

enum UuidType {
  v1("v1"),
  v4("v4");

  @override
  final String description;
  const UuidType(this.description);
}
