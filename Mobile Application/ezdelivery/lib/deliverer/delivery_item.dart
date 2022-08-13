import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class delivery_item extends StatefulWidget {
  delivery_item(this.package, this.customer, {Key? key}) : super(key: key);
  final dynamic package;
  final dynamic customer;

  @override
  State<delivery_item> createState() => _delivery_itemState();
}

class _delivery_itemState extends State<delivery_item> {
  final _firestore=FirebaseFirestore.instance;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 15,),
              const Text(
                'Tracking number',
                style: kCardStyle2,
              ),
              Text(
                widget.package['trackingNumber'],
                style: kDetailsStyle,
              ),
              const Text(
                'Item name',
                style: kCardStyle2,
              ),
              Text(
                widget.package['packageName'],
                style: kDetailsStyle,
              ),
              const Text(
                'Added time',
                style: kCardStyle2,
              ),
              Text(
                widget.package['addedTime'].toDate().toString(),
                style: kDetailsStyle,
              ),
              const Text(
                '\nCustomer Details',
                style: kSubSubjectStyle,
                textAlign: TextAlign.center,
              ),
              const Text(
                'Name',
                style: kCardStyle2,
              ),
              Text(
                widget.customer['name'].toString(),
                style: kDetailsStyle,
              ),
              const Text(
                'Address',
                style: kCardStyle2,
              ),
              Text(
                 widget.customer['address'].toString(),
                style: kDetailsStyle,
              ),
              const Text(
                'Contact number',
                style: kCardStyle2,
              ),
              Text(
                 widget.customer['contactNumber'].toString(),
                style: kDetailsStyle,
              ),
              const Text(
                'Out time',
                style: kCardStyle2,
              ),
              Text(
                'from ' +DateTime.fromMillisecondsSinceEpoch(widget.customer['outTimes']['outFrom'].seconds*1000).toString()+'\nfor ' + widget.customer['outTimes']['outTime'].toString()+' hrs',
                style: kDetailsStyle,
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    tooltip: 'Call Customer',
                      onPressed: (){
                        launch('tel:'+widget.customer['contactNumber']);
                      },
                      icon: const Icon(
                        Icons.phone,
                        size: 30,
                      ),
                  ),
                  IconButton(
                    tooltip: 'See Location',
                    onPressed: ()async{
                        String lat = widget.customer['location'].latitude.toString();
                        String lng = widget.customer['location'].longitude.toString();
                        String googleMapsLocationUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
                        final String encodedURl = Uri.encodeFull(googleMapsLocationUrl);
                        await launch(encodedURl);
                    },
                    icon: const Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Start Delivery',
                    onPressed: ()async{
                      try{
                        await _firestore.collection('packages').doc(widget.package.id).update(
                            {
                              'status':'delivering',
                            }
                        );
                        Navigator.pushNamedAndRemoveUntil(context, '/deliverer_loading', (route) => false);
                      }catch(e){
                        snackBar(context, message: e);
                      }
                    },
                    icon: const Icon(
                      Icons.start,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Delivery Completed',
                    onPressed: ()async{
                      try{
                        await _firestore.collection('packages').doc(widget.package.id).update(
                            {
                              'status':'delivered',
                            }
                        );
                        Navigator.pushNamedAndRemoveUntil(context, '/deliverer_loading', (route) => false);
                      }catch(e){
                        snackBar(context, message: e);
                      }
                    },
                    icon: const Icon(
                      Icons.done,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
