
import 'package:app_news/global/constants.dart';
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/custom_auto_complete.dart';
import 'package:app_news/src/presentation/components/country_segment_buttom.dart';
import 'package:app_news/src/presentation/components/list_info_news.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});
  @override
  State<StatefulWidget> createState() => _HomeNewsPage();
}

class _HomeNewsPage extends State<HomeNewsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SelectCountryState countryState = context.read<SelectCountryState>();
      context.read<MainNewsController>().getMainNews(countryState.state.name);
      context.read<SearchByTextController>().getSearchByText;
      context.read<SearchByCategoryController>().getSearchByCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Row(
              children: [CustomAutoComplete(), Icon(Icons.search)],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          CountrySegmentButtom(),

          const SizedBox(
            width: 10,
          ),
          Consumer4<MainNewsController,SearchByTextController,SearchByCategoryController,SelectCategoryState>(
              builder: (context, newsController,sController,scController,cState,child) {

          if (cState.state == Categories.topnews) {
                RenderObjectWidget? valido = stateControllerValidator(
                    newsController.state, newsController.error);
                if (valido == null) {
                  final articles = newsController.topHeadlinesEntitie.articles;
                  return SizedBox(
                      height: 500,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              } else if (cState.state == Categories.search) {
                RenderObjectWidget? valido = stateControllerValidator(
                    sController.state, sController.error);
                if (valido == null) {
                  final articles = sController.everythingEntitie.articles;
                  return SizedBox(
                      height: 500,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              } else {
                RenderObjectWidget? valido = stateControllerValidator(
                    scController.state, scController.error);
                if (valido == null) {
                  final articles = scController.topHeadlinesEntitie.articles;
                  return SizedBox(
                      height: 500,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              }
            },
          ),
        ],
      ),
    );
  }

  RenderObjectWidget? stateControllerValidator(ControllerStates state, CustomException? error) {
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
   return null;
  }
}
