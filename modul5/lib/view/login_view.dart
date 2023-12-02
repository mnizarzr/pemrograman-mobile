import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile5/controllers/account_controller.dart';

class LoginView extends StatelessWidget {
  final controller = Get.put(AccountController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.txtEmail.value,
              decoration: InputDecoration(
                  prefixIcon: Container(
                    alignment: Alignment.centerLeft,
                    width: 30,
                    child: const Icon(Icons.email),
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                  )),
            ),
            TextField(
              controller: controller.txtPwd.value,
              // obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Container(
                    alignment: Alignment.centerLeft,
                    width: 30,
                    child: const Icon(Icons.key),
                  ),
                  hintText: "Password",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                controller.createEmailSession();
              },
              child: const Text("Login"),
            ),
            GetBuilder<AccountController>(
              builder: (ctrl) =>
                  Text("Logged in as ${controller.user.value?.email}"),
            ),
          ],
        ),
      ),
    );
  }
}
