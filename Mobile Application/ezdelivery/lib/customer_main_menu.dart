import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'customer_navigation_drawer.dart';
import 'deliverer_navigation_drawer.dart';

class customer_main_menu extends StatefulWidget {
  const customer_main_menu({Key? key}) : super(key: key);

  @override
  State<customer_main_menu> createState() => _customer_main_menuState();
}

class _customer_main_menuState extends State<customer_main_menu> {
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
          'Customer Main Menu',
          style: kSubSubjectStyle,
        ),
      ),
      drawer: customer_navigation_drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: card(context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Packages',style: kSubSubjectStyle,),
                  ),
                ),
                onTap: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
