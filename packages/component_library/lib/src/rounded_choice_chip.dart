import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class RoundedChoiceChip extends StatelessWidget {
  const RoundedChoiceChip({
    required this.label,
    required this.isSelected,
    this.onSelected,
    this.labelColor,
    this.selectedLabelColor,
    this.backgroundColor,
    this.selectedBackgroundColor,
    super.key,
  });

  final String label;
  final ValueChanged<bool>? onSelected;
  final Color? labelColor;
  final Color? selectedLabelColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context);
    return ChoiceChip(
      selected: isSelected,
      onSelected: onSelected,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: Spacing.mediumLarge,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? (selectedLabelColor ??
                  theme!.roundedChoiceSelectedChipLabelColor)
              : (labelColor ?? theme!.roundedChoiceChipLabelColor),
        ),
      ),
      backgroundColor:
          backgroundColor ?? theme!.roundedChoiceChipBackgroundColor,
      selectedColor:
          selectedBackgroundColor ?? theme!.roundedChoiceSelectedChipBackground,
    );
  }
}
