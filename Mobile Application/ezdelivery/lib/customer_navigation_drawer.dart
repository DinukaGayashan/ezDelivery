import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customer_navigation_drawer extends StatefulWidget {
  const customer_navigation_drawer({Key? key}) : super(key: key);

  @override
  State<customer_navigation_drawer> createState() => _customer_navigation_drawerState();
}

class _customer_navigation_drawerState extends State<customer_navigation_drawer> {

  final _auth=FirebaseAuth.instance;

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
      print(e);
    }
  }

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
              Navigator.pushNamed(context, '/delivery_tracking');
            },
          ),
          ListTile(
            title: const Text(
              "SCHEDULE TIME",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/schedule_time');
            },
          ),
          ListTile(
            title: const Text(
              "SHARE ACCOUNT",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/share_account');
            },
          ),
          ListTile(
            title: const Text(
              "SETTINGS",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: const Text(
              "SIGN OUT",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              _auth.signOut();
              Navigator.pushNamed(context, '/sign_in');
            },
          ),
        ],
      ),
    );
  }
}