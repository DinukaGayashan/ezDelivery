import 'package:flutter/material.dart';
import 'constants.dart';

class customer_navigation_drawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kAccentColor2,
      child: ListView(
        padding: const EdgeInsets.all(10.0),
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
              Navigator.pushNamed(context, '/delivery_tracking_screen');
            },
          ),
          ListTile(
            title: const Text(
              "SCHEDULE TIME",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/schedule_time_screen');
            },
          ),
          ListTile(
            title: const Text(
              "SHARE ACCOUNT",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/share_account_screen');
            },
          ),
          ListTile(
            title: const Text(
              "SETTINGS",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/settings_screen');
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
    );
  }
}