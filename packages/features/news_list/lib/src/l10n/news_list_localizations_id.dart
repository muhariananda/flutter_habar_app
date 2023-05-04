import 'news_list_localizations.dart';

/// The translations for Indonesian (`id`).
class NewsListLocalizationsId extends NewsListLocalizations {
  NewsListLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get newsListRefreshErrorMessage =>
      'Tidak dapat memuat ulang item.\nSilahkan, cek koneksi internet anda dan ulangi kembali nanti.';

  @override
  String get listHeader => 'Utama Hari Ini';

  @override
  String get listSubHeader => 'Selalu up-to-date dengan berita terpopuler';

  @override
  String get allLabel => 'Semua';

  @override
  String get businessLabel => 'Bisnis';

  @override
  String get healthLabel => 'Kesehatan';

  @override
  String get scienceLabel => 'Pengetahun';

  @override
  String get sportsLabel => 'Olahraga';

  @override
  String get technologyLabel => 'Teknologi';

  @override
  String get entertainmentLabel => 'Hiburan';
}
