import 'package:app_news/global/local_search_option.dart';
import 'package:flutter/material.dart';

class CustomAutoComplete extends StatelessWidget{
  const CustomAutoComplete({super.key});

  @override
  Widget build(BuildContext context) {
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
            )
            ),
          );
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.length > 10){
            Iterable<String> result = textEditingValue. text.split('').sublist(0,10);
            return result;
          }
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return LocalSearchOption().options.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
      ),
    );
  }
}
