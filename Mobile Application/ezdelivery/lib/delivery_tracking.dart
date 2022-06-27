import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'customer_navigation_drawer.dart';

class delivery_tracking extends StatelessWidget {
  delivery_tracking({Key? key}) : super(key: key);

  final _auth=FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {

    try{
      user=_auth.currentUser;
    }
    catch(e){
      print(e);
    }

    return Scaffold(
      backgroundColor: kAccentColor3,
        appBar: AppBar(
          backgroundColor: kAccentColor1,
          elevation: 8.0,
          toolbarHeight: 80.0,
          title: const Text(
            'Delivery Tracking',
            style: kSubSubjectStyle,
          ),
        ),
        drawer: customer_navigation_drawer(),
        body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
