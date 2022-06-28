import 'package:flutter/material.dart';
import '../constants.dart';

class schedule_time extends StatelessWidget {
  const schedule_time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Schedule Time',
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
