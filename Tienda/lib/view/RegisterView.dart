import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class RegisterView extends StatelessWidget {
  final AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RegisterView({super.key});
  /*final TextEditingController addressIdController = TextEditingController();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Apellidos'),
              ),
              TextField(
                controller: emailController,
                decoration:
                    const InputDecoration(labelText: 'Correo Electrónico'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
              ),
              /* TextField(
                controller: addressIdController,
                decoration: const InputDecoration(labelText: 'ID de Dirección'),
                keyboardType: TextInputType.number,
              ),*/
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final firstName = firstNameController.text.trim();
                  final lastName = lastNameController.text.trim();
                  final phone = phoneController.text.trim();
                  /*final addressId =
                      int.tryParse(addressIdController.text.trim()) ?? 0;*/

                  if (email.isEmpty ||
                          password.isEmpty ||
                          firstName.isEmpty ||
                          lastName.isEmpty ||
                          phone
                              .isEmpty /*||
                      addressId == 0*/
                      ) {
                    Get.snackbar('Error',
                        'Por favor completa todos los campos correctamente');
                    return;
                  }

                  bool success = await authService.register(
                    email: email,
                    password: password,
                    firstName: firstName,
                    lastName: lastName,
                    phone: phone,
                    /*addressId: addressId,*/
                  );

                  if (success) {
                    Get.snackbar('Éxito', 'Usuario registrado correctamente');
                    Get.back(); // Regresar a la pantalla de login
                  } else {
                    Get.snackbar('Error', 'Error al registrar el usuario');
                  }
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
