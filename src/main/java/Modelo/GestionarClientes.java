package Modelo;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class GestionarClientes {

    // Leer clientes desde el archivo de texto
    public List<Cliente> leerClientesDesdeTexto(File fileTexto) throws IOException {
        List<Cliente> clientes = new ArrayList<>();
        if (!fileTexto.exists()) {
            return clientes; // Devuelve una lista vacía si el archivo no existe
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(fileTexto))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 7) {
                    Cliente cliente = new Cliente();
                    cliente.setIdUsuario(parts[0]);
                    cliente.setNombre(parts[1]);
                    cliente.setDireccion(parts[2]);
                    cliente.setTelefono(parts[3]);
                    cliente.setSaldo(Double.parseDouble(parts[4]));
                    cliente.setMembresia(parts[5]);
                    cliente.setPassword(parts[6]);
                    clientes.add(cliente);
                }
            }
        }
        return clientes;
    }

    // Guardar clientes en el archivo de texto
    public void guardarClientesEnTexto(File fileTexto, List<Cliente> clientes) throws IOException {
        try (FileWriter writer = new FileWriter(fileTexto, false)) {
            for (Cliente cliente : clientes) {
                writer.write(formatearClienteParaTexto(cliente) + "\n");
            }
        }
    }

    // Leer clientes desde el archivo serializado
    public List<Cliente> leerClientesSerializado(File fileData) throws IOException, ClassNotFoundException {
        if (!fileData.exists()) {
            return new ArrayList<>(); // Devuelve una lista vacía si el archivo no existe
        }
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(fileData))) {
            return (List<Cliente>) ois.readObject();
        }
    }

    // Guardar clientes en el archivo serializado
    public void guardarClientesSerializado(File fileData, List<Cliente> clientes) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(fileData))) {
            oos.writeObject(clientes);
        }
    }

    // Agregar un cliente y actualizar ambos archivos
    public void agregarCliente(File fileTexto, File fileData, Cliente nuevoCliente) throws IOException, ClassNotFoundException {
        List<Cliente> clientes = leerClientesDesdeTexto(fileTexto); // Leer clientes del archivo de texto
        clientes.add(nuevoCliente); // Agregar nuevo cliente
        guardarClientesEnTexto(fileTexto, clientes); // Guardar en archivo de texto
        guardarClientesSerializado(fileData, clientes); // Actualizar archivo serializado
    }

    // Verificar si el ID ya está en uso
    public boolean isIdUsuarioTaken(File fileTexto, String idUsuario) throws IOException {
        List<Cliente> clientes = leerClientesDesdeTexto(fileTexto);
        return clientes.stream().anyMatch(cliente -> cliente.getIdUsuario().equals(idUsuario));
    }

    // Crear un archivo de recorrido doble
    public void realizarRecorridoDoble(File archivoTexto, File archivoDoble) throws IOException {
        // Leer clientes desde el archivo de texto
        List<Cliente> clientes = leerClientesDesdeTexto(archivoTexto);

        try (FileWriter writer = new FileWriter(archivoDoble)) {
            // Escribir el recorrido hacia adelante
            writer.write("Recorrido hacia adelante:\n");
            for (Cliente cliente : clientes) {
                writer.write(formatearClienteParaTexto(cliente) + "\n");
            }

            // Escribir el recorrido hacia atrás
            writer.write("\nRecorrido hacia atrás:\n");
            for (int i = clientes.size() - 1; i >= 0; i--) {
                writer.write(formatearClienteParaTexto(clientes.get(i)) + "\n");
            }
        }
    }

    // Formatear cliente como línea de texto
    private String formatearClienteParaTexto(Cliente cliente) {
        return cliente.getIdUsuario() + ","
                + cliente.getNombre() + ","
                + cliente.getDireccion() + ","
                + cliente.getTelefono() + ","
                + cliente.getSaldo() + ","
                + cliente.getMembresia() + ","
                + cliente.getPassword();
    }
}
