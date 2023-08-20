import 'package:devlab_flutter/src/described_enum.dart';

enum JsonCsvConversionType implements DescribedEnum {
  csvToJson("CSV to JSON"),
  jsonToCsv("JSON to CSV");

  @override
  final String description;
  const JsonCsvConversionType(this.description);
}
