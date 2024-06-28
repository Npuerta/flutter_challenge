import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/repositories/news_repository.dart';
import 'package:app_news/src/domain/usecases/get_news_by_source.dart';
import 'package:app_news/src/presentation/controllers/controller_for_articles.dart';


class SearchBySourceController extends ControllerForArticles {

  late EverythingEntitie _everythingEntitie;
  late final NewsRepository _newsRepository;
  late final GetNewsBySource _getNewsBySource;
  String currentSourceId='';

  SearchBySourceController(this._newsRepository) {
    _getNewsBySource = GetNewsBySource(_newsRepository);
  }

  @override
  List<ArticleEntitie> get getArticles {
    return everythingEntitie.articles!;
  }

  EverythingEntitie get everythingEntitie => _everythingEntitie;


  Future<void> getNewsBySource(
      String sourceId, String sortBy, String pageSize) async {
    try {

      if(currentSourceId==sourceId) return;
      cstate = ControllerStates.loading;
      notifyListeners();

      _everythingEntitie = await _getNewsBySource.call(sourceId, sortBy, pageSize);
      currentSourceId=sourceId;
      
      cstate = ControllerStates.success;
      notifyListeners();
    } on CustomException catch (e) {
      error = e;
      cstate = ControllerStates.error;
      notifyListeners();
    }
  }


}
