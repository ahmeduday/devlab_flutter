import 'package:devlab_flutter/src/generators/dartJson/json_generator.dart';
import 'package:devlab_flutter/src/generators/dartJson/json_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dartJsonTypeProvider =
    StateProvider<DartJsonType>((ref) => DartJsonType.standard);
final startWithLoremProvider = StateProvider<bool>((ref) => true);
final amountProvider = StateProvider<int>((ref) => 10);
final outputTextProvider = StateProvider<String>((ref) => generateDartJson(
      type: ref.watch(dartJsonTypeProvider),
      count: ref.watch(amountProvider),
      startWithLorem: ref.watch(startWithLoremProvider),
    ));
