import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ezdelivery/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registration_form extends StatefulWidget {
  const registration_form({Key? key}) : super(key: key);

  @override
  State<registration_form> createState() => _registration_formState();
}

class _registration_formState extends State<registration_form> {

  late double latitude,longitude;
  late String name,address,contactNumber;
  final _auth=FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser(){
    try{
      final User? user=_auth.currentUser;
    }
    catch(e){
      snackBar(context, message: e.toString());
    }
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
          'Registration Form',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Name',
                  style: kInstructionStyle2,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: kDetailsStyle,
                  cursorHeight: 25,
                  cursorColor: kAccentColor1,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: kAccentColor1
                        )
                    ),
                    hintText: 'Enter your name',
                  ),
                  onChanged: (value){
                    name=value;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Contact Number',
                  style: kInstructionStyle2,
                ),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  style: kDetailsStyle,
                  cursorHeight: 25,
                  cursorColor: kAccentColor1,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: kAccentColor1
                        )
                    ),
                    hintText: 'Enter your contact number',
                  ),
                  onChanged: (value){
                    contactNumber=value;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Address',
                  style: kInstructionStyle2,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: kDetailsStyle,
                  cursorHeight: 25,
                  cursorColor: kAccentColor1,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: kAccentColor1
                        )
                    ),
                    hintText: 'Enter your address',
                  ),
                  onChanged: (value){
                    address=value;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Location',
                  style: kInstructionStyle2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 120.0,
                      child: TextFormField(
                        controller: longitudeController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        style: kDetailsStyle,
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
                          longitude=double.parse(value);
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
                        style: kDetailsStyle,
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
                          latitude=double.parse(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: kInstructionStyle,
                      ),
                      onPressed: () async {
                        Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
                        latitude=location.latitude.toDouble();
                        longitude=location.longitude.toDouble();
                        latitudeController.text=latitude.roundToDouble().toString();
                        longitudeController.text=longitude.roundToDouble().toString();
                      },
                      child: const Text(
                          'Get Current\nLocation'
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                MaterialButton(
                  color: kAccentColor1,
                  height:40.0,
                  minWidth: double.infinity,
                  onPressed: () async {
                    try{
                      await _firestore.collection('customers').doc(_auth.currentUser?.uid).set(
                          {
                            'email': _auth.currentUser?.email,
                            'name': name,
                            'address': address,
                            'contactNumber': contactNumber,
                            'location':GeoPoint(latitude,longitude),
                          }
                      );
                      Navigator.pushReplacementNamed(context, '/customer_loading');
                    }
                    catch(e){
                      snackBar(context, message: e.toString());
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: kButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
