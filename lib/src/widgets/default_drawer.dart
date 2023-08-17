import 'package:devlab_flutter/src/layout/yaru/ui/ui_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultDrawer extends ConsumerWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Drawer(child: UiMenu());
  }
}