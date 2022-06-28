import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'deliverer_navigation_drawer.dart';

class deliverer_main_menu extends StatelessWidget {
  deliverer_main_menu({Key? key}) : super(key: key);

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
          'Deliverer Main Menu',
          style: kSubSubjectStyle,
        ),
      ),
      drawer: deliverer_navigation_drawer(),
      body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
