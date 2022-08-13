import 'package:ezdelivery/deliverer/packages_to_deliver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'deliverer_navigation_drawer.dart';

class deliverer_main_menu extends StatelessWidget {
  deliverer_main_menu(this.user, this.packages, {Key? key}) : super(key: key);

  final User? user;
  final List<dynamic> packages;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Deliverer Main Menu',
          style: kSubSubjectStyle,
        ),
      ),
      drawer: deliverer_navigation_drawer(user, packages),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              InkWell(
                child: card(context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Add Packages',style: kCardStyle1,),
                        Text(
                          'Add packages to be delivered',
                          style: kCardStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/add_delivery');
                },
              ),

              InkWell(
                child: card(context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Packages To Deliver',style: kCardStyle1,),
                        Text(
                          'Packages are to be delivered',
                          style: kCardStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return packages_to_deliver(user,packages,);
                  }));
                },
              ),
              InkWell(
                child: card(context,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Delivered Packages',style: kCardStyle1,),
                        Text(
                          'Completed package deliveries',
                          style: kCardStyle2,
                        ),
                      ],
                    ),
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
