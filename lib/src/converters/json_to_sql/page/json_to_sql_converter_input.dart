import 'dart:convert';
import 'package:devlab_flutter/src/converters/json_to_sql/helpers/table_fields_mapper.dart';
import 'package:devlab_flutter/src/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:devlab_flutter/src/helpers.dart';
import 'package:devlab_flutter/src/widgets/io_editor/input_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JsonToSqlConverterInput extends HookConsumerWidget {
  const JsonToSqlConverterInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = useTextEditingController();

    useEffect(() {
      controller.text = ref.read(jsonInputProvider);

      controller.addListener(() {
        try {
          String text = applyWebSpaceFix(controller.text);

          ref.read(jsonInputProvider.notifier).state = text;

          final values = List<Map<String, dynamic>>.from(jsonDecode(text));

          ref.read(valuesProvider.notifier).state = values;

          final fields = getTableFields(values);

          ref.read(fieldListProvider.notifier).setState(fields);
          ref.read(isValidJsonProvider.notifier).state = true;
        } on Exception catch (_) {
          ref.read(isValidJsonProvider.notifier).state = false;
        }
      });
      return;
    });

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: InputEditor(inputController: controller, usesCodeControllers: false),
      ),
    );
  }
}
