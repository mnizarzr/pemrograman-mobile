import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile5/controllers/client_controller.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();

    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "YOUR_DATABASE_ID",
        documentId: ID.unique(),
        collectionId: "YOUR_COLLECTION_ID",
        data: map,
        permissions: [
          Permission.read(Role.user("USERID")),
          Permission.update(Role.user("USERID")),
          Permission.delete(Role.user("USERID")),
        ],
      );
      print("DatabaseController:: storeUserName $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
