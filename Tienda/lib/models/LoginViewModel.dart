/*import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      // Aquí llamarías a tu backend para login normal
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        Get.snackbar('Éxito', 'Inicio de sesión exitoso');
      } else {
        errorMessage.value = 'Error al iniciar sesión';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final idToken = googleAuth.idToken;

        // Enviar el token al backend
        final response = await http.post(
          Uri.parse('http://localhost:8080/api/google-login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'idToken': idToken}),
        );

        if (response.statusCode == 200) {
          Get.snackbar('Éxito', 'Inicio de sesión con Google exitoso');
        } else {
          errorMessage.value = 'Error al iniciar sesión con Google';
        }
      } else {
        errorMessage.value = 'Inicio de sesión con Google cancelado';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
*/
import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginViewModel extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Método para inicio de sesión con email y contraseña
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    bool success = await authService.login(email, password);
    isLoading.value = false;

    if (!success) {
      errorMessage.value = 'Credenciales incorrectas. Intenta de nuevo.';
    } else {
      Get.snackbar('Éxito', 'Inicio de sesión exitoso');
      errorMessage.value = '';
    }
  }

  // Método para inicio de sesión con Google
  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    String message = await authService.signInWithGoogle();
    isLoading.value = false;

    if (message.contains('exitoso')) {
      Get.snackbar('Resultado', message);
    } else {
      errorMessage.value = message;
    }
  }
}
