import 'package:measu_mate/core/utils/resource_resolver.dart';

class AppImageResourceResolver {
  static PNGImageResourceResolver get constructionSitePNG =>
      const PNGImageResourceResolver('assets/images/construction_site.png');

  static PNGImageResourceResolver get engineerPNG =>
      const PNGImageResourceResolver('assets/images/engineer.png');
}
