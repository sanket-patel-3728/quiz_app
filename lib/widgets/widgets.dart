import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(
            text: 'Quiz',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey)),
        TextSpan(
            text: 'Maker',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.blue)),
      ],
    ),
  );
}

Widget myButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    width:
        buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      gradient: LinearGradient(colors: [Colors.indigo[500], Colors.pink[500]]),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        label,
        style: TextStyle(fontSize: 21.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
