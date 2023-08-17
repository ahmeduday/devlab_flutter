import 'package:devlab_flutter/src/described_enum.dart';

enum SqlDialect {
  generic("generic_sql");

  @override
  final String description;

  const SqlDialect(this.description);
}
