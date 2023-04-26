part of 'bookmarks_cubit.dart';

abstract class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object?> get props => [];
}

class BookmarksInitial extends BookmarksState {
  const BookmarksInitial();
}

class BookmarksLoaded extends BookmarksState {
  const BookmarksLoaded(this.items);

  final List<Article> items;

  @override
  List<Object?> get props => [items];
}

class BookmarksEmpty extends BookmarksState {
  const BookmarksEmpty();
}
