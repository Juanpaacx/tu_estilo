/*package com.tuestilo.tu_estilo_backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    // Método para autenticar un usuario con email y contraseña
    public boolean authenticate(String email, String password) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        // Verifica si el usuario existe y si la contraseña coincide
        return user.isPresent() && user.get().getPassword().equals(password);
    }
}
*/
/*
package com.tuestilo.tu_estilo_backend.service;

import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.HashMap;

@Service
public class UsuarioService {

    private HashMap<String, String> users = new HashMap<>();

    public String handleGoogleLogin(String email) {
        if (users.containsKey(email)) {
            return "Usuario encontrado. Sesión iniciada para " + email;
        } else {
            users.put(email, "defaultPassword");
            return "Nuevo usuario registrado y sesión iniciada para " + email;
        }
    }
}
*/
/* 
package com.tuestilo.tu_estilo_backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    // Método para autenticar un usuario con email y contraseña
    public boolean authenticate(String email, String password) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        // Verifica si el usuario existe y si la contraseña coincide
        return user.isPresent() && user.get().getPassword().equals(password);
    }

    // Método para manejar el login con Google (nuevo)
    public String handleGoogleLogin(String email) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        if (user.isPresent()) {
            return "Usuario encontrado. Sesión iniciada para " + email;
        } else {
            // Si el usuario no existe, puedes registrar uno nuevo (esto puede ser diferente según tu lógica)
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setPassword("defaultPassword"); // Aquí puedes gestionar cómo crear un nuevo usuario
            usuarioRepository.save(newUser);
            return "Nuevo usuario registrado y sesión iniciada para " + email;
        }
    }
}
*/
/* ya sirve pero no hace nada
package com.tuestilo.tu_estilo_backend.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    // Método para autenticar un usuario con email y contraseña
    public boolean authenticate(String email, String password) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        // Verifica si el usuario existe y si la contraseña coincide
        return user.isPresent() && user.get().getPassword().equals(password);
    }

    // Método para manejar el login con Google
    public String handleGoogleLogin(String email) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        if (user.isPresent()) {
            return "Usuario encontrado. Sesión iniciada para " + email;
        } else {
            // Si el usuario no existe, puedes registrar uno nuevo (esto puede ser diferente según tu lógica)
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setPassword("defaultPassword"); // Aquí puedes gestionar cómo crear un nuevo usuario
            usuarioRepository.save(newUser);
            return "Nuevo usuario registrado y sesión iniciada para " + email;
        }
    }

    // Método para generar un JWT (token) cuando el login es exitoso
    private String generateJwt(String email) {
        // Usamos la clave secreta de forma más segura (puedes cambiar "secret_key" por algo más seguro)
        Algorithm algorithm = Algorithm.HMAC256("secret_key");
        return JWT.create()
                .withSubject(email)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + 86400000))  // 24 horas de expiración
                .sign(algorithm);
    }

    // Método para manejar el login con email y contraseña
    public String login(String email, String password) {
        Optional<User> user = usuarioRepository.findByEmail(email);

        if (user.isPresent() && user.get().getPassword().equals(password)) {
            // Generar un JWT para el usuario
            return generateJwt(email);
        } else {
            return "Credenciales inválidas";
        }
    }
}
*/
/* */

package com.tuestilo.tu_estilo_backend.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.tuestilo.tu_estilo_backend.model.URegist;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para obtener todos los usuarios
    public List<URegist> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<URegist> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public URegist saveUser(URegist user) throws Exception {
        // Verificar si el correo electrónico ya está registrado
        Optional<URegist> existingUser = usuarioRepository.findByEmail(user.getEmail());
        if (existingUser.isPresent()) {
            throw new Exception("El correo electrónico ya está registrado");
        }
        // Si no está registrado, guardar el nuevo usuario
        return usuarioRepository.save(user);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    // Método para autenticar un usuario con email y contraseña
    public boolean authenticate(String email, String password) {
        Optional<URegist> user = usuarioRepository.findByEmail(email);
        return user.isPresent() && user.get().getPassword().equals(password);
    }

    // Método para generar un JWT (token) cuando el login es exitoso
    private String generateJwt(String email) {
        Algorithm algorithm = Algorithm.HMAC256("secret_key");
        return JWT.create()
                .withSubject(email)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(System.currentTimeMillis() + 86400000))  // 24 horas de expiración
                .sign(algorithm);
    }

    // Método para manejar el login con email y contraseña
    public String login(String email, String password) {
        Optional<URegist> user = usuarioRepository.findByEmail(email);
        if (user.isPresent() && user.get().getPassword().equals(password)) {
            return generateJwt(email);
        } else {
            return "Credenciales inválidas";
        }
    }
}
