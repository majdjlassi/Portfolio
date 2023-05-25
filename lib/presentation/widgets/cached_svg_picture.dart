import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedSvgPicture extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CachedSvgPicture({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  //TODO: handle the place holder and error widget
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Icon(Icons.error);
        } else if (snapshot.hasData) {
          final svgFile = snapshot.data!;
          return SvgPicture.file(
            svgFile,
            fit: BoxFit.contain,
            width: width,
            height: height,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
