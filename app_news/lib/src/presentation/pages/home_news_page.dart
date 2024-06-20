
import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/components/custom_auto_complete.dart';
import 'package:app_news/src/presentation/components/country_segment_buttom.dart';
import 'package:app_news/src/presentation/components/list_categories_buttons.dart';
import 'package:app_news/src/presentation/components/list_info_news.dart';
import 'package:app_news/src/presentation/components/list_sources_news.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/controllers/sources_news_controller.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';
import 'package:app_news/src/presentation/utils/state_controller_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomeNewsPage extends StatefulWidget {
 const HomeNewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeNewsPage();
}

class _HomeNewsPage extends State<HomeNewsPage> {
  final getIt = GetIt.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SelectCountryState countryState = context.read<SelectCountryState>();
      context.read<MainNewsController>().getMainNews(countryState.state.name);
      context.read<SourcesNewsController>().getSourcesByCountry(countryState.state.name);
      context.read<SearchByTextController>().getSearchByText;
      context.read<SearchByCategoryController>().getSearchByCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Row(children:<Widget>[
            Flexible(
              flex: 1,
              child: SizedBox(),
              ),

            Flexible(
              flex:1,
              fit: FlexFit.tight,
              child: SizedBox(height: 40, child: CountrySegmentButtom())
            )
            ]),
          
            SizedBox(
              height: 50,
              child: Row(children: [CustomAutoComplete()])),
         
           SizedBox(
            height: 8,
          ),
        
        listCategoriesButtons(),

          SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer4<MainNewsController,SearchByTextController,SearchByCategoryController,SelectCategoryState>(
              builder: (context, newsController,sController,scController,cState,child) {

          if (cState.state == Categories.topnews) {
                RenderObjectWidget? valido = StateControllerValidator.valid(
                    newsController.state, newsController.error);
                if (valido == null) {
                  final articles = newsController.topHeadlinesEntitie.articles;
                  return SizedBox(
                      height: 260,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              } else if (cState.state == Categories.search) {
                RenderObjectWidget? valido = StateControllerValidator.valid(
                    sController.state, sController.error);
                if (valido == null) {
                  final articles = sController.everythingEntitie.articles;
                  return SizedBox(
                      height: 260,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              } else {
                RenderObjectWidget? valido = StateControllerValidator.valid(
                    scController.state, scController.error);
                if (valido == null) {
                  final articles = scController.topHeadlinesEntitie.articles;
                  return SizedBox(
                      height: 260,
                      child: ListInfoNews(
                        articles: articles!,
                      ));
                } else {
                  return valido;
                }
              }
            },
          ),
          SizedBox(height: 10,),
          ListSourcesNews(),
          SizedBox(height: 10,),
        ],
      ),
    );
  
    
    

  }


}

