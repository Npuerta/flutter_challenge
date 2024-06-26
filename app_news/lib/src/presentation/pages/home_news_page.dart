import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/components/custom_auto_complete.dart';
import 'package:app_news/src/presentation/components/country_segment_buttom.dart';
import 'package:app_news/src/presentation/components/list_categories_buttons.dart';
import 'package:app_news/src/presentation/components/list_sources_news.dart';
import 'package:app_news/src/presentation/components/weather_modal.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/options_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/controllers/sources_news_controller.dart';
import 'package:app_news/src/presentation/controllers/weather_city_controller.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';
import 'package:app_news/src/presentation/components/process_controller.dart';
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
      context
          .read<SourcesNewsController>()
          .getSourcesByCountry(countryState.state.name);
      context.read<OptionsController>().getOptionsAuto();
      context.read<SearchByTextController>().getSearchByText;
      context.read<SearchByCategoryController>().getSearchByCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Row(children: <Widget>[
            Flexible(
              flex: 1,
              child: SizedBox(),
            ),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: SizedBox(height: 40, child: CountrySegmentButtom()))
          ]),
          SizedBox(
            height: 50,
            child: CustomAutoComplete(),
          ),
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
          Consumer4<MainNewsController, SearchByTextController,
              SearchByCategoryController, SelectCategoryState>(
            builder: (context, newsController, sController, scController,
                cState, child) {
              if (cState.state == Categories.topnews) {
                return ProcessController(controller: newsController);
              } else if (cState.state == Categories.search) {
                return ProcessController(controller: sController);
              } else {
                return ProcessController(controller: scController);
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListSourcesNews(),
          SizedBox(
            height: 10,
          ),
            
          Consumer<SelectCountryState>(builder: (context, countryState, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context
                  .read<WeatherCityController>()
                  .getWeatherCity(countryState.state);
            });
            return WeatherModal();
          }
            
            ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
