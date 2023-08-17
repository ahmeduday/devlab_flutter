import 'package:devlab_flutter/src/layout/yaru/ui/ui_menu_header.dart';
import 'package:devlab_flutter/src/layout/yaru/ui/ui_menu_body.dart';
import 'package:devlab_flutter/src/layout/yaru/ui/ui_menu_search_box.dart';
import 'package:flutter/material.dart';

class UiMenu extends StatelessWidget {
  const UiMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [UiMenuSearchBox(), Divider(), UiMenuHeader(), Divider(), UiMenuBody()],
    );
  }
}
