import 'package:component_library/src/theme/app_theme.dart';
import 'package:component_library/src/theme/spacing.dart';
import 'package:flutter/material.dart';

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme!.searchBarBackgroudColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: theme.text.bodySmall,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: theme.searchBarLabelColor,
            ),
            contentPadding: const EdgeInsets.all(
              Spacing.medium,
            ),
          ),
        ),
      ),
    );
  }
}
