import 'package:devlab_flutter/src/converters/json_to_class/json_to_class_converter_providers.dart';
import 'package:devlab_flutter/src/converters/json_to_class/programming_language.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/code_controller_hook.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/json.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonToClassConverterPage extends HookConsumerWidget {
  const JsonToClassConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useCodeController(language: json);
    final outputController = useCodeController(language: dart);

    useEffect(() {
      Future(() {
        inputController.addListener(() {
          ref.read(inputTextProvider.notifier).state = inputController.text;
        });
      });

      return;
    });

    useEffect(() {
      Future(() {
        return outputController.text = ref.watch(outputTextProvider);
      });
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
                leadingWidget: const Icon(
                  Icons.title,
                  size: 25,
                ),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "class_name",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                actionWidget: SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    initialValue: ref.read(classNameProvider),
                    onChanged: (value) {
                      ref.read(classNameProvider.notifier).state = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(
                  Icons.code,
                  size: 25,
                ),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "programming_language",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                actionWidget: DropdownButton<ProgrammingLanguage>(
                    value: ref.watch(programmingLanguageProvider),
                    items: getDropdownMenuItems<ProgrammingLanguage>(ProgrammingLanguage.values),
                    onChanged: (selected) => ref.read(programmingLanguageProvider.notifier).state = selected!),
              ),
            ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                inputController: inputController,
                outputController: outputController,
              )),
        ],
      ),
    );
  }
}
