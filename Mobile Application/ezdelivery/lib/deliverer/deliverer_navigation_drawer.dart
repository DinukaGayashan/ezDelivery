import 'package:ezdelivery/deliverer/packages_to_deliver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ezdelivery/constants.dart';
import 'package:ezdelivery/deliverer/completed_delivery.dart';

class deliverer_navigation_drawer extends StatefulWidget{
  const deliverer_navigation_drawer(this.user,this.packages,{Key? key}) : super(key: key);
  final User? user;
  final List<dynamic> packages;

  @override
  State<deliverer_navigation_drawer> createState() => _deliverer_navigation_drawerState();
}

class _deliverer_navigation_drawerState extends State<deliverer_navigation_drawer> {
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
              "ADD DELIVERY",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/add_delivery');
            },
          ),
          ListTile(
            title: const Text(
              "PACKAGES TO DELIVER",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return packages_to_deliver(widget.user,widget.packages,);
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
                return completed_delivery(widget.user,widget.packages,);
              }));
            },
          ),
          ListTile(
            title: const Text(
              "SIGN OUT",
              style: kDrawerTextStyle,
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
          ),
        ],
      ),
    );
  }
}