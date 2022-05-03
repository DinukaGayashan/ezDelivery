import 'package:flutter/material.dart';
import 'constants.dart';

class login_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor1,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                child: Image.asset('assets/images/ezdelivery.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ezDelivery',
                    style: textStyle1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
