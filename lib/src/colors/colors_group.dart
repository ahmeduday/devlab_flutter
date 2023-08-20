import 'package:flutter/material.dart';
import '../../group.dart';

class ThemeGroup implements Group {
  const ThemeGroup() : super();

  @override
  IconData get icon => Icons.color_lens;

  @override
  String get name => "colors";
}
