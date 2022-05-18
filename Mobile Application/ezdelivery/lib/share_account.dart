import 'package:flutter/material.dart';
import 'constants.dart';
import 'customer_navigation_drawer.dart';

class share_account extends StatelessWidget {
  const share_account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      drawer: customer_navigation_drawer(),
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
                  'Secret Key',
                  style: kInstructionStyle2,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width-80.0,
                      child: TextFormField(
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
                          hintText: 'Generate a key to share',
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50.0,
                      height: 70.0,
                      onPressed: (){},
                      child: const Icon(
                        Icons.copy_outlined,
                        size: 28.0,
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
                  onPressed: () {},
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
