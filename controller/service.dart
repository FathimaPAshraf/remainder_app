import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/data.dart';

class ReminderService {
  Future addReminder(text, date, time) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              '$baseUrl?alert_text=$text&reminder_date=$date&reminder_time=$time'),
          headers: {
            "Authorization": "Bearer $token",
            "accept": "application/json"
          });
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("result is $data");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
