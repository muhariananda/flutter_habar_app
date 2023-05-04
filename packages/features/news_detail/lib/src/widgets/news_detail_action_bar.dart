import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_detail/news_detail.dart';
import 'package:news_detail/src/cubit/news_detail_cubit.dart';
import 'package:share_plus/share_plus.dart';

const _progressIndicatorHeight = 1.5;

class NewsDetailActionBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NewsDetailActionBar({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight + _progressIndicatorHeight,
      );

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = NewsDetailLocalizations.of(context);
    final cubit = context.read<NewsDetailCubit>();

    return BlocBuilder<NewsDetailCubit, NewsDetailState>(
      builder: (context, state) {
        final isProgressFinished = state.progress < 1.0;

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
                        style: theme.text.titleSmall,
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
                  onShare: _handleOnShare,
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
                            !isBookmark
                                ? l10n.bookmarkedMessage
                                : l10n.unbookmarkMessage,
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
              visible: isProgressFinished,
              child: LinearProgressIndicator(
                value: state.progress,
                minHeight: _progressIndicatorHeight,
              ),
            )
          ],
        );
      },
    );
  }

  void _handleOnShare() {
    Share.share(article.url);
  }
}
