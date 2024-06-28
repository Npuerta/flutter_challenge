import 'package:app_news/global/constants.dart';
import 'package:app_news/src/presentation/controllers/search_by_category_controller.dart';
import 'package:app_news/src/presentation/states/search_state.dart';
import 'package:app_news/src/presentation/states/select_category_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class listCategoriesButtons extends StatelessWidget {
  const listCategoriesButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<SelectCategoryState, SearchState>(
      builder: (context, cState, sState, child) {
        final listCategory = Categories.values;
        return SizedBox(
          height: 35,
          child: ListView.separated(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  child: Text(listCategory[index].name),
                  style:ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 31, 21, 93),
                    backgroundColor: const Color.fromARGB(255, 189, 185, 212),
                  ) ,
                  onPressed: () {
                    if (cState.state == listCategory[index]) return;
                    if (listCategory[index] == Categories.search &&
                        sState.state == '') return;

                    if (listCategory[index] != Categories.search &&
                        listCategory[index] != Categories.topnews) {
                      context
                          .read<SearchByCategoryController>()
                          .getSearchByCategory(listCategory[index].name);
                    }

                    context
                        .read<SelectCategoryState>()
                        .setState(listCategory[index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemCount: Categories.values.length),
        );
      },
    );
  }
}
