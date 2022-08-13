import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class delivery_package extends StatefulWidget {
  delivery_package(this.package, this.deliverer, {Key? key}) : super(key: key);
  final dynamic package;
  final dynamic deliverer;

  @override
  State<delivery_package> createState() => _delivery_packageState();
}

class _delivery_packageState extends State<delivery_package> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor3,
      appBar: AppBar(
        backgroundColor: kAccentColor1,
        elevation: 8.0,
        toolbarHeight: 80.0,
        title: const Text(
          'Delivery Item',
          style: kSubSubjectStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 15,),
              const Text(
                'Tracking number',
                style: kCardStyle2,
              ),
              Text(
                widget.package['trackingNumber'],
                style: kDetailsStyle,
              ),
              const Text(
                'Item name',
                style: kCardStyle2,
              ),
              Text(
                widget.package['packageName'],
                style: kDetailsStyle,
              ),
              const Text(
                'Added time',
                style: kCardStyle2,
              ),
              Text(
                widget.package['addedTime'].toDate().toString(),
                style: kDetailsStyle,
              ),
              const Text(
                '\nDeliverer Details',
                style: kSubSubjectStyle,
                textAlign: TextAlign.center,
              ),
              const Text(
                'Name',
                style: kCardStyle2,
              ),
              Text(
                widget.deliverer['name'].toString(),
                style: kDetailsStyle,
              ),
              const Text(
                'Contact number',
                style: kCardStyle2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.deliverer['contactNumber'].toString(),
                    style: kDetailsStyle,
                  ),
                  IconButton(
                    onPressed: (){
                      launch('tel:'+widget.deliverer['contactNumber']);
                    },
                      icon: const Icon(
                        Icons.phone,
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
