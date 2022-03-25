import 'package:flutter/material.dart';

void main() {
  runApp(const ezDelivery());
}

class ezDelivery extends StatelessWidget {
  const ezDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100.0,
                color: Colors.red,
                height: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.amber,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                ],
              ),
              Container(
                width: 100.0,
                color: Colors.blue,
                height: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
