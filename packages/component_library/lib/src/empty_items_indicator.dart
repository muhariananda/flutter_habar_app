import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class EmptyItemsIndicator extends StatelessWidget {
  const EmptyItemsIndicator({
    this.message,
    super.key,
  });

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
              size: 75,
              color: theme.colors.surface,
            ),
            const SizedBox(height: Spacing.mediumLarge),
            Text(
              message ?? l10n.emptyItemsMessage,
              textAlign: TextAlign.center,
              style: theme.text.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
