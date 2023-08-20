import 'package:devlab_flutter/src/generators/uuid/uuid_generator_providers.dart';
import 'package:devlab_flutter/src/generators/uuid/uuid_type.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class UuidGeneratorPage extends HookConsumerWidget {
  const UuidGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final outputController = useTextEditingController();

    useEffect(() {
      Future(() => outputController.text = ref.watch(uuidGeneratorProvider));
      return;
    }, [ref.watch(uuidGeneratorProvider)]);

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: YaruSection(headline: "configuration", children: [
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.tag),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    title: Text("uuid_type"),
                    subtitle: Text("uuid type description"),
                  ),
                ),
                actionWidget: DropdownButton<UuidType>(
                    value: ref.watch(uuidTypeProvider),
                    items: getDropdownMenuItems<UuidType>(UuidType.values),
                    onChanged: (selected) => ref.read(uuidTypeProvider.notifier).state = selected!),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.remove),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    title: Text("hyphens"),
                  ),
                ),
                actionWidget: Switch(
                  onChanged: (value) => ref.read(hiphensProvider.notifier).state = value,
                  value: ref.watch(hiphensProvider),
                ),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.format_color_text),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: ListTile(title: Text("Uppercase")),
                ),
                actionWidget: Switch(
                  onChanged: (value) => ref.read(uppercaseProvider.notifier).state = value,
                  value: ref.watch(uppercaseProvider),
                ),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.format_list_numbered),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(title: Text("Amount")),
                ),
                actionWidget: Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textAlign: TextAlign.end,
                          initialValue: ref.watch(amountProvider).toString(),
                          onChanged: (value) {
                            ref.read(amountProvider.notifier).state = int.tryParse(value) ?? 0;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () => ref.read(uuidGeneratorProvider.notifier).generate(),
                          child: const Text("Generate"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: OutputEditor(
                outputController: outputController,
                actionButtons: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.clear),
                    label: const Text("Clear"),
                    onPressed: () => ref.read(uuidGeneratorProvider.notifier).clear(),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
