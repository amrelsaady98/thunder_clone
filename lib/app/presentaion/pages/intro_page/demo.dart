import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int nextIndex = 0;
  late final theme = Theme.of(context);
  late final colors = Theme.of(context).colorScheme;
  PageController _controller = PageController();
  late final Animation<Color> colorTween;
  late final AnimationController colorController;
  double opacity = 0;

  final List<Color> backgroundColor = <Color>[
    Colors.white,
    Color.fromRGBO(190, 184, 209, 1),
    Color.fromRGBO(128, 213, 191, 1),
    Color.fromRGBO(255, 206, 187, 1),
  ];
  List<String> titles = [
    "Hey there! you just joined 800,000 users",
    "No minimum is Motto",
    "Invest newbiew",
    "100% Safe & Secure"
  ];
  List<String> paragraphs = [
    """
Strat Make your mony work for you by investing through our one step investment shop 
Strat Make your mony work for you by investing through our one step investment shop
    """,
    """
Stat investing with as much as you'd like. You'd be surprized how far a little monu can go.
    """,
    """
Expolre Thundr's tools & resources for first-time investors including our simulator, financial news feeds & learn
platform. Sounds Interesting?
""",
    """
Thnder is lincensed by Egyption's Financial regulatory Authority (FRA). This means we kepp you protected as an investor
""",
  ];
  List<String> buttonText = [
    "Get Started",
    "Continue",
    "Keep going",
    " Now let's get you started!",
  ];

  List<String> images = [
    "assets/images/tutorial_1.png",
    "assets/images/tutorial_2.png",
    "assets/images/tutorial_3.png",
    "assets/images/tutorial_4.png",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    colorController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 100));

    colorTween = Tween<Color>(
      begin: backgroundColor[currentIndex],
      end: backgroundColor[currentIndex + 1],
    ).animate(CurvedAnimation(parent: colorController, curve: Curves.linear));

    _controller.addListener(() {
      setState(() {
        nextIndex = (_controller.offset / SizerUtil.width).ceil();
        opacity = _controller.offset / SizerUtil.width - nextIndex + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: backgroundColor[currentIndex]
                .withOpacity(opacity == 0 ? 1 : 1 - opacity),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: backgroundColor[nextIndex]
                .withOpacity(opacity == 0 ? 1 : opacity),
          ),
          PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              currentIndex = index;
              setState(() {});
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      flex: 2,
                      child: Text(
                        titles[index],
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      flex: 2,
                      child: Text(paragraphs[index],
                          style: theme.textTheme.titleMedium),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 64,
            child: Container(
              width: SizerUtil.width,
              alignment: Alignment.center,
              child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(colors.onSurface),
                  ),
                  onPressed: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: Text(buttonText[currentIndex])),
            ),
          ),
        ],
      ),
    );
  }
}
