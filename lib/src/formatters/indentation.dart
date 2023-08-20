import 'package:devlab_flutter/src/described_enum.dart';

enum Indentation implements DescribedEnum {
  oneTab("One Tab"),
  twoSpaces("Two Spaces"),
  fourSpaces("Four Spaces"),
  compact("Compact");

  @override
  final String description;
  const Indentation(this.description);

  @override
  String toString() {
    switch (this) {
      case oneTab:
        return "\t";
      case Indentation.twoSpaces:
        return "  ";
      case Indentation.fourSpaces:
        return "    ";
      default:
        return "";
    }
  }
}
