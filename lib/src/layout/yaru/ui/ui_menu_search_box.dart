import 'package:devlab_flutter/src/layout/yaru/providers/selected_tool_provider.dart';
import 'package:devlab_flutter/src/layout/yaru/models/yaru_menu_item.dart';
import 'package:devlab_flutter/src/tools.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class UiMenuSearchBox extends HookConsumerWidget {
  const UiMenuSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return DropdownSearch<YaruMenuItem>(
        popupProps: PopupProps.menu(
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            return const Center(child: Text("no tools found"));
          },
        ),
        items: allTools.map((e) => YaruMenuItem(e.name, e.fullTitle, e.route)).toList(),
        dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
          ),
          prefixIconConstraints: BoxConstraints.expand(width: 40, height: 40),
          hintText: "Type to search for tools...",
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          border: UnderlineInputBorder(),
        )),
        onChanged: (tool) {
          if (tool != null) {
            ref.read(selectedToolProvider.notifier).state = getToolByName(tool.name);
            context.go(tool.route);
          }
        });
  }
}
