import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezdelivery/deliverer/delivery_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ezdelivery/constants.dart';

class packages_to_deliver extends StatefulWidget {
  packages_to_deliver(this.user, this.packages, {Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;

  @override
  State<packages_to_deliver> createState() => _packages_to_deliverState();
}

class _packages_to_deliverState extends State<packages_to_deliver> {
  final _firestore=FirebaseFirestore.instance;

  List<dynamic> getPackagesWithAttribute(
      {required String attribute, required String state}) {
    List<dynamic> ps = [];
    for (var p in widget.packages) {
      if (p[attribute] == state) {
        ps.add(p);
      }
    }
    return ps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Packages To Deliver',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
            children: [
              const SizedBox(height: 10,),
              for (var p in getPackagesWithAttribute(
                  attribute: 'status', state: 'delivering'))
                InkWell(
                  child: card(
                    context,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                p['trackingNumber'],
                                style: kCardStyle1,
                              ),
                              Text(
                                p['status'],
                                style: kCardStyle2,
                              ),
                            ],
                          ),
                          Text(
                            'Item: '+p['packageName'],
                            style: kCardStyle2,
                          ),
                          Text(
                            'Added time: ' + p['addedTime'].toDate().toString(),
                            style: kCardStyle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    final c=await _firestore.collection('customers').where('email',isEqualTo: p['customerEmail']).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return delivery_item(p,c.docs.first);
                    }));
                  },
                ),
              for (var p in getPackagesWithAttribute(
                  attribute: 'status', state: 'in_transit'))
                InkWell(
                  child: card(
                    context,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                p['trackingNumber'],
                                style: kCardStyle1,
                              ),
                              Text(
                                p['status'],
                                style: kCardStyle2,
                              ),
                            ],
                          ),
                          Text(
                            'Item: '+p['packageName'],
                            style: kCardStyle2,
                          ),
                          Text(
                            'Added time: ' + p['addedTime'].toDate().toString(),
                            style: kCardStyle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    final c=await _firestore.collection('customers').where('email',isEqualTo: p['customerEmail']).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return delivery_item(p,c.docs.first);
                    }));
                  },
                ),
            ],
          ),
        ),
    );
  }
}
