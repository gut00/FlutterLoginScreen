// ignore_for_file: file_names
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myapp/src/auth/PasswordScreen.dart';
import 'package:myapp/src/auth/components/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:myapp/src/auth/newUserScreen.dart';

final _text = TextEditingController();

// ignore: camel_case_types
class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
// Logo e estilização
                const Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 40),
                    children: [
                      TextSpan(
                        text: 'Dale',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 41, 65),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Carnegie',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
//Texto inferior do logo - LabelFade
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 21),
                    child: AnimatedTextKit(
                      pause: Duration.zero,
                      repeatForever: true,
                      animatedTexts: [
                        FadeAnimatedText('Sua empressa'),
                        FadeAnimatedText('na palma'),
                        FadeAnimatedText('da sua mão!'),
                        FadeAnimatedText(' '),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
//formulario inferior(branco)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,

//arredondamento superior do box inferior da tela de login
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
//alinhamento dos campos (botões aqui)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
//email
                CustomTextFild(
                  icon: Icons.email,
                  label: 'E-mail',
                  controler: _text,
                ),
//senha
                CustomTextFild(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                  controler: _text,
                ),
//botão entrar
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            18), //arredondamento do botão entrar
                      ),
                    ),
                    onPressed: () {
                      // PopUp
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('UHUL!'),
                          content: const Text('Login efetuado com sucesso!'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ok'))
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
//Botão de texto 'esqueceu a senha' e alinhamento para a direita
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                          color: Colors.blue), //botão esqueceu a senha
                    ),
                  ),
                ),
//linha 'ou'
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Colors.blue,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.blue,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
//Botão novo cadastro
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        side: const BorderSide(width: 1, color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewUser(),
                        ),
                      );
                    },
                    child: const Text(
                      'Novo cadastro',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
