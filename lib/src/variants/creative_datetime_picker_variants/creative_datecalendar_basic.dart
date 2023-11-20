import 'package:flutter/material.dart';
import 'package:creative_datecalendar/src/components/button_row.dart';
import 'package:creative_datecalendar/src/components/calendar.dart';

import '../../../creative_datecalendar_picker.dart';

class CreativeDatecalendarBasic extends StatelessWidget {
  const CreativeDatecalendarBasic({
    Key? key,
    this.separator,
    this.title,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.isShowSeconds,
    this.is24HourMode,
    this.minutesInterval,
    this.secondsInterval,
    this.isForce2Digits,
    this.constraints,
    this.type,
    this.selectableDayPredicate,
  }) : super(key: key);

  final Widget? separator;
  final Widget? title;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool? isShowSeconds;
  final bool? is24HourMode;
  final int? minutesInterval;
  final int? secondsInterval;
  final bool? isForce2Digits;
  final BoxConstraints? constraints;
  final CreativeDateCalendarPickerType? type;
  final bool Function(DateTime)? selectableDayPredicate;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    DateTime selectedDateTime = initialDate ?? DateTime.now();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: constraints ??
              const BoxConstraints(
                maxWidth: 450,
                maxHeight: 650,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) title!,
              if (title != null && separator != null) separator!,
              Calendar(
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateChanged: (value) {
                  DateTime tempDateTime = DateTime(
                    value.year,
                    value.month,
                    value.day,
                    selectedDateTime.hour,
                    selectedDateTime.minute,
                    isShowSeconds ?? false ? selectedDateTime.second : 0,
                  );

                  selectedDateTime = tempDateTime;
                },
                selectableDayPredicate: selectableDayPredicate,
              ),
              if (type == CreativeDateCalendarPickerType.dateAndTime &&
                  separator != null)
                separator!,
              if (type == CreativeDateCalendarPickerType.dateAndTime)
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 24.0),
                //   child: TimePickerSpinner(
                //     time: initialDate,
                //     itemWidth: 0,
                //     amText: localizations.anteMeridiemAbbreviation,
                //     pmText: localizations.postMeridiemAbbreviation,
                //     isShowSeconds: isShowSeconds ?? false,
                //     is24HourMode: is24HourMode ?? false,
                //     minutesInterval: minutesInterval ?? 1,
                //     secondsInterval: secondsInterval ?? 1,
                //     isForce2Digits: isForce2Digits ?? false,
                //     onTimeChange: (value) {
                //       DateTime tempDateTime = DateTime(
                //         selectedDateTime.year,
                //         selectedDateTime.month,
                //         selectedDateTime.day,
                //         value.hour,
                //         value.minute,
                //         isShowSeconds ?? false ? value.second : 0,
                //       );

                //       selectedDateTime = tempDateTime;
                //     },
                //   ),
                // ),
                Container(
                  height: 10,
                ),
              ButtonRow(onSavePressed: () {
                Navigator.pop<DateTime>(
                  context,
                  selectedDateTime,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
