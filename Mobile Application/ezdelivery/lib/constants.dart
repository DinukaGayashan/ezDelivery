import 'package:flutter/material.dart';

const kBaseColor1=Color(0xFF000000);
const kBaseColor2=Color(0xFFffffff);
const kAccentColor1=Color(0xFF0c4d5f);
const kAccentColor2=Color(0xFFf56b2a);
const kAccentColor3=Color(0xFFa6bebe);
const kTransparentColor1=Color(0x29a6bebe);
const kTransparentColor2=Color(0x660c4d5f);

const TextStyle kNameStyle = TextStyle(
  fontSize: 25,
  fontFamily: 'Chivo',
  color: kBaseColor2,
);

const TextStyle kSubjectStyle = TextStyle(
  fontSize: 40,
  fontFamily: 'Poppins',
  color: kBaseColor2,
);

const TextStyle kSubSubjectStyle = TextStyle(
  fontSize: 25,
  fontFamily: 'Poppins',
  color: kBaseColor2,
);

const TextStyle kInstructionStyle = TextStyle(
  fontSize: 15,
  fontFamily: 'Poppins',
  color: kAccentColor3,
);

const TextStyle kInstructionStyle2 = TextStyle(
  fontSize: 20,
  fontFamily: 'Poppins',
  color: kBaseColor1,
);

const TextStyle kCardStyle1 = TextStyle(
  fontSize: 20,
  fontFamily: 'Poppins',
  color: kBaseColor2,
);

const TextStyle kCardStyle2 = TextStyle(
  fontSize: 15,
  fontFamily: 'Poppins',
  color: kBaseColor2,
);

const TextStyle kDetailsStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Poppins',
  color: kAccentColor1,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Poppins',
  color: kBaseColor2,
  fontWeight: FontWeight.bold,
);

const TextStyle kDrawerTextStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Poppins',
  color: kAccentColor1,
  letterSpacing: 1.5,
);

Widget card(BuildContext context, Widget content){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 5),
    child: Card(
      color: kTransparentColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: content,
        ),
    ),
  );
}

