import 'package:domain_models/domain_models.dart';
import 'package:key_value_storage/key_value_storage.dart';

extension ArticleToCM on Article {
  ArticleCM toCacheModel() => ArticleCM(
        source: source.toCacheModel(),
        title: title,
        url: url,
        publishedAt: publishedAt,
        author: author,
        description: description,
        content: content,
        urlToImage: urlToImage,
      );
}

extension SourceToCM on Source {
  SourceCM toCacheModel() => SourceCM(
        id: id,
        name: name,
      );
}
