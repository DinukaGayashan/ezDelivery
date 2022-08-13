import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class delivered_packages extends StatelessWidget {
  delivered_packages({Key? key}) : super(key: key);

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
          'Delivered Packages',
          style: kSubSubjectStyle,
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
