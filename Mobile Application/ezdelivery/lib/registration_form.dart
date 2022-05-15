import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class registration_form extends StatelessWidget {
  const registration_form({Key? key}) : super(key: key);

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
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 120.0,
                      child: TextFormField(
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
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: kInstructionStyle,
                      ),
                      onPressed: () {},
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
                  onPressed: () {},
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
