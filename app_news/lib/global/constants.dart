enum Categories {
  topnews,
  general,
  business,
  entertainment,
  healths,
  cience,
  sports,
  technology,
  search
}

enum Country {
  ae,
  ar,
  at,
  au,
  be,
  bg,
  br,
  ca,
  ch,
  cn,
  co,
  cu,
  cz,
  de,
  eg,
  fr,
  gb,
  gr,
  hk,
  hu,
  id,
  ie,
  il,
  iN,
  it,
  jp,
  kr,
  lt,
  lv,
  ma,
  mx,
  my,
  ng,
  nl,
  no,
  nz,
  ph,
  pl,
  pt,
  ro,
  rs,
  ru,
  sa,
  se,
  sg,
  si,
  sk,
  th,
  tr,
  tw,
  ua,
  us,
  ve,
  za
}

enum SearchIn { title, description, content }

enum Language { ar, de, en, es, fr, he, it, nl, no, pt, ru, sv, ud, zh }

enum SortBy { relevancy, popularity, publishedAt }

String urlApi = 'https://newsapi.org/v2/';
String apiKey = 'apiKey=ef5c2b3ac88749cc9aac458180fc2c1f';

String WeatherKey = '72bb04adf23c4c24952191455242406';

String pageSizeSmall='10';
String pageSizeMedium='20';
String pageSizeBig='50';