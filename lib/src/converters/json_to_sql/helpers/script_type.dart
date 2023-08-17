import 'package:devlab_flutter/src/described_enum.dart';

enum ScriptType {
  insert("Insert"),
  update("Update"),
  delete("Delete");

  @override
  final String description;
  const ScriptType(this.description);
}
