package com.tuestilo.tu_estilo_backend.controller;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.LoginRequestt;

@RestController
@RequestMapping("/api/users") // Ruta base
public class UserController {

    // Endpoint para registrar usuarios
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@Valid @RequestBody /*UserRequestt*/ LoginRequestt userRequest) {
        // Aquí procesas la lógica para registrar al usuario en la base de datos.
        // Ejemplo: validación y guardado.
        System.out.println("Datos recibidos: " + userRequest);

        // Simula el registro exitoso
        return ResponseEntity.status(201).body("Usuario registrado exitosamente");
    }
}
