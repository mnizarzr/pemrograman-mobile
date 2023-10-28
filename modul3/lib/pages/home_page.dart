import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/routes/routes.dart';

import '../controllers/home_controller.dart';
import '../data/models/todo.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Todo>(
          future: controller.futureTodos,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30,
                          width: double.infinity,
                          child: Text("User ID: ${snapshot.data!.userId}")),
                      const Divider(),
                      SizedBox(
                          width: double.infinity,
                          child: Text("ID: ${snapshot.data!.id}")),
                      const Divider(),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Title: ${snapshot.data!.title}")),
                      const Divider(),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Complete: ${snapshot.data!.completed}")),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.webview);
                        },
                        child: const Text("Go to webview page"),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
    );
  }
}
