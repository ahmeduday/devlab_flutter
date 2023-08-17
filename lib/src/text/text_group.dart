import 'package:devlab_flutter/group.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextGroup implements Group {
  const TextGroup() : super();
  @override
  IconData get icon => Icons.format_size;

  @override
  String get name => "text";
}
