import 'package:flutter/material.dart';

class CustomCircularProgressIndicator  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

return Center(
      child: CircularProgressIndicator(
      backgroundColor: const Color.fromARGB(255, 215, 247, 216),
      strokeWidth: 2,
      color: const Color.fromARGB(255, 61, 223, 70),
      ),
    );
    
  }


}