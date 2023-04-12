class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://newsapi.org/v2';

  static const _countryCode = 'ar';
  static const _pageSize = 20;

  final String _baseUrl;

  String buildGetArticleListPage(
    int page, {
    String? category,
    String searchTerm = '',
  }) {
    final endpoint = searchTerm.isNotEmpty ? 'everything' : 'top-headlines';

    final searchQueryStringPart = searchTerm.isNotEmpty ? '&q=$searchTerm' : '';

    final categoryQueryStringPart =
        category != null ? '&category=$category' : '';

    final countryQueryStringPart =
        searchTerm.isEmpty ? '&country=$_countryCode' : '';

    return '$_baseUrl/$endpoint'
        '?page=$page'
        '&pageSize=$_pageSize'
        '$countryQueryStringPart'
        '$categoryQueryStringPart'
        '$searchQueryStringPart';
  }
}
