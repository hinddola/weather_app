import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/utiles/binding/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data:  MediaQueryData(),
      child: ScreenUtilInit(
        designSize: const Size(450, 926),
        builder: (BuildContext ,Widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
            getPages: [
                GetPage(
                  name: '/',
                  page: () => SplashScreen(),
                  binding: HomeBinding(),
                )
              ],
        ),
      ),
    );
  }
}


// Weather API url :
//        https://api.openweathermap.org/data/2.5/weather?q=mansoura&appid=21ec62d8841469af6b9fb5c46ab1e4e1


// 5 days weather forecast:
//        https://api.openweathermap.org/data/2.5/forecast?q=mansoura&appid=21ec62d8841469af6b9fb5c46ab1e4e1