import 'package:devlab_flutter/src/formatters/indentation.dart';
import 'package:devlab_flutter/src/formatters/json_formatter/json_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
  return false;
});

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});

final inputTextProvider = StateProvider<String>((ref) => "");

final outputTextProvider = StateProvider<String>((ref) => formatJson(ref.watch(inputTextProvider),
    indentation: ref.watch(indentationProvider), sortAlphabetically: ref.watch(sortAlphabeticallyProvider)));
