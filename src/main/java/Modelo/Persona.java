package Modelo;

/**
 * Clase que representa a una persona.
 */
public class Persona {
    
    private String nombre;
    private String idUsuario;  // Añadir idUsuario si es único
    private String direccion;
    private String password;
    private String telefono;

    public Persona() {
    }

    public Persona(String nombre, String idUsuario, String direccion, String password, String telefono) {
        this.nombre = nombre;
        this.idUsuario = idUsuario;  // Cambiar el tipo de 'int' a 'String' para idUsuario
        this.direccion = direccion;
        this.password = password;
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
