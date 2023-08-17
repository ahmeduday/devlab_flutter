import 'package:devlab_flutter/src/converters/json_yaml/json_yaml_converter_providers.dart';
import 'package:devlab_flutter/src/converters/json_yaml/json_yaml_conversion_type.dart';
import 'package:devlab_flutter/src/formatters/indentation.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/code_controller_hook.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:highlight/languages/json.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonYamlConverterPage extends HookConsumerWidget {
  const JsonYamlConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final conversionType = ref.watch(conversionTypeProvider);

    final inputController = useCodeController();
    final outputController = useCodeController();

    useEffect(() {
      Future(() {
        inputController.language = conversionType == JsonYamlConversionType.jsonToYaml ? json : yaml;
        inputController.addListener(() {
          ref.read(inputTextProvider.notifier).state = inputController.text;
        });
      });

      return;
    });

    useEffect(() {
      Future(() {
        outputController.language = conversionType == JsonYamlConversionType.jsonToYaml ? yaml : json;
        return outputController.text = ref.watch(outputTextProvider);
      });
      return;
    }, [ref.watch(outputTextProvider)]);

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: YaruSection(headline: "configuration", children: [
            YaruRow(
              enabled: true,
              leadingWidget: const Icon(
                Icons.compare_arrows_sharp,
                size: 25,
              ),
              trailingWidget: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "conversion_type",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              actionWidget: DropdownButton<JsonYamlConversionType>(
                  value: ref.watch(conversionTypeProvider),
                  items: getDropdownMenuItems<JsonYamlConversionType>(JsonYamlConversionType.values),
                  onChanged: (selected) => ref.watch(conversionTypeProvider.notifier).state = selected!),
            ),
            Visibility(
                visible: ref.watch(conversionTypeProvider) == JsonYamlConversionType.yamlToJson,
                child: Column(children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.arrow_right_alt),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "indentation",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<Indentation>(
                        value: ref.watch(indentationProvider),
                        items: getDropdownMenuItems<Indentation>(Indentation.values),
                        onChanged: (selected) => ref.read(indentationProvider.notifier).state = selected!),
                  ),
                ])),
            Visibility(
                visible: ref.watch(conversionTypeProvider) == JsonYamlConversionType.jsonToYaml,
                child: Column(children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.arrow_right_alt),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "yaml_style",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<YamlStyle>(
                        value: ref.watch(yamlStyleProvider),
                        items: getYamlStyleDropdownMenuItems(),
                        onChanged: (selected) => ref.read(yamlStyleProvider.notifier).state = selected!),
                  ),
                ])),
            YaruRow(
              enabled: true,
              leadingWidget: const Icon(Icons.sort_by_alpha),
              trailingWidget: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "sort_properties_alphabetically",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              actionWidget: Switch(
                value: ref.watch(sortAlphabeticallyProvider),
                onChanged: (value) => ref.read(sortAlphabeticallyProvider.notifier).state = value,
              ),
            )
          ]),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: IOEditor(inputController: inputController, outputController: outputController))
      ]),
    );
  }
}
