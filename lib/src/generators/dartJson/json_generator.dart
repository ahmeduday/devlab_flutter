import 'package:devlab_flutter/src/generators/dartJson/json_type.dart';
import 'package:ipsum/ipsum.dart';

String generateDartJson({
  DartJsonType type = DartJsonType.standard,
  bool startWithLorem = false,
  int count = 5,
}) {
  Ipsum i = Ipsum(startWithLorem: startWithLorem);

  try {
    switch (type) {
      // case LipsumType.words:
      //   return i.words(count);
      // case LipsumType.sentences:
      //   return i.sentences(count);
      case DartJsonType.standard:
        return i.paragraphs(count);
      default:
        return "";
    }
  } on Exception catch (_) {
    return "error";
  }
}
