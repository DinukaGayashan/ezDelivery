import 'package:ezdelivery/deliverer/delivered_packages.dart';
import 'package:flutter/material.dart';
import 'package:ezdelivery/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ezdelivery/customer/delivery_tracking.dart';

class customer_navigation_drawer extends StatefulWidget {
  const customer_navigation_drawer(this.user,this.packages,{Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;

  @override
  State<customer_navigation_drawer> createState() => _customer_navigation_drawerState();
}

class _customer_navigation_drawerState extends State<customer_navigation_drawer> {

  final _auth=FirebaseAuth.instance;
  User? user;

  @override
  Widget build(BuildContext context) {

    try{
      user=_auth.currentUser;
    }
    catch(e){
      snackBar(context, message: e.toString());
    }

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
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return delivery_tracking(widget.user,widget.packages,);
              }));
            },
          ),
          ListTile(
            title: const Text(
              "DELIVERED PACKAGES",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return delivered_packages(widget.user,widget.packages,);
              }));
            },
          ),
          ListTile(
            title: const Text(
              "SCHEDULE TIME",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/schedule_time');
            },
          ),
          ListTile(
            title: const Text(
              "SHARE ACCOUNT",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/share_account');
            },
          ),
          ListTile(
            title: const Text(
              "SETTINGS",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
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
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
          ),
        ],
      ),
    );
  }
}