// ignore_for_file: file_names
import 'package:flutter/material.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastro de usuário",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
