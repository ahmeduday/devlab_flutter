import 'package:devlab_flutter/src/described_enum.dart';

enum DartJsonType implements DescribedEnum {
  standard("Standard");

  @override
  final String description;
  const DartJsonType(this.description);
}
