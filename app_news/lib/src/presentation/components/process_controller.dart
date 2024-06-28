import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/custom_circular_progress_indicator.dart';
import 'package:app_news/src/presentation/components/result_articles.dart';
import 'package:app_news/src/presentation/controllers/controller_for_articles.dart';
import 'package:flutter/material.dart';

class ProcessController extends StatelessWidget {
  final ControllerForArticles controller;

  ProcessController({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<ArticleEntitie>? articles;
    ControllerStates? state;
    CustomException? error;

    try {
      state = controller.state;
      error = controller.error;

      if (state == ControllerStates.initial ||
          state == ControllerStates.loading) {
        return CustomCircularProgressIndicator();
      } else if (state == ControllerStates.error) {
        return Column(
          children: [
            Text(error!.internalErrorCode),
            Text(error.messageUser),
          ],
        );
      }

      articles = controller.getArticles;

      return resultArticles(articles: articles);
    } on Exception {
      return Text('ERROORR');
    }
  }
}
