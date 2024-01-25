import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:thunder_clone/core/routes/routes.dart';

class IntroLoadingPage extends StatefulWidget {
  const IntroLoadingPage({super.key});

  @override
  State<IntroLoadingPage> createState() => _IntroLoadingPageState();
}

class _IntroLoadingPageState extends State<IntroLoadingPage> {
  late final theme = Theme.of(context);
  late final colors = Theme.of(context).colorScheme;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// navigate to next Screen after 5 sec
    Future.delayed(const Duration(seconds: 5))
        .whenComplete(() => Get.offNamed(Routes.TUTORAIL_INTRO));
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: colors.primary,
      resizeToAvoidBottomInset: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                Image.network(
                  'https://cdn.dribbble.com/users/600626/screenshots/2944614/media/7f4dc7abf1bf5b37e1681a0898c3be0c.gif',
                ),
                SizedBox(height: 5.h),

                /// animation here
                Text(
                  "Loading paragraph, Loading paragraph, Loading paragraph, يجري تحميل البيانات",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Loading data [20%]",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 5.h)
              ],
            )
          ],
        ),
      ),
    );
  }
}
