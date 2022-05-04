import 'package:ezdelivery/schedule_time_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'delivery_tracking_screen.dart';
import 'schedule_time_screen.dart';
import 'share_account_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const ezDelivery());
}

class ezDelivery extends StatelessWidget {
  const ezDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ezDelivery",
      theme: ThemeData.dark().copyWith(
        primaryColor: kBaseColor1,
        scaffoldBackgroundColor: kBaseColor2,
      ),
      initialRoute: '/delivery_tracking_screen',
      routes: {
        '/sign_up_screen': (context) => sign_up_screen(),
        '/sign_in_screen': (context) => sign_in_screen(),
        '/delivery_tracking_screen': (context) => delivery_tracking_screen(),
        '/schedule_time_screen':(context) => schedule_time_screen(),
        '/share_account_screen': (context) => share_account_screen(),
        '/settings_screen': (context) => settings_screen(),
      },
    );
  }
}