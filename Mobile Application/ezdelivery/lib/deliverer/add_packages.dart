import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class add_packages extends StatelessWidget {
  add_packages({Key? key}) : super(key: key);

  final _functions=FirebaseFunctions.instance;
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  User? user;
  final _formKey = GlobalKey<FormState>();
  dynamic trackingNumber,packageName,customerKey;

  @override
  Widget build(BuildContext context) {

    try{
      user=_auth.currentUser;
    }
    catch(e){
      print(e);
    }

    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Add Package',
          style: kSubSubjectStyle,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Tracking Number',
                    style: kInstructionStyle2,
                  ),
                  TextFormField(
                    style: kDetailsStyle,
                    cursorHeight: 25,
                    cursorColor: kAccentColor1,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: kAccentColor1
                          )
                      ),
                      hintText: 'Enter tracking number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter tracking number';
                      }
                      return null;
                    },
                    onChanged: (value){
                      trackingNumber=value;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Package Name',
                    style: kInstructionStyle2,
                  ),
                  TextFormField(
                    style: kDetailsStyle,
                    cursorHeight: 25,
                    cursorColor: kAccentColor1,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: kAccentColor1
                          )
                      ),
                      hintText: 'Enter package name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter package name';
                      }
                      return null;
                    },
                    onChanged: (value){
                      packageName=value;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Customer Key',
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
                      hintText: 'Enter customer key',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter customer key';
                      }
                      return null;
                    },
                    onChanged: (value){
                      customerKey=value;
                    },
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
                        if (_formKey.currentState!.validate()){
                          HttpsCallable checkUserRole=_functions.httpsCallable('checkCustomerAvailability');
                          final result=await checkUserRole.call(<String, dynamic>{'key': customerKey,});
                          if(result.data=='true'){
                            final customers=await _firestore.collection('customers').where('key',isEqualTo: customerKey).get();
                            for (var c in customers.docs){
                              await _firestore.collection('packages').doc().set(
                                  {
                                    'customerEmail':c.data()['email'],
                                    'distributorEmail': user?.email,
                                    'addedTime': DateTime.now(),
                                    'trackingNumber': trackingNumber,
                                    'packageName': packageName,
                                    'status':'in_transit',
                                  }
                              );

                            }
                            Navigator.pop(context);
                          }
                          else{
                            print('no such user exist');
                          }
                        }
                      }
                      catch(e){
                        print(e);
                      }
                    },
                    child: const Text(
                      'Add Package',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
