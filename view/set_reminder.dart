import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/bloc/reminder_bloc.dart';

class SetReminder extends StatefulWidget {
  const SetReminder({Key? key}) : super(key: key);

  @override
  State<SetReminder> createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  final textAlertController = TextEditingController();
  final dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text(
            'Set  Reminder',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ListView(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.2),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                              hintText: "Alert Text"),
                          controller: textAlertController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.2),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(

                        readOnly: true,
                        controller: dateController,

                        decoration:const InputDecoration(
                       icon: Icon(Icons.date_range),

                        labelText: "pick a date"),
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dateController.text =
                              date.toString().substring(0, 10);
                          },

                      )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                      ),
                    ],
                    color: Colors.white,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: timeinput,
                        decoration: const InputDecoration(

                             icon: Icon(Icons.timer,color: Colors.black,),
                            labelText: "Pick a Time"),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            if (kDebugMode) {
                              // ignore: use_build_context_synchronously
                              print(pickedTime.format(context));
                            }
                            DateTime parsedTime = DateFormat.jm()
                                // ignore: use_build_context_synchronously
                                .parse(pickedTime.format(context).toString());

                            if (kDebugMode) {
                              print(parsedTime);
                            }
                            String formattedTime =
                                DateFormat('HH:mm').format(parsedTime);
                            // ignore: avoid_print
                            print(formattedTime);

                            setState(() {
                              timeinput.text = formattedTime;
                            });
                          }
                        },
                      ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30.0)),
                child: TextButton(
                  onPressed: () {
                    context.read<ReminderBloc>().add(
                          AddReminder(
                              alertText: textAlertController.text,
                              alertDate: dateController.text,
                              alertTime: timeinput.text),
                        );
                  },
                  child: const Text(
                    'Set an Alert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
