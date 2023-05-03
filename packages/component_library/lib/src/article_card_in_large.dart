import 'package:cached_network_image/cached_network_image.dart';
import 'package:component_library/component_library.dart';
import 'package:component_library/src/article_card.dart';
import 'package:component_library/src/image_error_indicator.dart';
import 'package:component_library/src/utils/string_to_time_ago.dart';
import 'package:flutter/material.dart';

const _itemSpacing = Spacing.medium;

class ArticleCardInLarge extends ArticleCard {
  const ArticleCardInLarge({
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
      child: Column(
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
                errorWidget: (_, url, error) => const ImageErrorIndicator(),
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
            subHeading,
            style: theme.text.labelSmall,
          ),
        ],
      ),
    );
  }
}
