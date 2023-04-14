import 'news_list_localizations.dart';

/// The translations for Indonesian (`id`).
class NewsListLocalizationsId extends NewsListLocalizations {
  NewsListLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get newsListRefreshErrorMessage => 'Tidak dapat memuat ulang item.\nSilahkan, cek koneksi internet anda dan ulangi kembali nanti.';

  @override
  String get listHeader => 'Berita harian anda';

  @override
  String get listSubHeader => 'Jelahi berbagai macam berita terkini.';

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
