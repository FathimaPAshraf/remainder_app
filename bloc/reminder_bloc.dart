import 'package:bloc/bloc.dart';
import '../controller/service.dart';
part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(InitialState()) {
    on<AddReminder>((event, emit) {
      ReminderService()
          .addReminder(event.alertText, event.alertDate, event.alertTime);
    });
  }
}
