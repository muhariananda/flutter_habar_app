import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';
import 'package:news_list/src/l10n/news_list_localizations.dart';

const _itemSpacing = Spacing.xSmall;

class FilterHorizontalList extends StatelessWidget {
  const FilterHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.medium,
      ),
      child: Row(
        children: [
          _Chip(),
          ...Category.values.map(
            (category) => _CategoryChip(
              category: category,
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final l10n = NewsListLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: theme.screenMargin,
        right: _itemSpacing,
      ),
      child: BlocSelector<NewsListBloc, NewsListState, bool>(
        selector: (state) {
          final isFiltering = state.filter != null;
          return isFiltering;
        },
        builder: (context, isFiltering) {
          return RoundedChoiceChip(
            label: l10n.allLabel,
            isSelected: !isFiltering,
            onSelected: (isSelected) {
              _releaseFocus(context);
              context.read<NewsListBloc>().add(
                    const NewsListCategoryChanged(null),
                  );
            },
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = NewsTheme.of(context)!;
    final isLastCategory = Category.values.last == category;

    return Padding(
      padding: EdgeInsets.only(
        left: _itemSpacing,
        right: isLastCategory ? theme.screenMargin : _itemSpacing,
      ),
      child: BlocSelector<NewsListBloc, NewsListState, Category?>(
        selector: (state) {
          final filter = state.filter;
          final selectedTag =
              filter is NewsListFilterByCategory ? filter.category : null;
          return selectedTag;
        },
        builder: (context, selectedCategory) {
          return RoundedChoiceChip(
            label: category.toLocalizations(context),
            isSelected: selectedCategory == category,
            onSelected: (isSelected) {
              _releaseFocus(context);
              context.read<NewsListBloc>().add(
                    NewsListCategoryChanged(
                      isSelected ? category : null,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}

void _releaseFocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

extension on Category {
  String toLocalizations(BuildContext context) {
    final l10n = NewsListLocalizations.of(context);

    switch (this) {
      case Category.business:
        return l10n.businessLabel;
      case Category.entertainment:
        return l10n.entertainmentLabel;
      case Category.health:
        return l10n.healthLabel;
      case Category.science:
        return l10n.scienceLabel;
      case Category.sports:
        return l10n.sportsLabel;
      case Category.technology:
        return l10n.technologyLabel;
    }
  }
}
