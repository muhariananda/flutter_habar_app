import 'package:cached_network_image/cached_network_image.dart';
import 'package:component_library/component_library.dart';
import 'package:component_library/src/article_card.dart';
import 'package:component_library/src/image_error_indicator.dart';
import 'package:flutter/material.dart';

class ArticleCardInSmall extends ArticleCard {
  const ArticleCardInSmall({
    required super.title,
    required super.source,
    required super.publishedAt,
    required super.imageUrl,
    super.onTap,
    super.key,
  });

  @override
  Widget buildWidget(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: theme.text.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Spacing.medium),
                Text(
                  subHeading,
                  style: theme.text.labelSmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: Spacing.small),
          SizedBox(
            width: 100,
            height: 100,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (_, url) =>
                      const CenteredCircularProgressIndicator(),
                  errorWidget: (_, url, error) => const ImageErrorIndicator(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
