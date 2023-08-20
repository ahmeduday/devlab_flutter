import 'package:devlab_flutter/src/colors/color_scheme/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class FlutterColorsPage extends HookConsumerWidget {
  FlutterColorsPage({super.key}) {
    con.initialize();
  }

  final ColorsController con = Get.put(ColorsController());

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: Obx(
        () => ListView(
          children: [
            Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: 'Selector', children: [
                  YaruRow(
                      leadingWidget: const Icon(
                        Icons.color_lens,
                        size: 25,
                      ),
                      trailingWidget: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Select Color Seed",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      actionWidget: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: con.selectedColor.value), // ref.watch(selectedColor));
                        onPressed: () => showColorDialog(context, ref, con.selectedColor.value),
                        child: Text(
                          con.selectedColor.value.toString(), // ref.watch(selectedColor).value.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      enabled: true),
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ResponsiveGridView.builder(
                itemCount: 18,
                padding: const EdgeInsets.all(8.0),
                shrinkWrap: true,
                gridDelegate: const ResponsiveGridDelegate(
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                    childAspectRatio: 3 / 1.5,
                    maxCrossAxisExtent: 300,
                    minCrossAxisExtent: 300),
                itemBuilder: (BuildContext context, int index) => Card(
                  color: con.containerColorProvider[index], // ref.watch(containerColorProvider)[index],
                  child: Center(
                    child: Text(
                      con.namesProvider[index], // ref.watch(namesProvider)[index],
                      style: TextStyle(color: con.textColorProvider[index]), // ref.watch(textColorProvider)[index]);
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showColorDialog(BuildContext context, WidgetRef ref, Color selectedColor) {
    Color pickerColor = const Color(0xff443a49);
// Color currentColor = Color(0xff443a49);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Pick a color!'),
              content: SingleChildScrollView(
                child: MaterialPicker(
                  pickerColor: selectedColor, // ref.watch(selectedColor),
                  onColorChanged: (color) => pickerColor = color,
                  enableLabel: true,
                  portraitOnly: true,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Got it'),
                  onPressed: () {
                    con.changeColor(pickerColor);
                    // ref.watch(selectedColor.notifier).state = pickerColor;
                    // theme = ThemeData(splashColor: pickerColor);
                    // ref.watch(containerColorProvider.notifier).state = containerColors;
                    // ref.watch(textColorProvider.notifier).state = textColors;
                    // ref.watch(namesProvider.notifier).state = names;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
