class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://newsapi.org/v2';

  static const _countryCode = 'id';
  static const _pageSize = 20;

  final String _baseUrl;

  String buildGetArticleListPage(
    int page, {
    String? category,
    String searchTerm = '',
    String countryCode = _countryCode,
  }) {
    assert(
      category == null && searchTerm.isEmpty,
      "News api doesn't support searching by both query and "
      'tag at the same time',
    );

    final endpoint = searchTerm.isNotEmpty ? 'everything' : 'top-headlines';

    final searchQueryStringPart = searchTerm.isNotEmpty ? '&q=$searchTerm' : '';

    final categoryQueryStringPart =
        category != null ? '&category=$category' : '';

    final countryQueryStringPart =
        searchTerm.isEmpty ? '&country=$countryCode' : '';

    return '$_baseUrl/$endpoint'
        '?page=$page'
        '&pageSize=$_pageSize'
        '$countryQueryStringPart'
        '$categoryQueryStringPart'
        '$searchQueryStringPart';
  }
}
