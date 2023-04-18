import 'package:flutter/material.dart';

class ShareIconButton extends StatelessWidget {
  const ShareIconButton({
    required this.onShare,
    super.key,
  });

  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onShare,
      icon: const Icon(
        Icons.share_rounded,
      ),
    );
  }
}
