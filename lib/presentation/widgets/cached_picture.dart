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
          final file = snapshot.data!;
          return Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              border: border,
              image: DecorationImage(
                image: FileImage(file),
                fit: fit,
              ),
            ),
            child: Image.file(file),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
