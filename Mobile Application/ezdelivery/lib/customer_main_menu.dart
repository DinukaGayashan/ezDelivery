import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezdelivery/delivery_tracking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'customer_navigation_drawer.dart';

class customer_main_menu extends StatefulWidget {
  const customer_main_menu(this.user,this.packages,{Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;
  @override
  State<customer_main_menu> createState() => _customer_main_menuState();
}

class _customer_main_menuState extends State<customer_main_menu> {

  @override
  Widget build(BuildContext context) {
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
      drawer: const customer_navigation_drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: card(context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Text('Packages',style: kSubSubjectStyle,),
                        Text(
                            'No of packages: '+widget.packages.length.toString(),
                          style: kInstructionStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return delivery_tracking(widget.user,widget.packages,);
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
