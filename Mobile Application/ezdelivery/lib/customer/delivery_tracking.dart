import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class delivery_tracking extends StatefulWidget {
  const delivery_tracking(this.user,this.packages,{Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;

  @override
  State<delivery_tracking> createState() => _delivery_trackingState();
}

class _delivery_trackingState extends State<delivery_tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Delivery Tracking',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              for(var p in widget.packages)
                InkWell(
                  child: card(context,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(p['packageName'],style: kCardStyle1,),
                              Text(p['status'],style: kCardStyle2,),
                            ],
                          ),
                          Text('Tracking Number '+p['trackingNumber'],style: kCardStyle2,),
                          Text('Added time '+p['addedTime'].toDate().toString(),style: kCardStyle2,),
                        ],
                      ),
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

