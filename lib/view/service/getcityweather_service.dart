import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:techsters_weather/main.dart';
import 'package:techsters_weather/model/weathermodel.dart';
import 'package:techsters_weather/view/constant/constant.dart';
import 'package:techsters_weather/view/utility/apiconfigration/apiconfig.dart';

class Cityweateherdetails_service extends GetxController {
  Apiconfigration api = Apiconfigration();
  var isLoading = false.obs;
  WeatherModel? reply;

  Future getWeather({required var cityname}) async {
    try {
      isLoading(true);

      final response =
          await http.get(Uri.parse("${baseurl}q=${cityname}&appid=$apiKey"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        reply = WeatherModel.fromJson(data);
        print("${reply?.message.toString()}------------");
        weather_controll.getWeather(
            lat: reply!.city.coord.lat, long: reply!.city.coord.lon);

        isLoading(false);
        update();
      } else {
        isLoading(false);
        print('failed');
        update();
      }
    } catch (e) {
      print(e.toString());
      isLoading(false);
      update();
    }
    // update();
  }
}
