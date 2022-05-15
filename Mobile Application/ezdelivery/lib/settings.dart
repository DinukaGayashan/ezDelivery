import 'package:flutter/material.dart';
import 'constants.dart';
import 'customer_navigation_drawer.dart';

class settings_screen extends StatelessWidget {
  const settings_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Settings',
          style: kSubSubjectStyle,
        ),
      ),
      drawer: customer_navigation_drawer(),
      body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
