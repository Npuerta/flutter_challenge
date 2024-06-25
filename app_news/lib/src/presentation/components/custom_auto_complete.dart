import 'package:app_news/global/constants.dart';
import 'package:app_news/global/controller_states.dart';
import 'package:app_news/src/presentation/controllers/options_controller.dart';

import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/states/search_state.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAutoComplete extends StatelessWidget{
  const CustomAutoComplete({super.key});


  @override
  Widget build(BuildContext context) {

    void selectText(String value) {
      SearchByTextController sController =
          context.read<SearchByTextController>();
      SearchState sState = context.read<SearchState>();
      SelectCategoryState cState = context.read<SelectCategoryState>();
      String withOutWhiteSpaces = value.replaceAll(' ', '+');

      if (sState.state != withOutWhiteSpaces && withOutWhiteSpaces != '') {
        sController.getSearchByText(withOutWhiteSpaces);
        sState.setState(withOutWhiteSpaces);
        cState.setState(Categories.search);
      }
   
   
    }
   
    return Consumer<OptionsController>(
        builder: (context,opController, child) {

  if (opController.state == ControllerStates.initial ||
                        opController.state == ControllerStates.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (opController.state == ControllerStates.error) {
                      return Column(
                        children: [
                          Text(opController.error!.internalErrorCode),
                          Text(opController.error!.messageUser),
                        ],
                      );
                    }

         opController.optionsByCountry = context.read<SelectCountryState>().state;

          return Expanded(
          child: Autocomplete<String>(
           
            fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                labelText: 'buscar',
                hoverColor: Color.fromARGB(255, 144, 202, 249),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                ),
                onFieldSubmitted: (value) {
                  selectText(value);
                },
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
            
              return opController.options.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
        
        
            },
            onSelected: (String selection) {
              selectText(selection);
               
            },
          ),
        );
        },
      );
    
  }
}
