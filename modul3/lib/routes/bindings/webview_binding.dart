import 'package:get/get.dart';

import '../../controllers/webview_controller.dart';

class WebViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(() => WebviewController());
  }
}
