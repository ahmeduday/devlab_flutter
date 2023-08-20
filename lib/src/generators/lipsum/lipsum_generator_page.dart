import 'package:devlab_flutter/src/generators/lipsum/lipsum_generator_providers.dart';
import 'package:devlab_flutter/src/generators/lipsum/lipsum_type.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LipsumGeneratorPage extends HookConsumerWidget {
  const LipsumGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final outputController = useTextEditingController();

    useEffect(() {
      Future(() => outputController.text = ref.watch(outputTextProvider));
      return;
    }, [ref.watch(outputTextProvider)]);

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: YaruSection(headline: "configuration", children: [
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.width_normal),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                      title: Text("Generator mode"),
                      subtitle: Text("Generate words, sentences or paragraphs with lorem ipsum text")),
                ),
                actionWidget: DropdownButton<LipsumType>(
                    value: ref.watch(lipsumTypeProvider),
                    items: getDropdownMenuItems<LipsumType>(LipsumType.values),
                    onChanged: (selected) => ref.read(lipsumTypeProvider.notifier).state = selected!),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.fork_right),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    title: Text("lipsum start with"),
                  ),
                ),
                actionWidget: Switch(
                  onChanged: (value) => ref.read(startWithLoremProvider.notifier).state = value,
                  value: ref.watch(startWithLoremProvider),
                ),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.tag),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    title: Text("Amount"),
                    subtitle: Text("Amount of words, sentences or paragraphs to be generated"),
                  ),
                ),
                actionWidget: Flexible(
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
              ),
            ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: OutputEditor(
                outputController: outputController,
              )),
        ],
      ),
    );
  }
}
