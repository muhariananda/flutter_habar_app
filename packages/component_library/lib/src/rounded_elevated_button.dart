import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    required this.label,
    this.onTap,
    this.icon,
    super.key,
  });

  static const _elevatedButtonHeight = 48.0;

  final String label;
  final VoidCallback? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 25,
      ),
    );

    return SizedBox(
      height: _elevatedButtonHeight,
      width: double.infinity,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onTap,
              icon: icon,
              label: Text(label),
              style: buttonStyle,
            )
          : ElevatedButton(
              onPressed: onTap,
              style: buttonStyle,
              child: Text(label),
            ),
    );
  }
}
