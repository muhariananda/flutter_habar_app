import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class ImageErrorIndicator extends StatelessWidget {
  const ImageErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    return ColoredBox(
      color: theme.colors.surface,
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(
            Spacing.xLarge,
          ),
          child: Icon(
            Icons.image_not_supported_rounded,
            color: theme.colors.onSurcafe,
          ),
        ),
      ),
    );
  }
}
