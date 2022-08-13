import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart';
import 'package:ezdelivery/constants.dart';

class share_account extends StatefulWidget {
  const share_account({Key? key}) : super(key: key);

  @override
  State<share_account> createState() => _share_accountState();
}

class _share_accountState extends State<share_account> {

  final _auth=FirebaseAuth.instance;
  final _functions=FirebaseFunctions.instance;
  final _firestore=FirebaseFirestore.instance;
  final TextEditingController keyController=TextEditingController();
  User? user;

  void getData() async {
    final userDoc=await _firestore.collection('customers').doc(user?.uid).get();
    keyController.text=userDoc['key'];
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

    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Share Account',
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
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Key',
                      style: kInstructionStyle2,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width-200.0,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: keyController,
                        enabled: false,
                        style: kDetailsStyle,
                        cursorHeight: 25,
                        cursorColor: kAccentColor1,
                        decoration: const InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kAccentColor1,
                            ),
                          ),
                          hintText: 'Generate a key',
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50.0,
                      height: 70.0,
                      onPressed: (){
                        Clipboard.setData(ClipboardData(text: keyController.text));
                      },
                      child: const Icon(
                        Icons.copy_outlined,
                        size: 25.0,
                        color: kAccentColor1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  color: kAccentColor1,
                  height:40.0,
                  minWidth: double.infinity,
                  onPressed: () async {
                    try{
                      HttpsCallable secretKey=_functions.httpsCallable('getSecretKey');
                      final result=await secretKey.call();

                      await _firestore.collection('customers').doc(user?.uid).set(
                          {
                            'key':result.data.toString(),
                          }, SetOptions(merge: true)
                      );

                      keyController.text=result.data.toString();
                    }
                    catch(e){
                      snackBar(context, message: e.toString());
                    }
                  },
                  child: const Text(
                    'Generate Key',
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

