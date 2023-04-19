import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_detail/src/cubit/news_detail_cubit.dart';
import 'package:news_detail/src/widgets/news_detail_action_bar.dart';
import 'package:news_repository/news_repository.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    required this.article,
    required this.newsRepository,
    super.key,
  });

  static const routeName = '/detail';

  final Article article;
  final NewsRepository newsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsDetailCubit>(
      create: (_) => NewsDetailCubit(
        article: article,
        newsRepository: newsRepository,
      ),
      child: NewsDetailView(
        article: article,
      ),
    );
  }
}

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NewsDetailCubit>();

    return Scaffold(
      appBar: NewsDetailActionBar(
        article: article,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            article.url,
          ),
        ),
        onProgressChanged: (_, progress) {
          cubit.onProgress(
            progress / 100,
          );
        },
      ),
    );
  }
}
