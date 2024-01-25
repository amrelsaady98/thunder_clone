import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thunder_clone/app/presentaion/pages/intro_page/intro_tutorial_page.dart';

class Routes {
  static String HOME_PAGE = '/home';
  static String SEARCH_PAGE = '/search';
  static String INFO_PAGE = '/info';
  static String SCANNER_PAGE = '/scanner';
  static String TUTORAIL_INTRO = '/tutorial-intro';
}

// ignore: non_constant_identifier_names
final GET_PAGES = [
  GetPage(name: Routes.TUTORAIL_INTRO, page: () => const IntroTutorailPage()),
];
