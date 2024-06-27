import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWeather extends StatelessWidget {
  ImageWeather({super.key, required this.urlImage, required this.moreBig});

  final String urlImage;
  final bool moreBig;

  @override
  Widget build(BuildContext context) {
    if (urlImage == '') {
      return CachedNetworkImage(
          imageUrl: 'assets/images/no_found.jpg', fit: BoxFit.cover);
    } else {
      String url = moreBig? urlImage.replaceFirst('/64x64/','/128x128/'):urlImage;
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Image.asset('assets/images/no_found.jpg'),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/no_found.jpg'),
      );
    }
  }
}
