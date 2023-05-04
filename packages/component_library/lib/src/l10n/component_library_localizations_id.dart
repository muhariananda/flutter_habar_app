import 'component_library_localizations.dart';

/// The translations for Indonesian (`id`).
class ComponentLibraryLocalizationsId extends ComponentLibraryLocalizations {
  ComponentLibraryLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get emptyItemsMessage => 'Kamu belum memiliki berita yang ditandai';

  @override
  String get emptyResultTitle => 'Tidak ada berita yang ditemukan';

  @override
  String get emptyResultMessage =>
      'Silahkan untuk masukkan kata kunci yang lain.';

  @override
  String get exceptionIndicatorTitle => 'Opps terdapat kesalahan';

  @override
  String get exceptionIndicatorMessage =>
      'Terjadi kesalahan pada aplikasi, silahkan coba lagi nanti.';

  @override
  String get tryAgainLabel => 'Coba lagi';

  @override
  String get searchHintText => 'Pencarian';
}
