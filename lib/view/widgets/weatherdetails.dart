import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:techsters_weather/view/utility/alltext.dart';
import 'package:techsters_weather/view/utility/colors.dart';

weatherdetails({required var image, required var txt}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 12.h,
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: wh,
          boxShadow: [
            BoxShadow(
                color: bl.withOpacity(0.6),
                offset: const Offset(3, 3),
                blurRadius: 2.6,
                spreadRadius: 2.2)
          ]),
      child: Center(
        child: ListTile(
          leading: Container(
            height: 8.h,
            width: 8.h,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          title: alltext(
              txt: txt, col: bl, siz: 13.sp, wei: FontWeight.bold, max: 1),
        ),
      ),
    ),
  );
}
