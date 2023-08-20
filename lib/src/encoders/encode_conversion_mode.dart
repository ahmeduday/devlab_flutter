import 'package:devlab_flutter/src/described_enum.dart';

enum ConversionMode implements DescribedEnum {
  encode("encode"),
  decode("decode");

  @override
  final String description;

  const ConversionMode(this.description);
}
