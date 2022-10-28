import 'package:get/get.dart';
import 'package:h2oplay/modules/brower_screen/brower_binding.dart';
import 'package:h2oplay/modules/brower_screen/brower_screen.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_binding.dart';
import 'package:h2oplay/modules/play_media_screen/play_media_screen.dart';
import 'package:h2oplay/modules/splash_screen/splash_binding.dart';
import 'package:h2oplay/modules/splash_screen/splash_screen.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_binding.dart';
import 'package:h2oplay/modules/tv_group_screen/tv_group_screen.dart';
import 'package:h2oplay/modules/tv_screen/tv_binding.dart';
import 'package:h2oplay/modules/tv_screen/tv_screen.dart';

import 'home_screen/home_binding.dart';
import 'home_screen/home_screen.dart';
import 'key_screen/key_binding.dart';
import 'key_screen/key_screen.dart';

List<GetPage> routes = [
  GetPage(
      name: SplashScreen.routeName,
      page: () =>  const SplashScreen(),
      binding:SplashBinding()),
  GetPage(
      name: HomeScreen.routeName,
      page: () =>  const HomeScreen(),
      binding:HomeBinding()),
  GetPage(
      name: KeyScreen.routeName,
      page: () =>  const KeyScreen(),
      binding:KeyBinding()),
  GetPage(
      name: TVScreen.routeName,
      page: () =>  const TVScreen(),
      binding:TVBinding()),
  GetPage(
      name: PlayMediaScreen.routeName,
      page: () =>  const PlayMediaScreen(),
      binding:PlayMediaBinding()),
  GetPage(
      name: TVGroupScreen.routeName,
      page: () =>  const TVGroupScreen(),
      binding:TVGroupBinding()),
  GetPage(
      name: BrowserScreen.routeName,
      page: () =>  const BrowserScreen(),
      binding:BrowserBinding()),
];
