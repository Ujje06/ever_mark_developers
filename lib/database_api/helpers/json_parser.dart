// What This File Does
//
// This file contains:
//
// Reusable JSON helper methods
//
// for:
//
// safe parsing
// null handling
// datatype conversion
//
// Useful when APIs become large/messy.
//
// WHY THIS IS USEFUL
//
// Sometimes APIs send:
//
// null
// wrong datatype
// missing field
//
// Without safe parsing:
// your app may crash.
//
// This helper prevents many crashes.












class JsonParser {

  // Safe String Parser
  static String parseString(
      dynamic value,
      ) {

    if (value == null) {
      return "";
    }

    return value.toString();
  }

  // Safe Integer Parser
  static int parseInt(
      dynamic value,
      ) {

    if (value == null) {
      return 0;
    }

    return int.tryParse(
      value.toString(),
    ) ?? 0;
  }

  // Safe Double Parser
  static double parseDouble(
      dynamic value,
      ) {

    if (value == null) {
      return 0.0;
    }

    return double.tryParse(
      value.toString(),
    ) ?? 0.0;
  }

  // Safe Boolean Parser
  static bool parseBool(
      dynamic value,
      ) {

    if (value == null) {
      return false;
    }

    return value == true;
  }
}












