import 'package:cached_network_image/cached_network_image.dart';
import 'package:component_library/component_library.dart';
import 'package:component_library/src/centered_circular_progress_indicator.dart';
import 'package:component_library/src/utils/string_to_time_ago.dart';
import 'package:flutter/material.dart';

const _itemSpacing = Spacing.medium;

class ArticleLargeCard extends StatelessWidget {
  const ArticleLargeCard({
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
    super.key,
  });

  final String title;
  final String author;
  final String publishedAt;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, url) =>
                  const CenteredCircularProgressIndicator(),
              errorWidget: (_, url, error) => Container(
                color: Colors.grey,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: _itemSpacing),
        Text(
          title,
          maxLines: 2,
          style: theme.text.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: _itemSpacing),
        Text(
          '$author • ${publishedAt.toTimeAgo()}',
          style: theme.text.labelSmall,
        ),
      ],
    );
  }
}
