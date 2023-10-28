import 'package:get/get.dart';

import '../pages/home_page.dart';
import '../pages/webview_page.dart';
import 'bindings/bindings.dart';

class Routes {
  static const home = "/";
  static const webview = '/webview';

  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.webview,
      page: () => const WebViewPage(),
      binding: WebViewBinding(),
    )
  ];
}
