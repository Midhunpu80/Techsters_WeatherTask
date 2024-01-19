import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:techsters_weather/main.dart';
import 'package:techsters_weather/view/utility/alltext.dart';
import 'package:techsters_weather/view/utility/colors.dart';
import 'package:techsters_weather/view/widgets/citysList.dart';
import 'package:techsters_weather/view/widgets/weatherdetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: alltext(
              txt: "Weather Details",
              col: wh,
              siz: 16.sp,
              wei: FontWeight.bold,
              max: 1),
          backgroundColor: grbl,
          leading: Icon(
            Icons.arrow_back,
            color: wh,
          ),
          toolbarHeight: 13.h,
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      weather_controll.getLocationAndFetchWeather();
                    },
                    icon: Icon(
                      Icons.sort,
                      color: wh,
                      size: 3.h,
                    )))
          ],
        ),
        body: Obx(() {
          if (weather_controll.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (weather_controll.reply == null) {
            return alltext(
                txt: "is empty",
                col: bl,
                siz: 15.sp,
                wei: FontWeight.bold,
                max: 1);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      child: alltext(
                          txt: "Check city weather",
                          col: bl,
                          siz: 15.sp,
                          wei: FontWeight.bold,
                          max: 1)),
                ),
                citysList(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.pin_drop,
                            color: re,
                          ),
                          label: alltext(
                              txt: weather_controll.reply?.city.name ?? 'm/',
                              col: bl,
                              siz: 15.sp,
                              wei: FontWeight.bold,
                              max: 1)),
                    )),
                weatherdetails(
                    txt:
                        "Tempreture : ${weather_controll.reply?.list[0].main.temp.toString()}",
                    image:
                        'images/high-temperature-icon-cartoon-high-temperature-vector-icon-web-design-isolated-white-background_98402-42475.jpg'),
                weatherdetails(
                    image: 'images/download.png',
                    txt:
                        'Pressure : ${weather_controll.reply?.list[0].main.pressure.toString()}'),
                weatherdetails(
                    image: 'images/4148460.png',
                    txt:
                        'Humidity : ${weather_controll.reply?.list[0].main.humidity.toString()}'),
                weatherdetails(
                    txt:
                        'Cloud Cover : ${weather_controll.reply?.list[0].clouds.all.toString()}',
                    image:
                        'images/png-transparent-cloud-computing-computer-icons-cloud-cover-draw-cloud-computer-wallpaper-cloud-computing-thumbnail.png')
              ],
            );
          }
        }),
      ),
    );
  }
}
