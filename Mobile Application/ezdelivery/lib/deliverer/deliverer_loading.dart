import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezdelivery/constants.dart';
import 'package:ezdelivery/deliverer/deliverer_main_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class deliverer_loading extends StatefulWidget {
  const deliverer_loading({Key? key}) : super(key: key);

  @override
  State<deliverer_loading> createState() => _deliverer_loadingState();
}

class _deliverer_loadingState extends State<deliverer_loading> {
  User? user;
  List<dynamic> packages=[];
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;

  void getData()async{
    final userDoc=await _firestore.collection('distributors').doc(user?.uid).get();
    final ps=userDoc['packages'];
    for(var p in ps){
      packages.add(await p.get());
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return deliverer_main_menu(user,packages,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    try{
      user=_auth.currentUser;
    }
    catch(e){
      snackBar(context, message: e.toString());
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
