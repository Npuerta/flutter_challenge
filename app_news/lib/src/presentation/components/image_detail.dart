import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget{
  
  const ImageDetail({
    super.key,
    required this.urlImage,
    required this.source,
    required this.day,
  });

  final String? urlImage;
  final String source;
  final String day;

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: '$urlImage',
          fit: BoxFit.cover,
          placeholder: (context, url) =>Image.asset('assets/images/no_found.jpg'),
          errorWidget: (context, url,error) =>Image.asset('assets/images/no_found.jpg'),
        ),
      ),
       Row(
        children: [
          Text(day),
          Text('Published By $source'),
        ],
      ),
    ],
  );
  }
  
}