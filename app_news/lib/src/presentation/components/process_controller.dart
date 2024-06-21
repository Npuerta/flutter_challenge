import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/result_articles.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_source_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:flutter/material.dart';

class ProcessController extends StatelessWidget {
  final Object controller;

   ProcessController({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<ArticleEntitie>? articles;
    ControllerStates? state;
    CustomException? error;

    print('lero lero');

    try {

       if (controller is SearchByTextController) {
        SearchByTextController control = controller as SearchByTextController;
        state = control.state;
        error = control.error;
      }

      if (controller is MainNewsController) {
        MainNewsController control = controller as MainNewsController;
        state = control.state;
        error = control.error;
      }

      if (controller is SearchByCategoryController) {
        SearchByCategoryController control =
            controller as SearchByCategoryController;
        state = control.state;
        error = control.error;
      }

      if (controller is SearchBySourceController) {
        SearchBySourceController control =
            controller as SearchBySourceController;
        state = control.state;
        error = control.error;
      }
     

      if (state == ControllerStates.initial ||
          state == ControllerStates.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state == ControllerStates.error) {
        return Column(
          children: [
            Text(error!.internalErrorCode),
            Text(error.messageUser),
          ],
        );
      }

 if (controller is SearchByTextController) {
        SearchByTextController control = controller as SearchByTextController;
        articles = control.everythingEntitie.articles;
      }

      if (controller is MainNewsController) {
        MainNewsController control = controller as MainNewsController;
        articles = control.topHeadlinesEntitie.articles;
      }

      if (controller is SearchByCategoryController) {
        SearchByCategoryController control =
            controller as SearchByCategoryController;
        articles = control.topHeadlinesEntitie.articles;
      }

      if (controller is SearchBySourceController) {
        SearchBySourceController control =
            controller as SearchBySourceController;
        articles = control.everythingEntitie.articles;
      }


      return resultArticles(articles: articles);
    } on Exception {
      return Text('ERROORR');
    }
  }
}
