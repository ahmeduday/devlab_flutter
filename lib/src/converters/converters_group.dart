import 'package:flutter/material.dart';
import '../../group.dart';

class ConvertersGroup implements Group {
  const ConvertersGroup() : super();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get name => "Converters";
}
