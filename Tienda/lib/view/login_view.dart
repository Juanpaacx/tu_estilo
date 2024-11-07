import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel loginController = Get.put(LoginViewModel());

  // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController, // Usar controlador de texto
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: passwordController, // Usar controlador de texto
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            Obx(() => loginController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      // Pasar los valores de los controladores directamente al método login
                      loginController.login(emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Text('Iniciar Sesión'),
                  )),
            Obx(() => Text(
                  loginController.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
