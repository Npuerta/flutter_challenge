import 'package:app_news/global/constants.dart';
import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 10, 19, 87),
                    ),
                    text: widget.source.name),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 24, 42, 180),
                    ),
                    text: widget.source.description),
              ],
            ),
          ),
          SizedBox(
            height: 10,
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
                      color: const Color.fromARGB(255, 10, 19, 87),
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
                      color: const Color.fromARGB(255, 76, 37, 113),
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
