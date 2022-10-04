// ignore_for_file: file_names, camel_case_types
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:myapp/src/auth/controllers/login_controller.dart';
import 'package:myapp/src/auth/home_page.dart';
import 'package:myapp/src/auth/PasswordScreen.dart';
import 'package:myapp/src/auth/components/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:myapp/src/auth/newUserScreen.dart';

class loginPage extends StatefulWidget {
  const loginPage({
    super.key,
  });

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final LoginController _ = Get.put(LoginController());

  @override
  void initState() {
    _.userName.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
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
                            FadeAnimatedText('Sua empresa'),
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
                      textController: _.userName.value,
                      icon: Icons.email,
                      label: 'E-mail',
                      inputFormatters: const [],
                    ),

//senha
                    const CustomTextFild(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      inputFormatters: [],
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                nameUser: _.userName.value.text,
                              ),
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
//botão esqueceu a senha
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
                          style: TextStyle(color: Colors.blue),
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
                            side:
                                const BorderSide(width: 1, color: Colors.blue)),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) {
                                return NewUser();
                              },
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
        ),
      ),
    );
  }
}
