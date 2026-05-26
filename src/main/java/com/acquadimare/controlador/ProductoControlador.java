package com.acquadimare.controlador;

import com.acquadimare.modelo.Producto;
import com.acquadimare.dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Configuración crítica de codificación para las URLs
        request.setCharacterEncoding("UTF-8");
        
        String accion = request.getParameter("accion");
        ProductoDAO dao = new ProductoDAO();
        
        if (accion == null || accion.equals("listar")) {
            List<Producto> lista = dao.listar();
            request.setAttribute("productos", lista);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } else if (accion.equals("filtrar")) {
            String categoriaParam = request.getParameter("categoria");
            List<Producto> listaFiltrada = dao.filtrarPorCategoria(categoriaParam);
            
            request.setAttribute("productos", listaFiltrada);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador de Catálogo Comercial para Acqua di Mare";
    }
}