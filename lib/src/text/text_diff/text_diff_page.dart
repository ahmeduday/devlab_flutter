import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/settings/settings.dart';
import 'package:devlab_flutter/src/widgets/io_editor/input_editor.dart';
import 'package:devlab_flutter/src/widgets/multi_split_view_divider.dart';
import 'package:devlab_flutter/src/settings/settings_provider.dart';
import 'package:devlab_flutter/src/text/text_diff/text_diff_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class TextDiffPage extends HookConsumerWidget {
  const TextDiffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    final oldTextController = useTextEditingController();
    final newTextController = useTextEditingController();

    useEffect(() {
      Future(() {
        oldTextController.addListener(() {
          ref.read(oldTextProvider.notifier).state = applyWebSpaceFix(oldTextController.text);
        });
      });

      return;
    });

    useEffect(() {
      Future(() {
        newTextController.addListener(() {
          ref.read(newTextProvider.notifier).state = applyWebSpaceFix(newTextController.text);
        });
      });

      return;
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: YaruSection(headline: "configuration", children: [
              RadioListTile<DiffCleanupType>(
                  title: Text("semantic_cleanup"),
                  subtitle: Text("semantic cleanup description"),
                  value: DiffCleanupType.SEMANTIC,
                  groupValue: ref.watch(diffCleanupTypeProvider),
                  onChanged: (DiffCleanupType? value) {
                    ref.read(diffCleanupTypeProvider.notifier).state = value ?? DiffCleanupType.EFFICIENCY;
                  }),
              RadioListTile(
                  title: Row(
                    children: [
                      Text("${"efficiency_cleanup"}.${"edit_cost"}:"),
                      SizedBox(
                          width: 40,
                          height: 30,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (value) {
                              ref.read(editCostProvider.notifier).state = int.tryParse(value) ?? 4;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              border: OutlineInputBorder(),
                            ),
                          ))
                    ],
                  ),
                  subtitle: Text("efficiency cleanup description"),
                  value: DiffCleanupType.EFFICIENCY,
                  groupValue: ref.watch(diffCleanupTypeProvider),
                  onChanged: (DiffCleanupType? value) {
                    ref.read(diffCleanupTypeProvider.notifier).state = value ?? DiffCleanupType.EFFICIENCY;
                  }),
              RadioListTile(
                  title: Text("no_cleanup"),
                  subtitle: Text("no cleanup description"),
                  value: DiffCleanupType.NONE,
                  groupValue: ref.watch(diffCleanupTypeProvider),
                  onChanged: (DiffCleanupType? value) {
                    ref.read(diffCleanupTypeProvider.notifier).state = value ?? DiffCleanupType.EFFICIENCY;
                  }),
            ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: MultiSplitViewTheme(
                data: MultiSplitViewThemeData(dividerThickness: 5),
                child: MultiSplitView(
                  dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) =>
                      MultiSplitViewDivider(dragging: dragging, highlighted: highlighted),
                  axis: Axis.horizontal,
                  initialAreas: [Area(weight: 0.5, minimalWeight: 0.3), Area(weight: 0.5, minimalWeight: 0.3)],
                  children: [
                    InputEditor(
                        toolbarTitle: "old_text",
                        inputController: oldTextController,
                        minLines: 20,
                        height: MediaQuery.of(context).size.height / 2.5,
                        usesCodeControllers: false),
                    InputEditor(
                        toolbarTitle: "new_text",
                        minLines: 20,
                        inputController: newTextController,
                        height: MediaQuery.of(context).size.height / 2.5,
                        usesCodeControllers: false),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: YaruDialogTitle(closeIconData: Icons.close, title: "difference"),
                    content: _Diff(settings: settings, isDialog: true),
                  );
                },
              );
            },
            child: _Diff(settings: settings),
          ),
        ],
      ),
    );
  }
}

class _Diff extends ConsumerWidget {
  const _Diff({
    Key? key,
    required this.settings,
    this.isDialog = false,
  }) : super(key: key);

  final Settings settings;

  final bool isDialog;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: !isDialog,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Text("difference", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).disabledColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: PrettyDiffText(
            textAlign: TextAlign.left,
            diffEditCost: ref.watch(editCostProvider),
            diffCleanupType: ref.watch(diffCleanupTypeProvider),
            defaultTextStyle: TextStyle(
                fontSize: ref.watch(settingsProvider).textEditorFontSize,
                textBaseline: TextBaseline.alphabetic,
                fontFamily: settings.textEditorFontFamily,
                color: Theme.of(context).textTheme.bodyLarge!.color),
            newText: ref.watch(newTextProvider),
            oldText: ref.watch(oldTextProvider),
          )),
        )
      ],
    );
  }
}
