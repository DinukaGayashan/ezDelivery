import 'package:ezdelivery/deliverer/customer_tracking.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'deliverer/add_delivery.dart';
import 'constants.dart';
import 'customer/customer_loading.dart';
import 'customer/customer_main_menu.dart';
import 'deliverer/deliverer_main_menu.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'customer/delivery_tracking.dart';
import 'customer/schedule_time.dart';
import 'customer/share_account.dart';
import 'customer/settings.dart';
import 'customer/registration_form.dart';

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
      initialRoute: '/sign_in',
      routes: {
        '/sign_up': (context) => sign_up(),
        '/sign_in': (context) => sign_in(),
        '/registration_form': (context) => registration_form(),
        '/customer_loading': (context)=>customer_loading(),
        '/schedule_time': (context) => schedule_time(),
        '/share_account': (context) => share_account(),
        '/deliverer_main_menu': (context)=>deliverer_main_menu(),
    '/add_delivery': (context) => add_delivery(),
        /*
        '/share_account': (context) => share_account(),
        '/settings': (context) => settings(),
        '/customer_tracking': (context) => customer_tracking(),
        '*/
      },
    );
  }
}