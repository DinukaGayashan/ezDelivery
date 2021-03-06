import 'package:flutter/material.dart';
import '../constants.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

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
      body: const SafeArea(
        child: SingleChildScrollView(
        ),
      ),
    );
  }
}
