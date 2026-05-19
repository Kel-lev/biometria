import 'package:local_auth/local_auth.dart';

class BiometricService {

  final LocalAuthentication auth =
      LocalAuthentication();

  // Verificar biometría
  Future<bool> canUseBiometrics() async {

    try {

      bool canCheck =
          await auth.canCheckBiometrics;

      bool isSupported =
          await auth.isDeviceSupported();

      return canCheck && isSupported;

    } catch (e) {

      print(e);

      return false;
    }
  }

  // Autenticación
  Future<bool> authenticate() async {

    try {

      return await auth.authenticate(

        localizedReason:
            'Escanea tu huella para ingresar',

        options: const AuthenticationOptions(

          stickyAuth: true,

          // Compatible con Samsung
          useErrorDialogs: true,
        ),
      );

    } catch (e) {

      print(e);

      return false;
    }
  }
}