import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:thunder_clone/app/presentaion/pages/intro_page/demo.dart';
import 'package:thunder_clone/app/presentaion/pages/intro_page/intro_loading_page.dart';
import 'package:thunder_clone/app/presentaion/pages/login_page/login_page.dart';
import 'package:thunder_clone/app/presentaion/pages/main_page/main_page.dart';
import 'package:thunder_clone/app/presentaion/pages/wallet_page/wallet_page.dart';
import 'package:thunder_clone/core/routes/routes.dart';
import 'package:thunder_clone/core/theme/theme.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orietation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
        theme: LIGHT_THEME,
        getPages: GET_PAGES,
      );
    });
  }
}
