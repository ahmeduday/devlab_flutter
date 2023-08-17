import 'dart:convert';
import 'package:devlab_flutter/src/encoders/base64_image/base64_image_encoder_providers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_editor.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_toolbar.dart';
import 'package:devlab_flutter/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:screenshot/screenshot.dart';

class Base64ImageEncoderPage extends HookConsumerWidget {
  const Base64ImageEncoderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useTextEditingController();

    useEffect(() {
      Future(() {
        inputController.text = ref.watch(inputTextProvider);
        inputController.addListener(() {
          final bytes = const Base64Decoder().convert(inputController.text.trim());
          ref.read(outputImageProvider.notifier).state = bytes;
        });
      });
      return;
    }, [ref.watch(inputTextProvider)]);

    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: IOEditor(
              usesCodeControllers: false,
              inputController: inputController,
              outputChild: Column(
                children: [
                  IOToolbar(
                    title: "output",
                    actions: [
                      ElevatedButton.icon(
                          onPressed: () => uploadImage(ref),
                          icon: const Icon(Icons.image),
                          label: Text(
                            "upload_image",
                          )),
                      Visibility(
                        visible: !kIsWeb,
                        child: ElevatedButton.icon(
                            onPressed: () => downloadImage(context, ref),
                            icon: const Icon(Icons.download),
                            label: Text("download_image")),
                      )
                    ],
                  ),
                  OutputEditor(
                      outputController: null,
                      outputChild: Screenshot(
                        controller: ref.watch(screenshotControllerProvider),
                        child: Image.memory(
                          ref.watch(outputImageProvider),
                          errorBuilder: ((_, __, ___) => const SizedBox.shrink()),
                        ),
                      ),
                      usesCodeControllers: false,
                      isVerticalLayout: false),
                ],
              )),
        ));
  }
}
