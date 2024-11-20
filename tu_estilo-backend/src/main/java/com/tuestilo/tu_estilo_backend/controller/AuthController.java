/*package com.tuestilo.tu_estilo_backend.controller;

import com.tuestilo.tu_estilo_backend.model.LoginRequest;
import com.tuestilo.tu_estilo_backend.model.User; // Asegúrate de que esto esté importado
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio; // Asegúrate de tener este repositorio
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio; // Corregido: no debe tener punto y coma

    @PostMapping("/login")
    public String login(@RequestBody LoginRequest loginRequest) {
        // Busca al usuario por email
        User user = usuarioRepositorio.findByEmail(loginRequest.getEmail()) // Cambiado a 'usuarioRepositorio'
                                  .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // Verifica la contraseña
        if (!user.getPassword().equals(loginRequest.getPassword())) {
            throw new RuntimeException("Contraseña incorrecta");
        }

        // Aquí iría la lógica para manejar el inicio de sesión (ej. generar un token JWT)
        return "Inicio de sesión exitoso";
    }
}
*/
// Ajusta la declaración del paquete al inicio del archivo
package com.tuestilo.tu_estilo_backend.controller;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.tuestilo.tu_estilo_backend.service.UsuarioService;

@RestController
@RequestMapping("/api")
public class AuthController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/google-login")
    public String googleLogin(@RequestBody Map<String, String> body) {
        String idTokenString = body.get("idToken");

        try {
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                    new NetHttpTransport(),
                   GsonFactory.getDefaultInstance()
)
                    .setAudience(Collections.singletonList("TU_CLIENT_ID_DE_GOOGLE"))
                    .build();

            GoogleIdToken idToken = verifier.verify(idTokenString);
            if (idToken != null) {
                GoogleIdToken.Payload payload = idToken.getPayload();
                String email = payload.getEmail();
                return usuarioService.handleGoogleLogin(email);
            } else {
                return "Token inválido";
            }
        } catch (IOException | GeneralSecurityException e) {
            return "Error al verificar el token: " + e.getMessage();
        }
    }
}
