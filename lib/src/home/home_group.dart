import 'package:devlab_flutter/group.dart';
import 'package:flutter/material.dart';

class HomeGroup implements Group {
  const HomeGroup() : super();

  @override
  IconData get icon => Icons.house;

  @override
  String get name => "home";
}
