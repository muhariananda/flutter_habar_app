import 'package:domain_models/domain_models.dart';

extension CategoryToRM on Category {
  String toRemoteModel() {
    switch (this) {
      case Category.business:
        return 'business';
      case Category.entertainment:
        return 'entertaiment';
      case Category.health:
        return 'health';
      case Category.science:
        return 'science';
      case Category.sports:
        return 'sports';
      case Category.technology:
        return 'technology';
    }
  }
}
