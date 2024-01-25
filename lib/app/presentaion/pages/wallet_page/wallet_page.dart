import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:thunder_clone/core/widgets/inputs.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late final theme = Theme.of(context);
  late final colors = Theme.of(context).colorScheme;
  late final textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.inverseSurface,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Investment Wallet",
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colors.onInverseSurface),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.info_outline_rounded,
                        color: colors.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        leadingDistribution: TextLeadingDistribution.even),
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'EGP',
                          style: textTheme.titleLarge?.copyWith(
                            color: colors.onInverseSurface,
                          ),
                        ),
                        TextSpan(
                          text: ' 0',
                          style: textTheme.displaySmall?.copyWith(
                            color: colors.onInverseSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '.00',
                          style: textTheme.titleLarge?.copyWith(
                            color: colors.onInverseSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.only(top: 8.h, left: 18, right: 18),
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Resent Activities',
                                style: textTheme.bodyLarge,
                              ),
                              SmallButton(
                                onPress: () {},
                                text: 'View Requests',
                              ),
                            ],
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/wallet_image.png'),
                                  const SizedBox(height: 18),
                                  Text(
                                    "You have no activity yet!",
                                    style: textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 12.h,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add_circle_rounded,
                              color: colors.primary,
                              size: 6.h,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Top up",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colors.primary,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.remove_circle_outline_rounded,
                              color: colors.onInverseSurface,
                              size: 6.h,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "WithDraw",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colors.onInverseSurface,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: colors.onInverseSurface,
                              size: 6.h,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Show",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colors.onInverseSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
