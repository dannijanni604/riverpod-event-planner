import 'package:flutter/material.dart';

Widget customTextfield(Function(String) onChanged, String hint) {
  return TextField(
    onChanged: onChanged,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hint,
    ),
  );
}
