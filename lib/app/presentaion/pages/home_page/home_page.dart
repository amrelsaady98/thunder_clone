import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thunder_clone/core/widgets/inputs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final theme = Theme.of(context);
  late final colors = Theme.of(context).colorScheme;
  late final textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          /* const SliverAppBar(
            toolbarHeight: 0,
          ), */
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 25.h,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                // border: Border.all(color: colors.onSurface),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    colors.primary.withOpacity(0.6),
                    colors.primary.withOpacity(0.0),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    toolbarHeight: 0,
                    backgroundColor: colors.surface.withOpacity(0),
                  ),
                  Text(
                    "Ahlan Amr!",
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Sat, 13 Jan. 2024",
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 4)
                      // Achivement button
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      "@amrelsaady159",
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '0',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Followers',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Followers',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '0',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Followers',
                              style: textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colors.onSurface.withOpacity(0.2),
                ),
                color: colors.secondaryContainer.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/alert_logo.png',
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complete your account',
                              style: textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Complete your account to  start your investment journey.',
                              style: textTheme.bodySmall?.copyWith(height: 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  DarkButton(
                    onPress: () {},
                    text: "Continue my account",
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Trending Securities",
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Flexible(
                    child: SmallButton(
                      onPress: () {},
                      text: 'Orders',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 15.h,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.inverseSurface.withOpacity(0.05),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset('assets/images/alert_logo.png',
                                height: 7.h),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "EGGOLD",
                            style: textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 14,
                                color: Colors.green,
                              ),
                              Text(
                                '0.12%',
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: Colors.green),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
