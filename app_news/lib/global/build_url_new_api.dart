import 'package:app_news/global/constants.dart';
import 'package:app_news/src/data/models/news_api_parameters.dart';

class BuildUrlNewApi {
  String getUrl(NewsApiParameters newsP, String subUrl) {
    String result = '$urlApi$subUrl?'
        '${newsP.qSearch != null ? 'q=${newsP.qSearch}&' : ''}'
        '${newsP.searchIn != null ? 'searchIn=${newsP.searchIn}&' : ''}'
        '${newsP.domains != null ? 'domains=${newsP.domains}&' : ''}'
        '${newsP.sources != null ? 'sources=${newsP.sources}&' : ''}'
        '${newsP.category != null ? 'category=${newsP.category}&' : ''}'
        '${newsP.sortBy != null ? 'sortBy=${newsP.sortBy}&' : ''}'
        '${newsP.country != null ? 'country=${newsP.country}&' : ''}'
        '${newsP.language != null ? 'language=${newsP.language}&' : ''}'
        '${newsP.fromParam != null ? 'fromParam=${newsP.fromParam}&' : ''}'
        '${newsP.pageSize != null ? 'pageSize=${newsP.pageSize}&' : ''}'
        '${newsP.page != null ? 'page=${newsP.page}&' : ''}'
        '$apiKey';
    return result;
  }
}
