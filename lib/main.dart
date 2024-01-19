import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techsters_weather/view/screens/HomeScreen/homescreen.dart';
import 'package:techsters_weather/view/service/getcityweather_service.dart';
import 'package:techsters_weather/view/service/getweather_service.dart';

void main() {
  runApp(const MyApp());
}

final weather_controll = Get.put(weateherdetails_service());
final cityweather_controll = Get.put(Cityweateherdetails_service());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // ignore: prefer_const_constructors
          home: Scaffold(body: HomeScreen()));
    });
  }
}
