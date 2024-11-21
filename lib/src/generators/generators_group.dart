import 'package:flutter/material.dart';
import '../../group.dart';

class GeneratorsGroup implements Group {
  const GeneratorsGroup() : super();

  @override
  IconData get icon => Icons.copy;

  @override
  String get name => "generators";
}
