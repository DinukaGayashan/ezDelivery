import 'package:flutter/material.dart';
import 'constants.dart';
import 'login_screen.dart';
import 'initial_screen.dart';
import 'registration_screen.dart';

void main() {
  runApp(const ezDelivery());
}

class ezDelivery extends StatelessWidget {
  const ezDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor:kBaseColor1,
        scaffoldBackgroundColor: kBaseColor2,
      ),
      initialRoute: '/log',
      routes: {
        '/': (context) => initial_screen(),
        '/reg':(context)=>registration_screen(),
        '/log':(context)=>login_screen(),
        //'/login_screen':(context)=>
      },
    );
  }
}