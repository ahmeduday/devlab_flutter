import 'package:devlab_flutter/src/encoders/base64_text/base64_encoding_type.dart';
import 'package:devlab_flutter/src/encoders/encode_conversion_mode.dart';
import 'package:devlab_flutter/src/encoders/html/html_encoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputTextProvider = StateProvider<String>((ref) => "");

final conversionModeProvider = StateProvider<ConversionMode>((ref) => ConversionMode.encode);

final encodingTypeProvider = StateProvider<Base64EncodingType>((ref) => Base64EncodingType.utf8);

final outputTextProvider = StateProvider<String>((ref) {
  final conversionMode = ref.watch(conversionModeProvider);

  final inputText = ref.watch(inputTextProvider);

  if (conversionMode == ConversionMode.encode) {
    return encodeHtml(inputText);
  } else {
    return decodeHtml(inputText);
  }
});
