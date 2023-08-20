import 'package:devlab_flutter/src/described_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json2yaml/json2yaml.dart';

List<DropdownMenuItem<YamlStyle>> getYamlStyleDropdownMenuItems() {
  return [
    const DropdownMenuItem<YamlStyle>(value: YamlStyle.generic, child: Text("Generic")),
    const DropdownMenuItem<YamlStyle>(value: YamlStyle.pubspecYaml, child: Text("pubspec.yaml")),
    const DropdownMenuItem<YamlStyle>(value: YamlStyle.pubspecLock, child: Text("pubspec.lock"))
  ];
}

List<DropdownMenuItem<T>> getDropdownMenuItems<T extends DescribedEnum>(List<T> enums) {
  return enums.map((e) => DropdownMenuItem<T>(value: e, child: Text(e.description))).toList();
}

const List<String> supportedFontFamilies = ["FiraCode", "Hack", "Monocraft", "JetBrains Mono"];

const _middleDot = '·';

//See https://github.com/flutter/flutter/issues/77929
String applyWebSpaceFix(String string) {
  if (kIsWeb) return string.replaceAll(_middleDot, " ");
  return string;
}

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: applyWebSpaceFix(text)));
}
