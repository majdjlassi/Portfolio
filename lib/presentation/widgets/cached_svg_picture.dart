import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedSvgPicture extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Widget placeHolder;
  final Widget Function(dynamic) error;

  const CachedSvgPicture({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    required this.placeHolder,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return placeHolder;
        } else if (snapshot.hasError) {
          return error(snapshot.error);
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
