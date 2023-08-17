import 'package:devlab_flutter/src/tools.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedToolProvider = StateProvider<Tool>((ref) {
  return getToolByName("home");
});
