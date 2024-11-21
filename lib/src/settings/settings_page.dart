import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/themes.dart';
import 'package:devlab_flutter/src/settings/settings_provider.dart';
// import 'package:dev_widgets/src/supported_locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru/yaru.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: const [
          _ApplicationSettings(),
          _TextEditorSettings(),
          _About(),
        ],
      ),
    );
  }
}

class _ApplicationSettings extends ConsumerWidget {
  const _ApplicationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: YaruSection(
        headline: const Text("Application"),
        child: Row(
          children: [
            // YaruTile(
            //   enabled: true,
            //   padding: const EdgeInsets.all(8.0),
            //   leading: const Icon(Icons.public),
            //   trailing: Text(
            //     "language",
            //     style: const TextStyle(fontSize: 18),
            //   ),
            //   title: DropdownButton<Locale>(
            //       value: context.locale,
            //       onChanged: (value) {
            //         ref.read(settingsProvider.notifier).setLocale(context, value ?? const Locale("en_US"));
            //       },
            //       items: _getLanguageDropdownMenuItems()),
            // ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.dark_mode),
              trailing: const Text(
                "Brightness",
                style: TextStyle(fontSize: 18),
              ),
              title: DropdownButton<ThemeMode>(
                  value: settings.themeMode,
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text("System"),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text("Light"),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text("Dark"),
                    ),
                  ],
                  onChanged: (value) {
                    ref
                        .read(settingsProvider.notifier)
                        .setThemeMode(value ?? ThemeMode.system);
                  }),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.accessibility),
              trailing: const Text(
                "High Contrast",
                style: TextStyle(fontSize: 18),
              ),
              title: Switch(
                onChanged: (bool value) {
                  ref.read(settingsProvider.notifier).setHighContrast(value);
                },
                value: settings.highContrast,
              ),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.brush),
              trailing: const Text(
                "Primary Color",
                style: TextStyle(fontSize: 18),
              ),
              title: Flexible(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  alignment: WrapAlignment.start,
                  children: [
                    for (var variant in YaruVariant.values)
                      YaruColorDisk(
                        onPressed: () {
                          ref
                              .read(settingsProvider.notifier)
                              .setColorVariant(variant.color);
                        },
                        color: variant.color,
                        selected: settings.colorSeed == variant.color,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextEditorSettings extends ConsumerWidget {
  const _TextEditorSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: YaruSection(
        headline: const Text("Text Editor"),
        child: Row(
          children: [
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.edit),
              trailing: const Text(
                "Theme",
                style: TextStyle(fontSize: 18),
              ),
              title: DropdownButton<String?>(
                  value: settings.textEditorTheme,
                  items: _getTextEditorThemeDropdownMenuItems(),
                  onChanged: (value) {
                    ref
                        .read(settingsProvider.notifier)
                        .setTextEditorTheme(value ?? "vs");
                  }),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.format_size),
              trailing: const Text(
                "Font Size",
                style: TextStyle(fontSize: 18),
              ),
              title: SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                  height: MediaQuery.of(context).size.height / 20,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: TextEditingController(
                        text: settings.textEditorFontSize.toString()),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      double? parsedValue = double.tryParse(value);
                      if (parsedValue != null) {
                        ref
                            .read(settingsProvider.notifier)
                            .setTextEditorFontSize(parsedValue);
                      }
                    },
                  )),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.house),
              trailing: const Text(
                "Font Family",
                style: TextStyle(fontSize: 18),
              ),
              title: DropdownButton<String?>(
                  value: settings.textEditorFontFamily,
                  items: _getTextEditorFontFamilyDropdownMenuItems(),
                  onChanged: (value) {
                    ref
                        .read(settingsProvider.notifier)
                        .setTextEditorFontFamily(value ?? "Hack");
                  }),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.wrap_text),
              trailing: const Text(
                "Wrap Text",
                style: TextStyle(fontSize: 18),
              ),
              title: Switch(
                onChanged: (bool value) {
                  ref.read(settingsProvider.notifier).setTextEditorWrap(value);
                },
                value: settings.textEditorWrap,
              ),
            ),
            YaruTile(
              enabled: true,
              padding: const EdgeInsets.all(8.0),
              leading: const Icon(Icons.format_list_numbered),
              trailing: const Text(
                "Display line numbers",
                style: TextStyle(fontSize: 18),
              ),
              title: Switch(
                onChanged: (bool value) {
                  ref
                      .read(settingsProvider.notifier)
                      .setTextEditorDisplayLineNumbers(value);
                },
                value: settings.textEditorDisplayLineNumbers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _About extends ConsumerWidget {
  const _About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final buildInfo = ref.watch(buildInfoProvider);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: YaruSection(
        headline: const Text("About"),
        child: Row(children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              onTap: () => showAboutDialog(
                  context: context,
                  useRootNavigator: false,
                  applicationName: 'Dev Lab',
                  applicationIcon: const SizedBox(
                      width: 80,
                      child: Image(image: AssetImage('assets/icon.png'))),
                  children: [
                    const Text(
                        "Parts of this app is inspired and based on the code of DevWidgets (https://github.com/gumbarros/DevWidgets)"),
                  ]),
              child: const YaruTile(
                enabled: true,
                trailing: Text(
                  "Licenses",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text("Access to all third-party licenses"),
                padding: EdgeInsets.all(8.0),
                title: SizedBox.shrink(),
                leading: Icon(Icons.document_scanner),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse("http://www.janabisoft.net"));
              },
              child: YaruTile(
                enabled: true,
                trailing: const Text(
                  "www.janabisoft.net",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(websiteAbout),
                padding: const EdgeInsets.all(8.0),
                title: const SizedBox.shrink(),
                leading: const Icon(Icons.public),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse("mailto:support@janabisoft.net"));
              },
              child: YaruTile(
                enabled: true,
                trailing: const Text(
                  "Support & Feedback",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(supportAbout),
                padding: const EdgeInsets.all(8.0),
                title: const SizedBox.shrink(),
                leading: const Icon(Icons.mail),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(
                    "https://janabisoft.net/p")); //Todo: add privacy statement link
              },
              child: YaruTile(
                enabled: true,
                trailing: const Text(
                  "Privacy Statement",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(privacyAbout),
                padding: const EdgeInsets.all(8.0),
                title: const SizedBox.shrink(),
                leading: const Icon(Icons.privacy_tip_outlined),
              ),
            ),
          ),

          // MouseRegion(
          //   cursor: SystemMouseCursors.click,
          //   child: GestureDetector(
          //     onTap: () async {
          //       await launchUrl(Uri.parse("https://www.github.com/gumbarros/DevWidgets"));
          //     },
          //     child: const YaruTile(
          //       enabled: true,
          //       trailing: Text(
          //         "Repository",
          //         style: TextStyle(fontSize: 18),
          //       ),
          //       description: "repository_about",
          //       padding: EdgeInsets.all(8.0),
          //       title: SizedBox.shrink(),
          //       leading: Icon(Icons.code),
          //     ),
          //   ),
          // ),
          YaruTile(
            enabled: true,
            trailing: const Text(
              "Build info",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: buildInfo.when(
              loading: () => const Text("..."),
              data: (data) => Text(data),
              error: (error, _) => Text(error.toString()),
            ),
            padding: const EdgeInsets.all(8.0),
            title: const SizedBox.shrink(),
            leading: const Icon(Icons.computer),
          ),
        ]),
      ),
    );
  }
}

// List<DropdownMenuItem<Locale>> _getLanguageDropdownMenuItems() {
//   return supportedLocales
//       .map((l) => DropdownMenuItem(
//             value: l.locale,
//             child: Text(l.name),
//           ))
//       .toList();
// }

List<DropdownMenuItem<String>> _getTextEditorThemeDropdownMenuItems() {
  return textEditorThemes.entries
      .map((e) => DropdownMenuItem(
            value: e.key,
            child: Text(e.key),
          ))
      .toList();
}

List<DropdownMenuItem<String>> _getTextEditorFontFamilyDropdownMenuItems() {
  return supportedFontFamilies
      .map((family) => DropdownMenuItem(
            value: family,
            child: Text(family),
          ))
      .toList();
}

String websiteAbout = "Visit our website for information about other apps";
String supportAbout = "Send us your feedback";
String privacyAbout = "How we collect and handle data";
