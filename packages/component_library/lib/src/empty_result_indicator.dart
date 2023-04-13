import 'package:component_library/component_library.dart';
import 'package:component_library/src/l10n/component_library_localizations.dart';
import 'package:flutter/material.dart';

class EmptyResultIndicator extends StatelessWidget {
  const EmptyResultIndicator({
    this.title,
    this.message,
    super.key,
  });

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = ComponentLibraryLocalizations.of(context);

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
              Icons.inbox_rounded,
              size: 42,
              color: theme.colors.onBackground,
            ),
            Text(
              title ?? l10n.emptyResultTitle,
              textAlign: TextAlign.center,
              style: theme.text.titleMedium,
            ),
            Text(
              message ?? l10n.emptyResultMessage,
              textAlign: TextAlign.center,
              style: theme.text.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
