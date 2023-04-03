import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../components/chart.dart';
import '../components/list_view.dart';
import '../const/images.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller){
          return SingleChildScrollView(
            child: Column(
              children: [
                 Stack(
                   children: [
                     Container(
                     height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black38,
                            BlendMode.darken
                        ),
                        image: AssetImage(
                          'assets/images/cloud-in-blue-sky.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children:[
                      Container(
                        padding: const EdgeInsets.only(
                          top: 100,
                          left: 20,
                          right: 20
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.city = value;
                        },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'City'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                        const SizedBox(
                      height: 20,
                    ),

                      ] ,
                    ),
                ),
                     Padding(
                       padding: const EdgeInsets.only(top:200.0),
                       child: Center(
                         child: Column(
                           children:[
                             Container(
                               height: 210,
                               width: 270,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                                 boxShadow: const [
                                   BoxShadow(
                                     color: Colors.black12,
                                     blurRadius: 4,
                                     offset: Offset(0,4), // Shadow position
                                   ),
                                 ],
                               ),
                               child: Column(
                                 children:[
                                   Container(
                                     padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children:[
                                         Center(
                                           child: Text(
                                             '${controller.currentWeatherData.name}'
                                                 .toUpperCase(),
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .caption!
                                                 .copyWith(
                                               color: Colors.black45,
                                               fontSize: 24,
                                               fontWeight:
                                               FontWeight.bold,
                                               fontFamily:
                                               'flutterfonts',
                                             ),
                                           ),
                                         ),
                                         const SizedBox(height: 10),
                                         Center(
                                           child: Text(
                                             DateFormat()
                                                 .add_MMMMEEEEd()
                                                 .format(DateTime.now()),
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .caption!
                                                 .copyWith(
                                               color: Colors.black45,
                                               fontSize: 14,
                                               fontFamily:
                                               'flutterfonts',
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                   const Divider(
                                     color: Colors.black,
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Column(
                                         children:[
                                           const SizedBox(height: 5,),
                                           Text(
                                             '${controller.currentWeatherData.weather![0].description}',
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .caption!
                                                 .copyWith(
                                               color: Colors.black45,
                                               fontSize: 14,
                                               fontFamily:
                                               'flutterfonts',
                                             ),
                                           ),
                                           const SizedBox(height: 10),
                                           Text(
                                             '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .headline2!
                                                 .copyWith(
                                                 color: Colors.black45,
                                                 fontSize: 24,
                                                 fontFamily: 'flutterfonts'
                                             ),
                                           ),
                                           SizedBox(height: 30.h),
                                           Text(
                                             'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!
                                                 .tempMax
                                             !- 273.15).round().toString()}\u2103',
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .caption!
                                                 .copyWith(
                                               color: Colors.black45,
                                               fontSize: 14,
                                               fontWeight:
                                               FontWeight.bold,
                                               fontFamily:
                                               'flutterfonts',
                                             ),
                                           ),
                                         ],
                                       ),
                                       const SizedBox(
                                         width: 30,
                                       ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children:[
                                           Lottie.asset(
                                             Images.cloudy,
                                             width: 100.w,
                                             height: 100.h,
                                           ),
                                           Text(
                                             'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .caption!
                                                 .copyWith(
                                               color: Colors.black45,
                                               fontSize: 14,
                                               fontWeight:
                                               FontWeight.bold,
                                               fontFamily:
                                               'flutterfonts',
                                             ),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Other Cities'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                              fontSize: 16,
                              fontFamily: 'flutterfonts',
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyList(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children:[
                                Text(
                                  'forecast next 5 days'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                                const Icon(
                                  Icons.next_plan_outlined,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyChart(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}