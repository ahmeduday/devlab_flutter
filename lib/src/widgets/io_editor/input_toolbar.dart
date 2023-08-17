import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_toolbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' as io;
import 'package:easy_localization/easy_localization.dart';

class InputToolBar extends StatelessWidget {
  final TextEditingController inputController;

  final String? toolbarTitle;

  const InputToolBar({super.key, required this.inputController, this.toolbarTitle});

  @override
  Widget build(BuildContext context) {
    return IOToolbar(title: toolbarTitle ?? "input", actions: [
      ElevatedButton.icon(
        icon: const Icon(Icons.copy),
        label: Text("copy"),
        onPressed: () async => await copyToClipboard(inputController.text),
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.paste),
        label: Text("paste"),
        onPressed: () async {
          inputController.text = await Clipboard.getData("text/plain").then((value) => value?.text ?? "");
        },
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.upload),
        label: Text("upload_file"),
        onPressed: () async {
          var result = await FilePicker.platform.pickFiles();
          if (result != null) {
            if (kIsWeb) {
              inputController.text = String.fromCharCodes(result.files.first.bytes!);
            } else {
              final file = io.File(result.files.single.path!);
              inputController.text = await file.readAsString();
            }
          }
        },
      ),
      ElevatedButton.icon(
        icon: const Icon(Icons.clear),
        label: Text("clear"),
        onPressed: () => inputController.clear(),
      ),
    ]);
  }
}
