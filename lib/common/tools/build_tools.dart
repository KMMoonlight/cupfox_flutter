import 'package:flutter/material.dart';

Widget buildRateWidget(double rate, {int position = 0, double size = 10}) {
  var ratePercent = rate * 5; //放大十倍
  var release = ratePercent % 10;
  var whole = (ratePercent / 10).floor(); //向下取整
  var addHalfStar = false;
  if (release >= 5) {
    //说明超过半颗心
    addHalfStar = true;
  }

  List<Widget> starArray = [];

  for (int i = 0; i <= whole; i++) {
    starArray.add(Image.asset(
      'lib/assets/images/star.png',
      height: size,
      width: size,
      fit: BoxFit.fill,
    ));
    starArray.add(const SizedBox(
      width: 2,
    ));
  }

  if (addHalfStar) {
    starArray.add(Image.asset(
      'lib/assets/images/star_half.png',
      height: size,
      width: size,
      fit: BoxFit.fill,
    ));
    starArray.add(const SizedBox(
      width: 2,
    ));
  }

  starArray.add(Text(rate.toString()));

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment:
        position == 0 ? MainAxisAlignment.start : MainAxisAlignment.center,
    children: starArray,
  );
}
