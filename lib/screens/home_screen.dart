import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Zona Privada",
        ),

        centerTitle: true,

        actions: [

          IconButton(

            onPressed: () {

              Navigator.pushReplacement(

                context,

                MaterialPageRoute(
                  builder: (_) =>
                      LoginScreen(),
                ),
              );
            },

            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.verified_user,
                size: 120,
                color: Colors.green,
              ),

              const SizedBox(height: 30),

              const Text(

                "Acceso Concedido",

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(

                "El usuario fue autenticado correctamente mediante biometría.",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(

                onPressed: () {

                  Navigator.pushReplacement(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          LoginScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.logout,
                ),

                label: const Text(
                  "Cerrar Sesión",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}