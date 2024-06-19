import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:app_news/src/presentation/states/select_country_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CountrySegmentButtom extends StatelessWidget {
  const CountrySegmentButtom({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<SelectCountryState>(
      create: (BuildContext context)=> SelectCountryState(),
      child: Consumer<SelectCountryState>(
          builder: (context, countryState, child) {
        return SegmentedButton<Country>(
          segments: const <ButtonSegment<Country>>[
            ButtonSegment(value: Country.us, label: Text('Us', overflow: TextOverflow.visible)),
            ButtonSegment(value: Country.co, label: Text('Col', overflow: TextOverflow.visible)),
            ButtonSegment(value: Country.br, label: Text('Br', overflow: TextOverflow.visible)),
           
          ],
          selected: <Country>{countryState.state},
          onSelectionChanged: (Set<Country> input) {
            countryState.setState(input.first);
            context.read<MainNewsController>().getMainNews(input.first.name);
            context.read<SelectCategoryState>().setState(Categories.topnews);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 76, 119, 175)),
            minimumSize: WidgetStatePropertyAll<Size>(Size.infinite),
          ),
          expandedInsets: const EdgeInsets.only(left: 10),   

        );
      }),
    );
  }
}
