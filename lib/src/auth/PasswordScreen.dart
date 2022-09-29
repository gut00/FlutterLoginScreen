// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Redefinir senha",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
