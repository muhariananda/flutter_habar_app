import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_detail/src/cubit/news_detail_cubit.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailActionBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NewsDetailActionBar({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight + Spacing.xSmall,
      );

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final cubit = context.read<NewsDetailCubit>();

    return BlocBuilder<NewsDetailCubit, NewsDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            RowAppBar(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.text.labelLarge,
                      ),
                      Text(
                        article.url,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.text.bodySmall!.copyWith(
                          fontSize: FontSize.small,
                        ),
                      )
                    ],
                  ),
                ),
                ShareIconButton(
                  onShare: _onShare,
                ),
                BookmarkIconButton(
                  isBookmark: state.isBookmark,
                  onTap: (isBookmark) {
                    !isBookmark
                        ? cubit.bookmarkArticle()
                        : cubit.unbookmarkArticle();

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            !isBookmark ? 'Bookmark' : 'Unbookmark',
                            style: theme.text.bodySmall,
                          ),
                          backgroundColor: theme.colors.background,
                        ),
                      );
                  },
                ),
              ],
            ),
            Visibility(
              visible: state.progress < 1.0,
              child: LinearProgressIndicator(
                value: state.progress,
                minHeight: Spacing.xSmall,
              ),
            )
          ],
        );
      },
    );
  }

  void _onShare() {
    Share.share(article.url);
  }
}
