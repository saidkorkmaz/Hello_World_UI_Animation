import 'package:flutter/material.dart';
import 'package:ui_test/styles/colors.dart';

Widget customTextField(
    {IconData icon, TextEditingController controller, String hint}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        color: colorMedium.withOpacity(.2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(icon, size: 30, color: colorDark,),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          )
        ],
      ),
    ),
  );
}
