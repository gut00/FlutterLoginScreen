// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: size.height / 5 * 4,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: size.height / 5,
            width: size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 2, 89, 160),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    'Grupo FBA',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        'Atendimento',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Fone: 16 99349-0798',
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'E-mail: grupofba@email.com',
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Atendimento: Segunda a Sexta: 08:00 - 12:00 / 13:00 - 18:00',
                  style: TextStyle(fontSize: 9, color: Colors.white),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text(
                        'Sobre nós',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Rua: São paulo, 350 - Bairro: Castelo',
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
