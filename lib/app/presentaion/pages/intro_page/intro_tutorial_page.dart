import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class IntroTutorailPage extends StatefulWidget {
  const IntroTutorailPage({super.key});

  @override
  State<IntroTutorailPage> createState() => _IntroTutorailPageState();
}

class _IntroTutorailPageState extends State<IntroTutorailPage> {
  late final theme = Theme.of(context);
  late final colors = Theme.of(context).colorScheme;

  int currentIndex = 0;
  int nextIndex = 0;
  double opacity = 0;

  PageController _controller = PageController();

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
    "assets/images/itutorial_1.png",
    "assets/images/itutorial_2.png",
    "assets/images/itutorial_3.png",
    "assets/images/itutorial_4.png",
  ];
  List<Color> backgroundColor = [
    Colors.white,
    Color.fromRGBO(190, 184, 209, 1),
    Color.fromRGBO(121, 202, 181, 1),
    Color.fromRGBO(255, 206, 187, 1),
  ];

  int cuurentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {
        nextIndex = (_controller.offset / SizerUtil.width).ceil();
        opacity = _controller.offset / SizerUtil.width - nextIndex + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: colors.surface,
      resizeToAvoidBottomInset: true,
      child: Stack(
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
            pageSnapping: true,
            controller: _controller,
            onPageChanged: (index) {
              currentIndex = index;
              setState(() {});
            },
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
            top: 48,
            right: 12,
            child: Container(
              margin: const EdgeInsets.all(18),
              child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    'skip',
                    style: theme.textTheme.titleMedium,
                  )),
            ),
          ),
          Positioned(
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              width: SizerUtil.width,
              alignment: Alignment.center,
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(colors.inverseSurface),
                ),
                onPressed: () {
                  if (nextIndex == 4) {
                    /// go to Login Page
                    return;
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    buttonText[currentIndex],
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: colors.onInverseSurface),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
