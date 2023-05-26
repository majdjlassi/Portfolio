import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedPicture extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxFit fit;
  final Color? backgroundColor;
  final Widget placeHolder;
  final Widget Function(dynamic) error;

  const CachedPicture({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.margin,
    this.borderRadius,
    this.border,
    this.backgroundColor,
    required this.placeHolder,
    required this.error,
  }) : super(key: key);

  //TODO: handle the place holder and error widget
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(imageUrl),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: placeHolder,
          );
        } else if (snapshot.hasError) {
          return Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: border,
            ),
            child: error(snapshot.error),
          );
        } else if (snapshot.hasData) {
          final file = snapshot.data!;
          return Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                image: FileImage(file),
                fit: fit,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
