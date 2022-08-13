import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ezdelivery/deliverer/add_packages.dart';
import 'package:ezdelivery/constants.dart';
import 'package:ezdelivery/customer/customer_loading.dart';
import 'package:ezdelivery/deliverer/deliverer_loading.dart';
import 'package:ezdelivery/sign_in.dart';
import 'package:ezdelivery/sign_up.dart';
import 'package:ezdelivery/customer/schedule_time.dart';
import 'package:ezdelivery/customer/share_account.dart';
import 'package:ezdelivery/customer/settings.dart';
import 'package:ezdelivery/customer/registration_form.dart';

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
        '/sign_in': (context) => const sign_in(),
        '/registration_form': (context) => const registration_form(),
        '/customer_loading': (context) => const customer_loading(),
        '/schedule_time': (context) => const schedule_time(),
        '/share_account': (context) => const share_account(),
        '/deliverer_loading': (context) => const deliverer_loading(),
        '/add_delivery': (context) => add_packages(),
        '/settings': (context) => settings(),
      },
    );
  }
}
