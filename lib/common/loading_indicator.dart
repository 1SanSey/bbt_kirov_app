import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: SpinKitDualRing(
        color: Theme.of(context).primaryColor,
        size: 60.0,
        duration: const Duration(milliseconds: 500),
      ),
    ),
  );
}
