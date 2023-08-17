import 'package:devlab_flutter/src/widgets/io_editor/input_editor.dart';
import 'package:devlab_flutter/src/widgets/io_editor/output_editor.dart';
import 'package:devlab_flutter/src/widgets/multi_split_view_divider.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class IOEditor extends StatelessWidget {
  final bool usesCodeControllers;
  final TextEditingController? inputController;
  final TextEditingController? outputController;
  final Widget? outputChild;
  final Widget? inputChild;

  ///When set to true, creates horizontal separators.
  final bool isVerticalLayout;

  final List<Area>? initialAreas;

  final bool resizable;

  final Function(String value)? inputOnChanged;
  final Function(String value)? outputOnChanged;
  const IOEditor(
      {super.key,
      this.usesCodeControllers = true,
      this.inputController,
      this.outputController,
      this.isVerticalLayout = false,
      this.outputChild,
      this.inputChild,
      this.resizable = true,
      this.initialAreas,
      this.inputOnChanged,
      this.outputOnChanged});

  @override
  Widget build(BuildContext context) {
    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(dividerThickness: 5),
      child: MultiSplitView(
        axis: isVerticalLayout ? Axis.vertical : Axis.horizontal,
        dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) =>
            MultiSplitViewDivider(dragging: dragging, highlighted: highlighted),
        initialAreas: initialAreas ?? [Area(weight: 0.5, minimalWeight: 0.3), Area(weight: 0.5, minimalWeight: 0.3)],
        resizable: resizable,
        children: [
          InputEditor(
              inputChild: inputChild,
              inputController: inputController,
              isVerticalLayout: isVerticalLayout,
              onChanged: inputOnChanged,
              usesCodeControllers: usesCodeControllers),
          OutputEditor(
              outputChild: outputChild,
              outputController: outputController,
              isVerticalLayout: isVerticalLayout,
              onChanged: outputOnChanged,
              usesCodeControllers: usesCodeControllers)
        ],
      ),
    );
  }
}
