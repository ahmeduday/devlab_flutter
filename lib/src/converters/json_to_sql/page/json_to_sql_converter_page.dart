import 'package:devlab_flutter/src/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/page/json_to_sql_converter_input.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/page/json_to_sql_converter_options.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/page/json_to_sql_converter_output.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru/yaru.dart';

class JsonToSqlConverterPage extends ConsumerWidget {
  const JsonToSqlConverterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: YaruTabBar(
          tabs: const [
            JsonToSqlConverterInput(),
            JsonToSqlConverterOptions(),
            JsonToSqlConverterOutput()
          ],
          onTap: (int index) {
            ref.read(selectedTabProvider.notifier).state = index;
          },
        ));
  }
}
