/// A DateTime picker to pick a single DateTime or a DateTime range.
///
/// Use [showCreativeDateCalendarPicker] to pick a single DateTime.
///
/// Use [showCreativeDateCalendarRangePicker] to pick a DateTime range.
///
library creative_datecalendar;

import 'package:flutter/material.dart';
import 'package:creative_datecalendar/src/creative_datecalendar_range_picker.dart';

import 'src/creative_datecalendar_picker.dart';

/// Show bottom modal sheet of the [CreativeDateCalendarPicker]
///
/// Returns a DateTime
///
Future<DateTime?> showCreativeDateCalendarPicker({
  required BuildContext context,
  Widget? title,
  Widget? separator,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  CreativeDateCalendarPickerType type =
      CreativeDateCalendarPickerType.dateAndTime,
  final bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
}) {
  return showModalBottomSheet(
    isScrollControlled: true, // Set this to true

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 1.6 / 3,
        child: CreativeDateCalendarPicker(
          separator: separator,
          title: title,
          type: type,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          is24HourMode: is24HourMode,
          isShowSeconds: isShowSeconds,
          minutesInterval: minutesInterval,
          secondsInterval: secondsInterval,
          isForce2Digits: isForce2Digits,
          borderRadius: borderRadius,
          constraints: constraints,
          selectableDayPredicate: selectableDayPredicate,
        ),
      );
    },
  );
}

/// Show bottom modal sheet of the [CreativeDateCalendarRangePicker]
///
/// Returns a List<DateTime>
/// with index 0 as startDateTime
/// and index 1 as endDateTime
///
Future<List<DateTime>?> showCreativeDateCalendarRangePicker({
  required BuildContext context,
  DateTime? startInitialDate,
  DateTime? startFirstDate,
  DateTime? startLastDate,
  DateTime? endInitialDate,
  DateTime? endFirstDate,
  DateTime? endLastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  bool? barrierDismissible,
  CreativeDateCalendarPickerType type =
      CreativeDateCalendarPickerType.dateAndTime,
  bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
  DefaultView defaultView = DefaultView.start,
}) {
  return showModalBottomSheet(
    isScrollControlled: true, // Set this to true

    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 2.3 / 3,
        child: CreativeDateCalendarRangePicker(
          type: type,
          startInitialDate: startInitialDate,
          startFirstDate: startFirstDate,
          startLastDate: startLastDate,
          endInitialDate: endInitialDate,
          endFirstDate: endFirstDate,
          endLastDate: endLastDate,
          is24HourMode: is24HourMode,
          isShowSeconds: isShowSeconds,
          minutesInterval: minutesInterval,
          secondsInterval: secondsInterval,
          isForce2Digits: isForce2Digits,
          borderRadius: borderRadius,
          constraints: constraints,
          selectableDayPredicate: selectableDayPredicate,
          defaultView: defaultView,
        ),
      );
    },
  );
}

/// Type of the [CreativeDateCalendarPicker]
/// default to dateAndTime if not selected
enum CreativeDateCalendarPickerType {
  date,
  dateAndTime,
}

/// Decides which tab open by default
enum DefaultView { start, end }
