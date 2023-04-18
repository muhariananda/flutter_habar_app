import 'package:flutter/material.dart';

class BookmarkIconButton extends StatelessWidget {
  const BookmarkIconButton({
    required this.isBookmark,
    this.onTap,
    super.key,
  });

  final bool isBookmark;
  final void Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onTap?.call(isBookmark);
      },
      icon: Icon(
        isBookmark
            ? Icons.bookmark_added_rounded
            : Icons.bookmark_border_rounded,
      ),
    );
  }
}
