package com.tuestilo.tu_estilo_backend.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class URegist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email", nullable = false, unique = true)
    @NotNull(message = "El correo electrónico no puede ser nulo")
    @Email(message = "El correo electrónico no es válido")
    private String email;

    @Column(name = "first_name", nullable = false, length = 50)
    @NotNull(message = "El nombre no puede ser nulo")
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 50)
    @NotNull(message = "El apellido no puede ser nulo")
    private String lastName;

    @Column(name = "password", nullable = false, length = 100)
    @NotNull(message = "La contraseña no puede ser nula")
    private String password;

    @Column(name = "phone", nullable = false, length = 15)
    @NotNull(message = "El teléfono no puede ser nulo")
    private String phone;

    // Getters y Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
