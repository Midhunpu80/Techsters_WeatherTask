import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:techsters_weather/main.dart';
import 'package:techsters_weather/view/utility/alltext.dart';
import 'package:techsters_weather/view/utility/colors.dart';

Widget citysList() {
  List citynames = [
    " Mumbai",
    "Delhi",
    "Kolkata",
    "Chennai ",
    "Bengaluru",
    "Hyderabad",
    "Pune",
    "Ahmedabad",
    "Jaipur",
    "Surat",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Chandigarh",
    "Visakhapatnam"
  ];
  return Container(
      height: 10.h,
      width: 100.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 2.h, left: 1.h, bottom: 2.h),
              child: InkWell(
                onTap: () {
                  cityweather_controll.getWeather(cityname: citynames[index]);
                  print(citynames[index]);
                },
                child: Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h), color: grbl),
                  child: Center(
                    child: alltext(
                        txt: citynames[index].toString(),
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 2.w,
            );
          },
          itemCount: citynames.length));
}
