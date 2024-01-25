import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thunder_clone/app/presentaion/pages/home_page/home_page.dart';
import 'package:thunder_clone/app/presentaion/pages/wallet_page/wallet_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 54,
          iconSize: 24,
          activeColor: Theme.of(context).colorScheme.onSurface,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset('assets/images/thnder_logo.png'),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard)),
            BottomNavigationBarItem(icon: Icon(Icons.home)),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case (0):
              return const HomePage();
            case (1):
              return const WalletPage();
            case (2):
              return Container(
                color: Theme.of(context).colorScheme.surface,
              );
            default:
              return Container(
                color: Theme.of(context).colorScheme.error,
              );
          }
        });
  }
}
