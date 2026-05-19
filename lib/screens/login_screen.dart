import 'package:flutter/material.dart';

import '../services/biometric_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  final BiometricService biometricService =
      BiometricService();

  Future<void> authenticate(
      BuildContext context) async {

    bool available =
        await biometricService.canUseBiometrics();

    // Si el dispositivo no tiene biometría
    if (!available) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text(
            "El dispositivo no soporta biometría",
          ),
        ),
      );

      return;
    }

    // Ejecuta autenticación
    final authenticated =
        await biometricService.authenticate();

    // Si autentica correctamente
    if (authenticated) {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(
          content: Text(
            "Autenticación fallida",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(25),

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.lock,
                size: 120,
                color: Colors.blue,
              ),

              const SizedBox(height: 30),

              const Text(

                "Aplicación Biométrica Segura",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(

                "Hecho por: Kelma Leva Ayte",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(

                onPressed: () {
                  authenticate(context);
                },

                icon: const Icon(
                  Icons.fingerprint,
                ),

                label: const Text(
                  "Autenticarse",
                ),

                style:
                    ElevatedButton.styleFrom(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}