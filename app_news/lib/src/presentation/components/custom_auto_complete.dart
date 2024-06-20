import 'package:app_news/global/constants.dart';
import 'package:app_news/global/local_search_option.dart';
import 'package:app_news/src/presentation/controllers/search_by_text_controller.dart';
import 'package:app_news/src/presentation/states/search_state.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
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

      if (sState.state != withOutWhiteSpaces) {
        sController.getSearchByText(withOutWhiteSpaces);
        sState.setState(withOutWhiteSpaces);
      }
      cState.setState(Categories.search);
    }
   
    return Expanded(
      child: Autocomplete<String>(
        // initialValue: const TextEditingValue(text: 'hola'),
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
          return LocalSearchOption().options.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });


        },
        onSelected: (String selection) {
          selectText(selection);
           
        },
      ),
    );
  }
}
