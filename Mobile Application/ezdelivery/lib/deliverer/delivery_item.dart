import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class delivery_item extends StatefulWidget {
  delivery_item(this.p, {Key? key}) : super(key: key);
  final dynamic p;

  @override
  State<delivery_item> createState() => _delivery_itemState();
}

class _delivery_itemState extends State<delivery_item> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Delivery Item',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Text(
              widget.p['trackingNumber'],
              style: kCardStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
