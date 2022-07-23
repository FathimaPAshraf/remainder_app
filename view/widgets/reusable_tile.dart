import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('wake up reminder'),
        subtitle: const Text('Feb 17, 12:30 PM'),
        trailing:
            //list if widget in appbar actions
            PopupMenuButton(
          icon: const Icon(
              Icons.more_horiz), //don't specify icon if you want 3 dot menu
               color: Colors.white38,
               itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: const Text(
                "Edit",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          // ignore: avoid_print
          onSelected: (item) => {print(item)},
        ),
      ),
    );
  }
}
