import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();
    const endPoint = "https://appwrite.mnizarzr.dev/v1";
    const projectID = "65645063320d837afe95";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
