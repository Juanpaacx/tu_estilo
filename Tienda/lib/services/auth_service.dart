/*import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "http://10.10.9.53:8080/api/users"; // Cambia la URL según tu backend
// 172.27.160.1
  // 192.168.100.36
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl), // Endpoint de login
        headers: {"Content-Type": "application/json"},
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, retorna true
        return true;
      } else {
        // Si falla, retorna false
        return false;
      }
    } catch (e) {
      print('Mensaje de error ' + e.toString());
      return Future.value(false);
    }
  }

  Future<bool> register(String email, String password, String nombre) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'), // Endpoint de registro
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': email,
        'password': password,
        'nombre': nombre, // Añadido el campo nombre
      }),
    );

    if (response.statusCode == 201) {
      // Si el registro fue exitoso (201 Created), retorna true
      return true;
    } else {
      // Si falla, retorna false
      return false;
    }
  }

  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'), // Endpoint de logout
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al cerrar sesión');
    }
  }
}
*/
/* este codigo creo que si sirve pero  nunca lo probe 
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "http://192.168.1.109:8080/api/users"; // Cambia la URL según tu backend

  // Método para hacer login
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'), // Asegúrate que esta ruta sea correcta
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Login exitoso: ${data.toString()}');
        // Aquí puedes guardar un token o información adicional
        return true;
      } else if (response.statusCode == 401) {
        print('Credenciales incorrectas');
        return false;
      } else {
        print('Error de autenticación: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: ' + e.toString());
      return Future.value(false);
    }
  }

  // Método para registrar un nuevo usuario
  Future<bool> register(String email, String password, String nombre) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'), // Endpoint de registro
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {'email': email, 'password': password, 'nombre': nombre}),
      );

      if (response.statusCode == 201) {
        print('Registro exitoso');
        return true;
      } else {
        print('Error al registrar: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: ' + e.toString());
      return Future.value(false);
    }
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'), // Endpoint de logout
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        throw Exception('Error al cerrar sesión');
      } else {
        print('Cierre de sesión exitoso');
      }
    } catch (e) {
      print('Mensaje de error: ' + e.toString());
    }
  }
}
*/

/*
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "http://10.50.32.23:8080/api/users"; // Ajusta según tu backend
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // **Método para hacer login clásico**
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        print('Login exitoso: ${response.body}');
        return true;
      } else if (response.statusCode == 401) {
        print('Credenciales incorrectas');
        return false;
      } else {
        print('Error de autenticación: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: $e');
      return false;
    }
  }

  // **Método para registrar un nuevo usuario**
  Future<bool> register(String email, String password, String nombre) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {'email': email, 'password': password, 'nombre': nombre}),
      );

      if (response.statusCode == 201) {
        print('Registro exitoso');
        return true;
      } else {
        print('Error al registrar: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: $e');
      return false;
    }
  }

  // **Método para cerrar sesión**
  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        throw Exception('Error al cerrar sesión');
      } else {
        print('Cierre de sesión exitoso');
      }
    } catch (e) {
      print('Mensaje de error: $e');
    }
  }

  // **Método para iniciar sesión con Google**
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return 'Inicio de sesión cancelado';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        // Envía el ID Token al backend
        final response = await http.post(
          Uri.parse('http://192.168.100.34:8080/api/google-login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'idToken': idToken}),
        );

        if (response.statusCode == 200) {
          print('Inicio de sesión con Google exitoso: ${response.body}');
          return response.body; // Devuelve mensaje del backend
        } else {
          print('Error en el inicio de sesión con Google: ${response.body}');
          return 'Error en el inicio de sesión con Google';
        }
      } else {
        return 'No se pudo obtener el token de Google';
      }
    } catch (error) {
      print('Error al iniciar sesión con Google: $error');
      return 'Error al iniciar sesión con Google';
    }
  }
}

ya no marcaba errores pero tampoco funcionaba bien
*/
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "http://192.168.1.105:8080/api/users"; // Ruta base del backend
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // **Método para hacer login clásico**
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'), // Ruta para login clásico
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        print('Login exitoso: ${response.body}');
        return true;
      } else if (response.statusCode == 401) {
        print('Credenciales incorrectas');
        return false;
      } else {
        print('Error de autenticación: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: $e');
      return false;
    }
  }

  // **Método para registrar un usuario**
  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final payload = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    };

    print('Enviando datos al backend: $payload');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl'), // Aquí usas solo '/api/users'
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      print('Estado del backend: ${response.statusCode}');
      print('Respuesta del backend: ${response.body}');

      if (response.statusCode == 201) {
        print('Registro exitoso');
        return true;
      } else {
        print('Error al registrar: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Mensaje de error: $e');
      return false;
    }
  }

  // **Método para iniciar sesión con Google**
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return 'Inicio de sesión cancelado';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        // Envía el ID Token al backend
        final response = await http.post(
          Uri.parse('http://192.168.100.34:8080/api/google-login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'idToken': idToken}),
        );

        if (response.statusCode == 200) {
          print('Inicio de sesión con Google exitoso: ${response.body}');
          return response.body; // Devuelve mensaje del backend
        } else {
          print('Error en el inicio de sesión con Google: ${response.body}');
          return 'Error en el inicio de sesión con Google';
        }
      } else {
        return 'No se pudo obtener el token de Google';
      }
    } catch (error) {
      print('Error al iniciar sesión con Google: $error');
      return 'Error al iniciar sesión con Google';
    }
  }
}
