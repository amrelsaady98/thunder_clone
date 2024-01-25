import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thunder_clone/core/widgets/inputs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final colors = Theme.of(context).colorScheme;
  late final textTheme = Theme.of(context).textTheme;
  late final theme = Theme.of(context);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: colors.secondaryContainer,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 36),
              child: Image.asset('assets/images/login_background.png'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(18),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started With Thnder',
                        style: textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Email Address',
                        style: textTheme.labelLarge,
                      ),
                    ),
                    Material(
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusColor: colors.shadow,
                          fillColor: colors.shadow,
                          hoverColor: colors.shadow,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colors.shadow)),
                          hintText: 'Enter your email address',
                          hintStyle: textTheme.titleMedium?.copyWith(
                            color: colors.shadow.withOpacity(0.5),
                          ),
                        ),
                        cursorColor: colors.shadow,
                      ),
                    ),
                    const SizedBox(height: 36),

                    DarkButton(
                      text: 'Comtinue With Email',
                      onPress: () {},
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text(
                        "Or Continue with",
                        style: textTheme.titleMedium?.copyWith(
                          color: colors.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          colors.inverseSurface.withOpacity(0.02),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(12),
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => colors.onSurface.withOpacity(0.02),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        height: 24,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google_icon.png',
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Continue with Google',
                              style: theme.textTheme.bodyLarge
                                  ?.copyWith(color: colors.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 54),
                    // better use span text
                    Text(
                      '''Securities trading is offered to self-directed customers through Thndr Securities. Thndr Securities is a licensed registered broker with the Egyptian Financial Regulatory Authority. By continuing you agree to our terms &amp;
                    conditions.''',
                      style: textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
