import 'package:flutter/material.dart';

Widget showErrorText(String errorMessage) {
  return Center(
    child: Text(
      errorMessage,
      style: const TextStyle(color: Colors.black, fontSize: 25),
    ),
  );
}
