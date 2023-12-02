import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile5/controllers/client_controller.dart';

class AccountController extends ClientController {
  final txtEmail = TextEditingController().obs;
  final txtPwd = TextEditingController().obs;

  final user = Rxn<User>();

  late Account account;
  @override
  void onInit() {
    super.onInit();

    account = Account(client);
  }

  Future createAccount() async {
    try {
      final result = await account.create(
        userId: ID.unique(),
        email: txtEmail.value.text,
        password: txtPwd.value.text,
      );
      user.value = result;
      print("AccountController:: createAccount $user");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
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

  Future createEmailSession() async {
    try {
      final result = account.createEmailSession(
        email: txtEmail.value.text,
        password: txtPwd.value.text,
      );
      user.value = (await account.get());
      update();
      print("AccountController:: createEmailSession $user");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
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
