import 'package:devlab_flutter/src/described_enum.dart';

enum ConversionMode {
  encode("encode"),
  decode("decode");

  @override
  final String description;

  const ConversionMode(this.description);
}
