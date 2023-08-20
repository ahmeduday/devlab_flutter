import 'package:devlab_flutter/src/formatters/sql_formatter/sql_dialect.dart';
import 'package:devlab_flutter/src/formatters/sql_formatter/sql_formatter_providers.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/code_controller_hook.dart';
import 'package:devlab_flutter/src/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:highlight/languages/sql.dart';

class SqlFormatterPage extends HookConsumerWidget {
  const SqlFormatterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useCodeController(language: sql);
    final outputController = useCodeController(language: sql);

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
        try {
          outputController.text = ref.watch(outputTextProvider);
        } catch (_) {
          //Bug on text_code_field package.
        }
      });
      return;
    }, [ref.watch(outputTextProvider)]);

    return SizedBox(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: YaruSection(headline: "Configuration", children: [
              YaruRow(
                enabled: true,
                leadingWidget: const Icon(
                  Icons.code,
                  size: 25,
                ),
                trailingWidget: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Dialect",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                actionWidget: DropdownButton<SqlDialect>(
                    value: ref.watch(sqlDialectProvider),
                    items: getDropdownMenuItems<SqlDialect>(SqlDialect.values),
                    onChanged: (selected) => ref.read(sqlDialectProvider.notifier).state = selected!),
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
