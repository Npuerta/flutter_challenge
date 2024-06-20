import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourceNewsPage extends StatefulWidget{

const SourceNewsPage({super.key, required this.source});

final HeadlinesSourceEntitie source;

  @override
  State<StatefulWidget> createState()=>_SourceNewsPage();
}

class _SourceNewsPage extends State<SourceNewsPage> {

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [ 
          FilledButton(onPressed: (){
            context.pop();
          }, child: Text(widget.source.name)),
        Text('sourcesssssss'),
        ]
      ),
    );
  }
}
