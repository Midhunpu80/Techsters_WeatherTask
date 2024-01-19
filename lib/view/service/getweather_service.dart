// import 'dart:convert';

// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:techsters_weather/model/weathermodel.dart';
// import 'package:techsters_weather/view/constant/constant.dart';
// import 'package:techsters_weather/view/utility/apiconfigration/apiconfig.dart';

// class weateherdetails_service extends GetxController {
//   Apiconfigration api = Apiconfigration();
//   var isLoading = false.obs;
//   late WeatherModel reply;

//   getweather({required double lat, required double long}) async {
//     try {
//       isLoading(true);

//       final response = await http
//           .get(Uri.parse("${api.getweather}lat=$lat&lon=$long&appid=$apiKey"));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         reply = WeatherModel.fromJson(data);
//         print(reply.city.name.toString());
//         isLoading(false);
//       } else {
//         isLoading(false);
//         print('failed');
//       }
//     } catch (e) {
//       print(e.toString());
//       isLoading(false);
//     }
//   }

//   getLocationAndFetchWeather() async {
//     bool isSeviceEnbled;
//     LocationPermission locationPermission;
//     isSeviceEnbled = await Geolocator.isLocationServiceEnabled();

//     if (!isSeviceEnbled) {
//       return Future.error("Location Not Enabled ");
//     }

//     ///////Location of permission /////////////////
//     locationPermission = await Geolocator.checkPermission();

//     if (locationPermission == LocationPermission.deniedForever) {
//       return Future.error('Loaction permission Denied forver ');
//     } else if (locationPermission == LocationPermission.denied) {
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         return Future.error('Locartion permission denied');
//       }
//     }
//     return await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high)
//         .then((value) {
//       getweather(lat: value.latitude, long: value.longitude);
//     });
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getLocationAndFetchWeather();
//   }
// }
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:techsters_weather/model/weathermodel.dart';
import 'package:techsters_weather/view/constant/constant.dart';
import 'package:techsters_weather/view/utility/apiconfigration/apiconfig.dart';

class weateherdetails_service extends GetxController {
  Apiconfigration api = Apiconfigration();
  var isLoading = false.obs;
  WeatherModel? reply;

  Future getWeather({required double lat, required double long}) async {
    try {
      isLoading(true);

      final response = await http
          .get(Uri.parse("${baseurl}lat=$lat&lon=$long&appid=$apiKey"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        reply = WeatherModel.fromJson(data);
        print("${reply?.message.toString()}------------");

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

  Future<void> getLocationAndFetchWeather() async {
    try {
      LocationPermission locationPermission =
          await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) {
        print('permossion not given');

        LocationPermission asked = await Geolocator.requestPermission();
        update();
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        print(
            "${position.latitude.toString()}--------------lattidude-------------->");
        print(
            "${position.longitude.toString()}---------------logintude-------");

        await getWeather(
            lat: position.latitude.toDouble(),
            long: position.longitude.toDouble());
        update();
      }
    } catch (e) {
      print(e.toString());
      isLoading(false);
      update();
    }
  }

  @override
  void onInit() async {
    print('onInit called');
    getLocationAndFetchWeather();
    super.onInit();
  }
}
