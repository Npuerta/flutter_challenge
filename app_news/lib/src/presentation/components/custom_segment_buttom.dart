import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomSegmentButtom extends StatelessWidget {
  const CustomSegmentButtom({super.key});

  @override
  Widget build(BuildContext context) {
//  final categoryState = Provider.of<SelectCategoryState>(context);

    return ChangeNotifierProvider<SelectCategoryState>(
      create: (BuildContext context)=> SelectCategoryState(),
      child: Consumer<SelectCategoryState>(
          builder: (context, categoryState, child) {
        return SegmentedButton<Categories>(
          segments: const <ButtonSegment<Categories>>[
            ButtonSegment(value: Categories.topnews, label: Text('Top news', overflow: TextOverflow.visible)),
            ButtonSegment(value: Categories.general, label: Text('General', overflow: TextOverflow.visible)),
            ButtonSegment(value: Categories.business, label: Text('Bussines', overflow: TextOverflow.visible)),
            ButtonSegment(value: Categories.cience, label: Text('Cience', overflow: TextOverflow.visible)),
            ButtonSegment(
                value: Categories.entertainment, label: Text('Entertainment')),
            ButtonSegment(value: Categories.healths, label: Text('Healths')),
            ButtonSegment(value: Categories.sports, label: Text('Sports')),
            ButtonSegment(
                value: Categories.technology, label: Text('Technology')),
            ButtonSegment(value: Categories.search, label: Text('Search Result')),
          ],
          selected: <Categories>{categoryState.state},
          onSelectionChanged: (Set<Categories> input) {
            categoryState.setState(input.first);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
            minimumSize: WidgetStatePropertyAll<Size>(Size.infinite),
          ),
          expandedInsets: const EdgeInsets.only(left: 10),   

        );
      }),
    );
  }
}
