
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_main_news_by_category.dart';
import 'package:app_news/src/presentation/controllers/controller_for_articles.dart';

class SearchByCategoryController extends ControllerForArticles {

  late TopHeadlinesEntitie _topHeadlinesEntitie;
  late final NewsRepository _newsRepository;
  late final GetMainNewsByCategory _getMainNewsByCategory;


SearchByCategoryController(this._newsRepository){
_getMainNewsByCategory = GetMainNewsByCategory(_newsRepository);
}

  @override
   List<ArticleEntitie> get getArticles{
   return topHeadlinesEntitie.articles!;
  }

TopHeadlinesEntitie get topHeadlinesEntitie => _topHeadlinesEntitie;

Future<void> getSearchByCategory(String? category) async {
  try {
     if (category==null) return;
   cstate= ControllerStates.loading;
    notifyListeners();

_topHeadlinesEntitie = await _getMainNewsByCategory.call(category);

    cstate= ControllerStates.success;
    notifyListeners();
    
  } on CustomException catch (e) {
    error =e;
    cstate= ControllerStates.error;
    notifyListeners();
  }
}

 
}