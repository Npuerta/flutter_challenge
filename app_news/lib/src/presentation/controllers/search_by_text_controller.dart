
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_search_by_text.dart';
import 'package:app_news/src/presentation/controllers/controller_for_articles.dart';



class SearchByTextController extends ControllerForArticles {

  late EverythingEntitie _everythingEntitie;
  late final NewsRepository _newsRepository;
  late final GetSearchByText _getSearchByText;
 String currentSearchText='';

SearchByTextController(this._newsRepository){
_getSearchByText = GetSearchByText(_newsRepository);
}


  @override
  List<ArticleEntitie> get getArticles {
    // return everythingEntitie.articles??[];
    return everythingEntitie.articles!;
  }

EverythingEntitie get everythingEntitie => _everythingEntitie;

Future<void> getSearchByText(String? searchText) async {
  try {
     if (searchText==null || searchText=='' || currentSearchText==searchText) return;
   cstate= ControllerStates.loading;
    notifyListeners();

_everythingEntitie = await _getSearchByText.call(searchText);
    currentSearchText=searchText;
    
    cstate= ControllerStates.success;
    notifyListeners();
    
  } on CustomException catch (e) {
    error =e;
    cstate= ControllerStates.error;
    notifyListeners();
  }
}

}