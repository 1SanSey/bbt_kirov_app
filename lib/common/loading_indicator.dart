import 'package:bbt_kirov_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: SpinKitDualRing(
        color: AppColors.mainBackground,
        size: 60.0,
        duration: Duration(milliseconds: 1500),
      ),
    ),
  );
}
