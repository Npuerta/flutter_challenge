import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:flutter/material.dart';

//mixin class ControllerForArticles{}
 abstract class ControllerForArticles extends ChangeNotifier {
  CustomException? error;
  ControllerStates cstate = ControllerStates.initial;
  
  List<ArticleEntitie> get getArticles;
  ControllerStates get state => cstate; 

}