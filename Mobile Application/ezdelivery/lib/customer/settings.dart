import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../constants.dart';

class settings extends StatefulWidget {
  settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  final _auth=FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;
  User? user;
  late String newName,newNumber,newAddress;
  late double newLatitude,newLongitude;
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  double latitude=0,longitude=0;
  String name='',address='',contactNumber='';

  void getData() async{
    final userDoc=await _firestore.collection('customers').doc(user?.uid).get();
    name=userDoc['name'];
    address=userDoc['address'];
    contactNumber=userDoc['contactNumber'];
    latitude=userDoc['location'].latitude;
    longitude=userDoc['location'].longitude;
    setState(() {
      name;address;contactNumber;latitude;longitude;
    });
  }

  @override
  Widget build(BuildContext context) {

    try{
      user=_auth.currentUser;
    }
    catch(e){
      print(e);
    }

    getData();

    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Settings',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            ListTile(
              title: const Text(
                'Change Username',
                style: kDetailsStyle,
              ),
              subtitle: Text(
                name.toString(),
                style: kCardStyle2,
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Change Username',
                        style: kSubSubjectStyle,
                      ),
                      content: SizedBox(
                        width: 200,
                        height: 35,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter new username",
                            hintStyle: kInstructionStyle,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kAccentColor3),
                            ),
                          ),
                          textCapitalization: TextCapitalization.words,
                          style: kInstructionStyle,
                          cursorHeight: 20,
                          cursorColor: kBaseColor2,
                          autofocus: true,
                          onChanged: (value) {
                            newName = value;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: kCardStyle2,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Confirm",
                            style: kCardStyle2,
                          ),
                          onPressed: () async {
                            try {
                              await _firestore
                                  .collection('customers')
                                  .doc(user?.uid)
                                  .set(
                                {
                                  'name': newName,
                                },
                                SetOptions(merge: true),
                              );

                            } catch (e) {

                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text(
                'Change Contact Number',
                style: kDetailsStyle,
              ),
              subtitle: Text(
                contactNumber.toString(),
                style: kCardStyle2,
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Change Contact Number',
                        style: kSubSubjectStyle,
                      ),
                      content: SizedBox(
                        width: 200,
                        height: 35,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter new contact number",
                            hintStyle: kInstructionStyle,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kAccentColor3),
                            ),
                          ),
                          textCapitalization: TextCapitalization.words,
                          style: kInstructionStyle,
                          cursorHeight: 20,
                          cursorColor: kBaseColor2,
                          autofocus: true,
                          onChanged: (value) {
                            newNumber = value;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: kCardStyle2,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Confirm",
                            style: kCardStyle2,
                          ),
                          onPressed: () async {
                            try {
                              await _firestore
                                  .collection('customers')
                                  .doc(user?.uid)
                                  .set(
                                {
                                  'contactNumber': newNumber,
                                },
                                SetOptions(merge: true),
                              );

                            } catch (e) {

                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text(
                'Change Address',
                style: kDetailsStyle,
              ),
              subtitle: Text(
                address.toString(),
                style: kCardStyle2,
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Change Address',
                        style: kSubSubjectStyle,
                      ),
                      content: SizedBox(
                        width: 200,
                        height: 35,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Enter new address",
                            hintStyle: kInstructionStyle,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kAccentColor3),
                            ),
                          ),
                          textCapitalization: TextCapitalization.words,
                          style: kInstructionStyle,
                          cursorHeight: 20,
                          cursorColor: kBaseColor2,
                          autofocus: true,
                          onChanged: (value) {
                            newAddress = value;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: kCardStyle2,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Confirm",
                            style: kCardStyle2,
                          ),
                          onPressed: () async {
                            try {
                              await _firestore
                                  .collection('customers')
                                  .doc(user?.uid)
                                  .set(
                                {
                                  'address': newAddress,
                                },
                                SetOptions(merge: true),
                              );

                            } catch (e) {

                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text(
                'Change Location',
                style: kDetailsStyle,
              ),
              subtitle: Text(
                '['+latitude.toString()+'N '+longitude.toString()+'W]',
                style: kCardStyle2,
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Change Location',
                        style: kSubSubjectStyle,
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 120.0,
                            child: TextFormField(
                              controller: longitudeController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              style: kInstructionStyle,
                              cursorHeight: 25,
                              cursorColor: kAccentColor1,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kAccentColor1
                                    )
                                ),
                                hintText: 'Longitude',
                              ),
                              onChanged: (value){
                                newLongitude=double.parse(value);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 120.0,
                            child: TextFormField(
                              controller: latitudeController,
                              keyboardType: const TextInputType.numberWithOptions(),
                              style: kInstructionStyle,
                              cursorHeight: 25,
                              cursorColor: kAccentColor1,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kAccentColor1
                                    )
                                ),
                                hintText: 'Latitude',
                              ),
                              onChanged: (value){
                                newLatitude=double.parse(value);
                              },
                            ),
                          ),

                        ],
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: kInstructionStyle,
                          ),
                          onPressed: () async {
                            Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
                            newLatitude=location.latitude.toDouble();
                            newLongitude=location.longitude.toDouble();
                            latitudeController.text=newLatitude.roundToDouble().toString();
                            longitudeController.text=newLongitude.roundToDouble().toString();
                          },
                          child: const Text(
                              'Get Current\nLocation'
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: kCardStyle2,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Confirm",
                            style: kCardStyle2,
                          ),
                          onPressed: () async {
                            try {
                              await _firestore
                                  .collection('customers')
                                  .doc(user?.uid)
                                  .set(
                                {
                                  'location': GeoPoint(newLatitude,newLongitude),
                                },
                                SetOptions(merge: true),
                              );

                            } catch (e) {

                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
