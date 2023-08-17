import 'package:devlab_flutter/src/encoders/base64_text/base64_encoding_type.dart';
import 'package:devlab_flutter/src/encoders/base64_text/base64_text_encoder_providers.dart';
import 'package:devlab_flutter/src/encoders/encode_conversion_mode.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class Base64TextEncoderPage extends HookConsumerWidget {
  const Base64TextEncoderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useTextEditingController();
    final outputController = useTextEditingController();

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
                leadingWidget: const Icon(Icons.compare_arrows_sharp),
                trailingWidget: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(title: Text("conversion"), subtitle: Text("conversion_mode")),
                ),
                actionWidget: DropdownButton<ConversionMode>(
                    value: ref.watch(conversionModeProvider),
                    items: getDropdownMenuItems<ConversionMode>(ConversionMode.values),
                    onChanged: (selected) {
                      ref.read(conversionModeProvider.notifier).state = selected!;
                    }),
              ),
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(Icons.grid_3x3),
                trailingWidget: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(title: Text("encoding"), subtitle: Text("encoding_description")),
                ),
                actionWidget: DropdownButton<Base64EncodingType>(
                    value: ref.watch(encodingTypeProvider),
                    items: getDropdownMenuItems<Base64EncodingType>(Base64EncodingType.values),
                    onChanged: (selected) {
                      ref.read(encodingTypeProvider.notifier).state = selected!;
                    }),
              )
            ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                inputController: inputController,
                usesCodeControllers: false,
                outputController: outputController,
                isVerticalLayout: true,
              )),
        ],
      ),
    );
  }
}
