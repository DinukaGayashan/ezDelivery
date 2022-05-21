import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'delivery_tracking.dart';
import 'schedule_time.dart';
import 'share_account.dart';
import 'settings.dart';
import 'registration_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/registration_form',
      routes: {
        '/sign_up': (context) => sign_up(),
        '/sign_in': (context) => sign_in(),
        '/delivery_tracking': (context) => delivery_tracking(),
        '/schedule_time': (context) => schedule_time(),
        '/share_account': (context) => share_account(),
        '/settings': (context) => settings(),
        '/registration_form': (context) => registration_form(),
      },
    );
  }
}