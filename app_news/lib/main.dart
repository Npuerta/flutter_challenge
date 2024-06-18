import 'package:app_news/global/api/custom_api_client.dart';
import 'package:app_news/src/data/repositories_impl/news_repository_impl.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/pages/home_news_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<CustomApiClient>(CustomApiClient());
  getIt.registerLazySingleton<NewsRepository>(()=> NewsRepositoryImpl());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
return MultiProvider(
  providers:[
    ChangeNotifierProvider(create: (context)=>SearchByTextController(getIt<NewsRepository>())),
    ChangeNotifierProvider(create: (context)=>MainNewsController(getIt<NewsRepository>())),
  ],
  child: const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeNewsPage(),
    ),
);

  }
}
