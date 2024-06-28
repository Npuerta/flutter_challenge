import 'package:app_news/global/pages_router.dart';
import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoSource extends StatelessWidget{
 const InfoSource({super.key, required this.source});

final HeadlinesSourceEntitie source;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 0.3,
      child: ElevatedButton(
        child: Column(
          children: [
            Center(
              child: Text(
              source.name,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: const Color.fromARGB(255, 244, 236, 245),
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              ),
            ),
          Center(
            child: Text(
              source.category,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: const Color.fromARGB(255, 71, 16, 107),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            ]
          ),
        onPressed: () {
          context.push(
           PagesRouter.detailSource,
           extra: source
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(172, 175, 143, 245),
          disabledBackgroundColor: Color.fromARGB(172, 65, 65, 120),
          padding: EdgeInsets.only(top: 40,left: 10, right: 10), 
        ),
      ),
    );
  }
  
}