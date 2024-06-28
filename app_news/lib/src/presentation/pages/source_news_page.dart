import 'package:app_news/global/constants.dart';
import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
import 'package:app_news/src/presentation/components/custom_scaffold.dart';
import 'package:app_news/src/presentation/controllers/search_by_source_controller.dart';
import 'package:app_news/src/presentation/components/process_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SourceNewsPage extends StatefulWidget {
  const SourceNewsPage({super.key, required this.source});

  final HeadlinesSourceEntitie source;

  @override
  State<StatefulWidget> createState() => _SourceNewsPage();
}

class _SourceNewsPage extends State<SourceNewsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBySourceController>().getNewsBySource(
          widget.source.id, SortBy.publishedAt.name, pageSizeMedium);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Fuente',
      bodys: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 236, 237, 241),
                      fontWeight: FontWeight.bold,
                    ),
                    text: widget.source.name),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 215, 218, 240),
                      ),
                      text: widget.source.description),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Consumer<SearchBySourceController>(
            builder: (context, ssCotroller, child) {
             return ProcessController(controller:ssCotroller);
            },
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 31, 56, 248),
                    ),
                    text: 'para mas informacion'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 138, 20, 249),
                    ),
                    text: widget.source.url),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
