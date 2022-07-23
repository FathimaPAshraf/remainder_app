import 'package:flutter/material.dart';
import 'package:remind_me/view/set_reminder.dart';

import 'widgets/reusable_tile.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Reminders',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SetReminder();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.orange,
                      ),
                      Text(
                        'New Alert',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: ListView(

            children: const [
              ReminderTile(),
            ],
          )),
    );
  }
}
