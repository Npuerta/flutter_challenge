import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
import 'package:app_news/src/presentation/components/info_source.dart';
import 'package:app_news/src/presentation/controllers/sources_news_controller.dart';
import 'package:app_news/src/presentation/utils/state_controller_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListSourcesNews extends StatelessWidget {
  const ListSourcesNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SourcesNewsController>(
      builder: (context, snCotroller, child) {
        RenderObjectWidget? valido = StateControllerValidator.valid(
            snCotroller.state, snCotroller.error);

        if (valido == null) {
         final sources = snCotroller.headlinesEntitie.sources;

         if(sources.isEmpty){
          final Runes sad = Runes('\u{1F641}');
          return SizedBox(
            height: 50,
            child: Center(
              child: Text(
                  'No hay Fuentes de noticias para el pais ${String.fromCharCodes(sad)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 56, 11, 8),
                  ),
                ),
            ),
          );
         }
          return SizedBox(
            height: 145,
            child: ListView.separated(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (sources.length == index) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final HeadlinesSourceEntitie hSource = sources[index];
                    return InfoSource(source: hSource);
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
                itemCount: sources.length),
          );
        } else {
          return valido;
        }
      },
    );
  }
}
