import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class ResourceResolver {
  Widget getImageWidget({double? width, double? height, BoxFit? fit});

  String getPath();
}

class PNGImageResourceResolver implements ResourceResolver {
  final String path;

  const PNGImageResourceResolver(this.path);

  @override
  Widget getImageWidget({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  String getPath() => path;
}

class SVGImageResourceResolver implements ResourceResolver {
  final String path;

  const SVGImageResourceResolver(this.path);

  @override
  Widget getImageWidget({double? width, double? height, BoxFit? fit}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }

  @override
  String getPath() => path;
}
