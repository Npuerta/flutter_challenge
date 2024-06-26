import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget{
  
  const ImageDetail({
    super.key,
    required this.urlImage,
    required this.source,
    required this.minWidth,
    required this.maxWidth,
    required this.day,
  });

  final String? urlImage;
  final String source;
  final double minWidth;
  final double maxWidth;
  final String day;

  @override
  Widget build(BuildContext context) {

if (urlImage == null){
return Container(
   padding: EdgeInsets.all(5),
    constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth,minHeight: 150, maxHeight: 180),
  child: Image.asset('assets/images/no_found.jpg'),
  );
}

  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth,minHeight: 150, maxHeight: 180),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: '$urlImage',
            fit: BoxFit.cover,
            placeholder: (context, url) =>Image.asset('assets/images/no_found.jpg'),
            errorWidget: (context, url,error) =>Image.asset('assets/images/no_found.jpg'),
          ),
        
        ),
      ),
      SizedBox(width: 10,),
      Text(day,overflow: TextOverflow.ellipsis, style: TextStyle(
                color: const Color.fromARGB(255, 241, 242, 247)
              ),),
      Text('Published By $source', overflow: TextOverflow.ellipsis, style: TextStyle(
                color: const Color.fromARGB(255, 241, 242, 247)
              ),),
    ],
  );
  }
  
}