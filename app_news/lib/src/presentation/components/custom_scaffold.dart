import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget{

final Widget bodys;
final String title;
CustomScaffold({super.key , required this.bodys,required this.title});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
          appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(title, style: TextStyle(color: Colors.white, fontSize: 14),),
          backgroundColor:  Color.fromARGB(226, 27, 27, 27),
          iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 238, 237, 237),
          ),
        
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(227, 48, 48, 48),
        Color.fromARGB(245, 135, 135, 135),
        Color.fromARGB(255, 215, 223, 249),
      ],
    ),
        ),
        child: bodys,
        ),

   );
  }

}