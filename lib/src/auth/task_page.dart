// ignore_for_file: list_remove_unrelated_type, unused_import, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/auth/components/item.dart';
import 'package:myapp/src/auth/controllers/task_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool check = false;
  final TaskController _ = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: _.listingItems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            var item = _.listingItems[index];
            return CheckboxListTile(
                activeColor: const Color.fromARGB(255, 20, 81, 131),
                title: Text(item.title),
                value: item.check,
                onChanged: (bool? value) {
                  setState(() {
                    item.check = value!;
                  });
                });
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  content: TextFormField(
                    controller: _.descripitionTaksText.value,
                  ),
                  title: const Text('Nova tarefa'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (_.descripitionTaksText.value.text.isNotEmpty) {
                          _.listingItems.value.add(
                            Items(
                                title: _.descripitionTaksText.value.text,
                                check: false),
                          );
                          _.descripitionTaksText.value.text = '';
                          Navigator.of(context).pop();
                          setState(() {});
                          return;
                        } else {
                          Get.snackbar('Alerta', 'Descrição não informada!');
                          return;
                        }
                      },
                      child: const Text('adicionar'),
                    ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
