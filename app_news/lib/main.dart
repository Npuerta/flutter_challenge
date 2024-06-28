import 'package:app_news/firebase_options.dart';
import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/global/pages_router.dart';
import 'package:app_news/src/data/repositories_impl/news_repository_impl.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/options_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_source_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/controllers/sources_news_controller.dart';
import 'package:app_news/src/presentation/controllers/weather_city_controller.dart';
import 'package:app_news/src/presentation/pages/detail_new_page.dart';
import 'package:app_news/src/presentation/pages/home_news_page.dart';
import 'package:app_news/src/presentation/pages/source_news_page.dart';
import 'package:app_news/src/presentation/states/search_state.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() async {
  getIt.registerSingleton<CustomApiClient>(CustomApiClient());
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

final _routerApp = GoRouter(initialLocation: PagesRouter.home, routes: [
  GoRoute(
    path: PagesRouter.home,
    builder: (context, state) => HomeNewsPage(),
  ),
  GoRoute(
    path: PagesRouter.detailNews,
    builder: (context, state) =>
        DetailNewPage(article: state.extra as ArticleEntitie),
  ),
  GoRoute(
    path: PagesRouter.detailSource,
    builder: (context, state) {
      // si se agrega MultiProvider se van a crea multiples instacias del SearchBySourceController
      // al hacer al  SourceNewsPage
      return SourceNewsPage(source: state.extra as HeadlinesSourceEntitie);
    },
  ),
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchByTextController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => MainNewsController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SearchByCategoryController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => SourcesNewsController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => OptionsController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherCityController(getIt<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectCountryState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchState(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectCategoryState(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SearchBySourceController(getIt<NewsRepository>()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _routerApp,
      ),
    );
  }
}
