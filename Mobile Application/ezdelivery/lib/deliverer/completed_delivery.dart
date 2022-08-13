import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ezdelivery/constants.dart';


class completed_delivery extends StatelessWidget {
  completed_delivery(this.user, this.packages, {Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;

  List<dynamic> getPackagesWithAttribute(
      {required String attribute, required String state}) {
    List<dynamic> ps = [];
    for (var p in packages) {
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
          'Delivered Packages',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            for (var p in getPackagesWithAttribute(
                attribute: 'status', state: 'delivered'))
              card(
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
          ],
        ),
      ),
    );
  }
}
