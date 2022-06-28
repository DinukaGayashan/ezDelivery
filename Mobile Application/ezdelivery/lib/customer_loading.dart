import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezdelivery/constants.dart';
import 'package:ezdelivery/customer_main_menu.dart';
import 'package:ezdelivery/delivery_tracking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class customer_loading extends StatefulWidget {
  const customer_loading({Key? key}) : super(key: key);

  @override
  State<customer_loading> createState() => _customer_loadingState();
}

class _customer_loadingState extends State<customer_loading> {
  User? user;
  List<dynamic> packages=[];
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;

  void getData()async{
    final userDoc=await _firestore.collection('customers').doc(user?.uid).get();
    final ps=userDoc['packages'];
    for(var p in ps){
      packages.add(await p.get());
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return customer_main_menu(user,packages,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    try{
      user=_auth.currentUser;
    }
    catch(e){
      print(e.toString());
    }
    getData();

    return const Scaffold(
      backgroundColor: kAccentColor1,
      body: Center(
        child: SpinKitDoubleBounce(
          color: kAccentColor3,
          size: 100,
        ),
      ),
    );
  }
}
