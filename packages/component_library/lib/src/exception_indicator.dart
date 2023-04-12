import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    this.title,
    this.message,
    this.onTryAgain,
    super.key,
  });

  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: Spacing.mediumLarge,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_rounded,
              size: 42,
              color: theme.colors.onBackground,
            ),
            const SizedBox(height: Spacing.medium),
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: theme.text.titleMedium,
            ),
            Text(
              message ?? '',
              textAlign: TextAlign.center,
              style: theme.text.bodySmall,
            ),
            if (onTryAgain != null)
              const SizedBox(
                height: Spacing.xxxLarge,
              ),
            if (onTryAgain != null)
              RoundedElevatedButton(
                label: 'Try Again',
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
                onTap: onTryAgain,
              )
          ],
        ),
      ),
    );
  }
}
