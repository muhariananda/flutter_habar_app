import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/src/bloc/news_list_bloc.dart';

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
            label: 'All',
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
    this.category,
  });

  final Category? category;

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
            label: category.toString(),
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
