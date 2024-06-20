import 'package:app_news/global/controller_states.dart';
import 'package:app_news/global/custom_exception.dart';
import 'package:flutter/material.dart';

class StateControllerValidator {

  StateControllerValidator();

  static RenderObjectWidget? valid(ControllerStates state, CustomException? error) {
    if (state == ControllerStates.initial ||
        state == ControllerStates.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state == ControllerStates.error) {
      return Column(
        children: [
          Text(error!.internalErrorCode),
          Text(error.messageUser),
        ],
      );
    } 
   return null;
  }

}