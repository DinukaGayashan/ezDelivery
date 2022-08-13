import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezdelivery/deliverer/delivered_packages.dart';
import 'delivery_tracking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'customer_navigation_drawer.dart';

class customer_main_menu extends StatefulWidget {
  const customer_main_menu(this.user, this.packages, {Key? key})
      : super(key: key);
  final User? user;
  final List<dynamic> packages;
  @override
  State<customer_main_menu> createState() => _customer_main_menuState();
}

class _customer_main_menuState extends State<customer_main_menu> {
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

  String? key=null;
  late DateTime? outFrom=null;
  late int? outTime=null;

  void getData() async {
    final userDoc=await _firestore.collection('customers').doc(widget.user?.uid).get();
    try{
      key=userDoc['key'];
    }catch(e){}

    try{
      outFrom=userDoc['outTimes']['outFrom'].toDate();
      outTime=userDoc['outTimes']['outTime'];
    }catch(e){}

    setState(() {
      key;
      outTime;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
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
          'Customer Main Menu',
          style: kSubSubjectStyle,
        ),
      ),
      drawer: customer_navigation_drawer(widget.user, widget.packages),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: card(
                  context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Delivery Tracking',
                          style: kCardStyle1,
                        ),
                        const Text(
                          'Pending package delivery details',
                          style: kCardStyle2,
                        ),
                        Text(
                            (getPackagesWithAttribute(
                                      attribute: 'status', state: 'in_transit')
                                  .length+getPackagesWithAttribute(
                                attribute: 'status', state: 'delivering')
                                .length)
                                  .toString() +
                              ' Pending',
                          style: kCardStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return delivery_tracking(
                      widget.user,
                      widget.packages,
                    );
                  }));
                },
              ),
              InkWell(
                child: card(
                  context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Delivered Packages',
                          style: kCardStyle1,
                        ),
                        const Text(
                          'Delivered package details',
                          style: kCardStyle2,
                        ),
                        Text(
                              getPackagesWithAttribute(
                                  attribute: 'status', state: 'delivered')
                                  .length
                                  .toString() +
                              ' Completed',
                          style: kCardStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return delivered_packages(
                      widget.user,
                      widget.packages,
                    );
                  }));
                },
              ),
              InkWell(
                child: card(
                  context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Schedule Time',
                          style: kCardStyle1,
                        ),
                        const Text(
                          'Add off time from the delivery location',
                          style: kCardStyle2,
                        ),
                        outFrom!=null?
                        Text(
                          'Out from '+outFrom.toString()+' for '+outTime.toString()+' hours',
                          style: kCardStyle2,
                        ):SizedBox(),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/schedule_time');
                },
              ),
              InkWell(
                child: card(
                  context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Share Account',
                          style: kCardStyle1,
                        ),
                        const Text(
                          'Generate a key and provide that to deliverer',
                          style: kCardStyle2,
                        ),
                        key!=null?
                        Text(
                          key.toString(),
                          style: kCardStyle2,
                        ):SizedBox(),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/share_account');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
