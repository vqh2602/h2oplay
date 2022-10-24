import 'package:get/get.dart';
import 'package:h2oplay/modules/splash_screen/splash_binding.dart';
import 'package:h2oplay/modules/splash_screen/splash_screen.dart';

import 'home_screen/home_binding.dart';
import 'home_screen/home_screen.dart';

List<GetPage> routes = [
  GetPage(
      name: SplashScreen.routeName,
      page: () =>  const SplashScreen(),
      binding:SplashBinding()),
  GetPage(
      name: HomeScreen.routeName,
      page: () =>  const HomeScreen(),
      binding:HomeBinding()),
];
