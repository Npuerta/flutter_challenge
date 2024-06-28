import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/custom_scaffold.dart';
import 'package:app_news/src/presentation/components/detail_new.dart';
import 'package:flutter/material.dart';

class DetailNewPage extends StatefulWidget {
  const DetailNewPage({super.key, required this.article});

  final ArticleEntitie article;

  @override
  State<StatefulWidget> createState() => _DetailNewPage();
}

class _DetailNewPage extends State<DetailNewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Mas Informacion',
      bodys: DetailNew(article: widget.article),
    );
  }
}
