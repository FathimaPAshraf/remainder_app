part of 'reminder_bloc.dart';

class ReminderEvent {}

class AddReminder extends ReminderEvent {
  final String alertText;
  final String alertDate;
  final String alertTime;
  AddReminder({
    required this.alertText,
    required this.alertDate,
    required this.alertTime,
  });
}

class ViewReminder extends ReminderEvent {}
