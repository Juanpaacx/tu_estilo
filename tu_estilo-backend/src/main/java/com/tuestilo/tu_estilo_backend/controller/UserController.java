package com.tuestilo.tu_estilo_backend.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.URegist;
import com.tuestilo.tu_estilo_backend.service.UsuarioService;

/* 
@RestController
@RequestMapping("/api/users") // Ruta base
public class UserController {

    // Endpoint para registrar usuarios
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@Valid @RequestBody User LoginRequestt userRequest) {
        // Aquí procesas la lógica para registrar al usuario en la base de datos.
        // Ejemplo: validación y guardado.
        System.out.println("Datos recibidos: " + userRequest);

        // Simula el registro exitoso
        return ResponseEntity.status(201).body("Usuario registrado exitosamente");
    }
}
*/

/* 
@RestController
@RequestMapping("api/users") // Ruta base
public class UserController {

    @Autowired
    private UsuarioService usuarioService; // Inyecta el servicio para manejar la lógica de usuarios

    // Endpoint para registrar usuarios
    @PostMapping("/register")
   /* public ResponseEntity<String> registerUser(@Valid @RequestBody URegistUser*userRequest) {
        try {
            // Intentar guardar el usuario usando el servicio
            usuarioService.saveUser(userRequest);

            // Si el registro es exitoso, devuelve código 201 Created
            return ResponseEntity.status(201).body("Usuario registrado exitosamente");
        } catch (Exception e) {
            // Si ocurre un error, como un correo ya registrado, devuelve código 400 Bad Request
            return ResponseEntity.status(400).body("Error al registrar usuario: " + e.getMessage());
        }
    }
}*/

/**
 * Controlador REST para gestionar las operaciones CRUD de usuarios
 */
@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UsuarioService usuarioService;

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public List<URegist> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<URegist> getUsuarioById(@PathVariable Long id) {
        Optional<URegist> usuario = usuarioService.getUsuarioById(id);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping  // Elimina "/api/users" de la ruta aquí
    public ResponseEntity<?> createUsuario(@RequestBody @Valid URegist userRegist, BindingResult result) {
        // Verificar si hay errores de validación
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body("Datos inválidos");
        }

        try {
            // Intentar guardar el usuario
            usuarioService.saveUser(userRegist);
            return ResponseEntity.status(HttpStatus.CREATED).body("Usuario creado con éxito");
        } catch (Exception e) {
            // Si ocurre una excepción, como correo ya registrado
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        }
    }

    // Endpoint para eliminar un usuario por su ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id) {
        usuarioService.deleteUsuario(id);
        return ResponseEntity.noContent().build();
    }
}
