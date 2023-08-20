import 'dart:convert';
import 'package:devlab_flutter/src/formatters/json_formatter/json_formatter.dart';

/// Yaml formatting control options
enum CSVStyle {
  /// Default formatting style applicable in most cases
  generic,

  /// YAML formatting style following pubspec.yaml formatting conventions
  pubspecYaml,

  /// YAML formatting style following pubspec.lock formatting conventions
  pubspecLock,
}

// part of json2csv;
////////////////////////////////////////////////////////////

String jsonToCsv(input) {
  var outRows = [];
  var inList = _listFrom(input is String ? json.decode(input) : input);
  var firstRow = Row();
  for (var row in inList) {
    var it = Row();
    var obj = JSONFlattener.flatten(row);
    for (var key in obj.keys) {
      if (!firstRow.values.contains(key)) {
        firstRow.values.add(key);
      }
    }
    it.values.addAll(obj.values.map((value) => value.toString()));
    outRows.add(it);
  }

  var table = Table();
  table.append(firstRow);
  for (var row in outRows) {
    table.append(row);
  }
  return table.toString();
}

// Function to convert CSV to JSON
String csvToJson(String csvData) {
  // Split the CSV data into an array of rows
  if (csvData.isEmpty) return 'Invalid data';
  // if (formatJson(csvData) == 'Invalid json data') return 'Invalid json data';
  List<String> rows = csvData.split('\n');
  List<String> headerRow = rows.first.split(',');
  rows.removeAt(0);

  List<List<dynamic>> dataRows = rows.map((row) => formatStringList(row.split(','))).toList();

  // Create an empty JSON object
  Map<String, dynamic> jsonObject = {};

  for (var item in dataRows) {
    if (item.length < headerRow.length) continue;
    for (var i = 0; i < headerRow.length; i++) {
      jsonObject[headerRow[i]] = item[i];
    }
  }

  // Iterate over the rows and add them to the JSON object
  // for (List<String> row in rows) {
  //   // The first row is the header row
  //   if (row[0] == '') {
  //     continue;
  //   }

  //   // Create a new key-value pair in the JSON object
  //   jsonObject[row[0]] = row[1];
  // }

  // Convert the JSON object to a string
  String jsonString = jsonEncode(jsonObject);

  return formatJson(jsonString);
}

List<dynamic> formatStringList(List<String> split) {
  List<dynamic> li = [];
  for (var element in split) {
    dynamic res = DateTime.tryParse(element);
    res ??= bool.tryParse(element);
    res ??= double.tryParse(element);
    res ??= int.tryParse(element);
    res ??= element;

    li.add(res);
  }
  return li;
}

List<dynamic> _listFrom(input, [key]) {
  if (input is List) {
    return input;
  } else if (key != null) {
    return input[key];
  } else {
    for (var key in input.keys) {
      if (input[key] is List) {
        return input[key];
      }
    }

    return [input];
  }
}

class JSONFlattener {
  static Map<String, dynamic> flatten(input) {
    return visit(input);
  }

  static Map<String, dynamic> visit(input, [String path = '']) {
    var scalar = input is num || input is String || input is bool || input == null;

    if (input is Map) {
      Map<String, dynamic> out = {};
      for (var key in input.keys) {
        var newStuff = visit(input[key], "${path + key}/");
        out.addAll(newStuff);
      }
      return out;
    } else if (scalar) {
      Map<String, dynamic> out = {};
      // Single Scalar
      if (path == "") {
        path = "value/";
      }
      var endPath = path.substring(0, path.length - 1);
      out[endPath] = input;
      return out;
    } else if (input is List) {
      Map<String, dynamic> out = {};
      for (int i = 0; i < input.length; i++) {
        var newStuff = visit(input[i], "$path$i/");
        out.addAll(newStuff);
      }
      return out;
    } else {
      return {};
    }
  }
}

// part of json2csv.csv;
///////////////////////////////////////////////////////////////////////

/// A CSV Table
class Table {
  /// Table Rows
  final List<Row> rows;

  /// Creates an empty table.
  Table() : rows = [];

  /// Creates a Table that contains the same rows from the [original] table.
  Table.from(Table original)
      : rows = List.from(original.rows.map((it) {
          return Row.from(it);
        }));

  /// Creates a Table that syncs the rows from the [original] table.
  Table.sync(Table other) : rows = other.rows;

  /// Appends to Specified [row] at the end of the table.
  void append(Row row) => rows.add(row);

  /// Creates a row from the [values] and append it to thr table.
  void addRow(List<String> values) => append(Row.fromList(values));

  /// Gets the specified column's data by index (starting at 0).
  List<String> getColumn(int column) {
    List<String> list = [];
    for (var row in rows) {
      list.add(list[column]);
    }
    return list;
  }

  /// Gets the specified row's data by index (starting at 0).
  Row getRow(int row) {
    return rows[row];
  }

  @override
  String toString() {
    var buffer = StringBuffer();
    for (var row in rows) {
      buffer.writeln(row.toString());
    }
    return buffer.toString();
  }
}

class Row {
  /// The Row Values
  final List<String> values;

  /// Creates an Empty Row
  Row() : values = [];

  /// Creates a [Row] from an existing instance.
  Row.from(Row original) : values = List.from(original.values);

  /// Creates a [Row] that will use the same list as the other row to store the row's values.
  Row.sync(Row other) : values = other.values;

  /// Creates a [Row] instance from [list].
  Row.fromList(List<String> list) : values = List.from(list);

  /// Adds a value to [values].
  void addValue(String value) => values.add(value);

  @override
  String toString() => values.map(_escapeValue).join(",");
}

String _escapeValue(String input) {
  var buffer = StringBuffer();
  if (input.contains(",") || input.contains("\n") || input.contains("\r\n") || input.contains("\r")) {
    buffer.write('"');
    buffer.write(input);
    buffer.write('"');
  } else {
    buffer.write(input);
  }
  return buffer.toString();
}

// Map<String, dynamic> _createMap(Object object) {
//   var instance = reflector.reflect(object);
//   var mirror = instance.type;

//   var variables = mirror.declarations.values.where((it) => it is VariableMirror && !it.isStatic && !it.isPrivate);

//   var out = {};

//   for (var variable in variables) {

//     if (variable.metadata.any((it) => it is Ignore)) continue;

//     var requestedKeyMirror = variable.metadata.firstWhere((it) => it is Key,);

//     var name = requestedKeyMirror == null ? MirrorSystem.getName(variable.simpleName) : (requestedKeyMirror.reflectee as Key).value;
//     var value = instance(variable.simpleName).reflectee;
//     out[name] = map(value);
//   }

//   return object out;
// }

// List<dynamic> _createList(List obj) {
//   return obj.map((it) => map(it)).toList();
// }

// dynamic map(Object object) {
//   if (object is List) {
//     return _createList(object);
//   } else if (_isScalar(object)) {
//     return object;
//   } else {
//     return _createMap(object);
//   }
// }

// bool _isScalar(obj) =>
//     obj is String || obj is bool || obj is num;

class Key {
  final String value;

  const Key(this.value);
}

class Ignore {
  const Ignore();
}
