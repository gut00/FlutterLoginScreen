// ignore_for_file: list_remove_unrelated_type

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/auth/components/item.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: duplicate_import
import 'components/item.dart';

class TaskPage extends StatefulWidget {
  var items = <Items>[];

  TaskPage({super.key}) {
    // items.add(Items(title: 'item 1', check: false));
    // items.add(Items(title: 'item 2', check: false));
    // items.add(Items(title: 'item 3', check: false));
    // items.add(Items(title: 'item 4', check: false));
  }

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var newTaksCtrl = TextEditingController();

  void add() {
    if (newTaksCtrl.text.isEmpty) return;

    setState(() {
      widget.items.add(
        Items(title: newTaksCtrl.text, check: false),
      );
      newTaksCtrl.text = '';
      save();
    });
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decored = jsonDecode(data);
      List<Items> result = decored.map((x) => Items.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  _TaskPageState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    //newTaksCtrl. controller
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaksCtrl,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          decoration: const InputDecoration(
            labelText: 'Nova tarefa',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return Dismissible(
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.6),
            ),
            onDismissed: (direction) {
              remove(index);
            },
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.check,
              onChanged: (value) {
                setState(
                  () {
                    item.check = value;
                    save();
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
