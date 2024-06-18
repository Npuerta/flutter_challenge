
import 'package:app_news/global/constants.dart';
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/src/presentation/components/custom_auto_complete.dart';
import 'package:app_news/src/presentation/components/custom_segment_buttom.dart';
import 'package:app_news/src/presentation/components/list_info_news.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/states/top_news_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeNewsPage();
}

class _HomeNewsPage extends State<HomeNewsPage> {

  late TopNewsState topNewsState;
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchByTextController>().getSearchByText('crujiente');
      context.read<MainNewsController>().getMainNews(Country.co.name);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: CustomScrollView(
          slivers: [
           Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                  const Center(
                    child: Row(
                      children: [
                        CustomAutoComplete(),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                const SizedBox(width: 2,),
                const Expanded(child: CustomSegmentButtom()),
                const SizedBox(width: 10,),
                Consumer<SearchByTextController>(
                  builder: (context, sController, child) {
                    if (sController.state == ControllerStates.initial ||
                        sController.state == ControllerStates.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (sController.state == ControllerStates.error) {
                      return Column(
                        children: [
                          Text(sController.error!.internalErrorCode),
                          Text(sController.error!.messageUser),
                        ],
                      );
                    } else {
                      final articles = sController.everythingEntitie.articles;
                      return Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (articles.length == index) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                final article = articles[index];
                                return Column(
                                  children: [
                                    Text(article.title!),
                                  ],
                                );
                              }
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                            itemCount: articles!.length),
                      );
                    }
                  },
                ),
                  MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (constext)=>TopNewsState())
                    ],
                    child: Consumer2<TopNewsState,MainNewsController>(
                    builder: (context, topController,newsController, child) {
          
                    if (newsController.state == ControllerStates.initial ||
                        newsController.state == ControllerStates.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (newsController.state == ControllerStates.error) {
                      return Column(
                        children: [
                          Text(newsController.error!.internalErrorCode),
                          Text(newsController.error!.messageUser),
                        ],
                      );
                    } else {
                      final articles = newsController.topHeadlinesEntitie.articles;
                      return Expanded(child: ListInfoNews(articles: articles!,));
                     
                    }
                    },
                    ),
                  ),
          
              ],
            ),
          ),
          ],

        ),
      ),
    );
  }
}
