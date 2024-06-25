import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/controllers/main_news_controller.dart';
import 'package:app_news/src/presentation/controllers/options_controller.dart';
import 'package:app_news/src/presentation/controllers/sources_news_controller.dart';
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
            ButtonSegment(value: Country.co, label: Text('Col', overflow: TextOverflow.visible)),
            ButtonSegment(value: Country.us, label: Text('Us', overflow: TextOverflow.visible)),
            ButtonSegment(value: Country.ca, label: Text('Ca', overflow: TextOverflow.visible)),
           
          ],
          selected: <Country>{countryState.state},
          onSelectionChanged: (Set<Country> input) {
            countryState.setState(input.first);
            context.read<MainNewsController>().getMainNews(input.first.name);
            context.read<SourcesNewsController>().getSourcesByCountry(input.first.name);
            context.read<SelectCategoryState>().setState(Categories.topnews);
             context.read<OptionsController>().optionsByCountry = input.first;
          },
          
          style: SegmentedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 1, 9, 47),
            selectedForegroundColor: const Color.fromARGB(255, 237, 235, 253),
            backgroundColor: const Color.fromARGB(255, 167, 173, 201),
            selectedBackgroundColor: const Color.fromARGB(255, 42, 55, 239),
            side: BorderSide(width: 2, color: const Color.fromARGB(255, 133, 131, 131)),
            padding: EdgeInsets.only(bottom: 8,),
            minimumSize: Size.fromWidth(50),
          ),
          expandedInsets: const EdgeInsets.only(left: 10),   

        );
      }),
    );
  }
}
