import 'package:devlab_flutter/src/home/home_card.dart';
import 'package:devlab_flutter/src/layout/yaru/providers/selected_group_provider.dart';
import 'package:devlab_flutter/src/settings/settings_provider.dart';
import 'package:devlab_flutter/src/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_grid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final selectedGroup = ref.watch(selectedGroupProvider);
    final settings = ref.watch(settingsProvider);

    final tools =
        allTools.where((t) => selectedGroup != null ? t.group.name == selectedGroup.name : t.group.name != "home").toList();

    return ResponsiveGridView.builder(
      itemCount: tools.length,
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      gridDelegate: const ResponsiveGridDelegate(
          crossAxisSpacing: 50, mainAxisSpacing: 50, childAspectRatio: 3 / 1.7, maxCrossAxisExtent: 300, minCrossAxisExtent: 300),
      itemBuilder: (BuildContext context, int index) => HomeCard(tools[index], settings.colorSeed),
    );
  }
}
