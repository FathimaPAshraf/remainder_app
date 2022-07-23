import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/bloc/reminder_bloc.dart';
import 'view/reminder_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => ReminderBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reminder App',
        theme: ThemeData(
            primaryColor: const Color(0xFF000A1F),
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            )),
        home: const ReminderPage(),
      ),
    );
  }
}
