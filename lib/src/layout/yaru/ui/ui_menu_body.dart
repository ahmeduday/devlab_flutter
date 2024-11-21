import 'package:devlab_flutter/group.dart';
import 'package:devlab_flutter/src/groups.dart';
import 'package:devlab_flutter/src/layout/yaru/providers/selected_group_provider.dart';
import 'package:devlab_flutter/src/layout/yaru/providers/selected_tool_provider.dart';
import 'package:devlab_flutter/src/tools.dart';
import 'package:devlab_flutter/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';

class UiMenuBody extends ConsumerWidget {
  const UiMenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Expanded(
          child: YaruExpansionPanel(
            height: 600,
            headers: allGroups.map<Widget>(
              (Group group) {
                return Text(
                  '${group.name} Tools',
                );
              },
            ).toList(),
            // expansionCallback: (int index, bool isExpanded) {
            //   ref.read(selectedGroupProvider.notifier).state = allGroups[index];
            // },
            children: allGroups.map<Widget>((Group group) {
              return YaruExpandable(
                header: GestureDetector(
                  onTap: () {
                    final home = getToolByName("home");
                    ref.read(selectedToolProvider.notifier).state = home;
                    if (ref.watch(selectedGroupProvider)?.name == group.name) {
                      ref.read(selectedGroupProvider.notifier).state = null;
                    } else {
                      ref.read(selectedGroupProvider.notifier).state = group;
                    }
                    context.go(home.route);
                  },
                  child: ListTile(
                    title: Text(group.name),
                    leading: Icon(group.icon),
                    hoverColor: Colors.transparent,
                    tileColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
                    selected:
                        ref.watch(selectedGroupProvider)?.name == group.name,
                  ),
                ),
                isExpanded:
                    ref.watch(selectedGroupProvider)?.name == group.name,
                child: Column(
                  children: ListTile.divideTiles(
                      context: context,
                      tiles: allTools
                          .where((t) => t.group.name == group.name)
                          .map<ListTile>((Tool tool) {
                        return ListTile(
                          title: Text(tool.shortTitle),
                          selected:
                              ref.watch(selectedToolProvider).name == tool.name,
                          leading: Icon(tool.icon),
                          onTap: () {
                            ref.read(selectedToolProvider.notifier).state =
                                tool;
                            context.go(tool.route);
                          },
                        );
                      })).toList(),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
