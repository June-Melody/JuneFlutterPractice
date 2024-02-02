import 'dart:convert';

enum LovePowerEnum {
  NotSelected,
  P000,
  P001,
  // P002,
  // P003,
  // P004,
  // P005,
  // P006,
  // P007,
  // P008,
  // P009,
  // P010,
  // P011,
  // P012,
  // P013,
  // P014,
  // P015,
  // P016,
  // P017,
  // P018,
  // P019,
  // P020,
  ;

  String toStringValue() {
    return toString().split('.').last;
  }

  static LovePowerEnum fromString(String enumString) {
    return LovePowerEnum.values
        .firstWhere((e) => e.toStringValue() == enumString);
  }
}
