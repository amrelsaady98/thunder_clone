import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const DarkButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.inverseSurface),
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding ?? const EdgeInsets.all(12),
        ),
      ),
      onPressed: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
        ),
      ),
    );
  }
}

class LightButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const LightButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding ?? const EdgeInsets.all(12),
        ),
      ),
      onPressed: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final EdgeInsets? padding;

  const SmallButton(
      {super.key, required this.onPress, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
