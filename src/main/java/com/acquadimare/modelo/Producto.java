package com.acquadimare.modelo;

public class Producto {
    // Atributos mapeados exactamente igual que las columnas de la tabla en PostgreSQL
    private int idProducto;
    private String nombre;
    private String categoria;
    private double precio;
    private int stock;
    private String descripcion;
    private String imagenUrl;

    // Constructor vacío (esencial para que Java pueda instanciarlo sin datos previos)
    public Producto() {
    }

    // Constructor lleno (para cuando queramos crear un producto con todos sus datos)
    public Producto(int idProducto, String nombre, String categoria, double precio, int stock, String descripcion, String imagenUrl) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.categoria = categoria;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.imagenUrl = imagenUrl;
    }

    // Métodos Getter y Setter (Los profesores los revisan sí o sí)
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagenUrl() {
        return imagenUrl;
    }

    public void setImagenUrl(String imagenUrl) {
        this.imagenUrl = imagenUrl;
    }
}