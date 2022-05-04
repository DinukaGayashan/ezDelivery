import 'package:flutter/material.dart';
import 'constants.dart';

class customer_main_menu extends StatelessWidget {
  const customer_main_menu({Key? key}) : super(key: key);

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
        drawer: Drawer(
          backgroundColor: kAccentColor2,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(
                    children: <Widget> [
                      CircleAvatar(
                        radius: 40.0,
                        child: Image.asset('assets/images/ezdelivery.png'),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const SizedBox(
                        height: 50.0,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'ezDelivery',
                            style: kNameStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              ListTile(
                title: const Text(
                  "DELIVERY TRACKING",
                  style: kDrawerTextStyle,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "SCHEDULE TIME",
                  style: kDrawerTextStyle,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "SHARE PROFILE",
                  style: kDrawerTextStyle,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "SETTINGS",
                  style: kDrawerTextStyle,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "SIGN OUT",
                  style: kDrawerTextStyle,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/sign_in_screen');
                },
              ),
            ],
          ),
        ),
        body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
