import 'package:component_library/src/utils/string_to_time_ago.dart';
import 'package:flutter/material.dart';

abstract class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required this.title,
    required this.source,
    required this.publishedAt,
    required this.imageUrl,
    this.onTap,
    super.key,
  });

  final String title;
  final String source;
  final String publishedAt;
  final String imageUrl;
  final VoidCallback? onTap;

  String get timeInAgo => publishedAt.toTimeAgo();
  String get subHeading =>
      source.isNotEmpty ? '$source • $timeInAgo' : timeInAgo;

  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }
}
