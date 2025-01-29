import 'package:flutter/material.dart';

Widget customTextfield(TextEditingController controller, String hint) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hint,
    ),
  );
}
