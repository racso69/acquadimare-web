<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%
    // TRUCO DE BIENVENIDA: Si entran a la raíz sin parámetros, redirige al controlador automáticamente.
    if (request.getAttribute("productos") == null) {
        response.sendRedirect("ProductoControlador?accion=listar");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Acqua di Mare | Tienda de Piscinas</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f7f6; color: #333; }
        
        /* Encabezado Principal estilo Tienda Comercial */
        header { background: linear-gradient(135deg, #0275d8, #014c8c); color: white; padding: 30px 40px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        header h1 { margin: 0; font-size: 28px; font-weight: 600; }
        header p { margin: 5px 0 0 0; opacity: 0.9; font-size: 14px; }
        
        .contenedor { max-width: 1200px; margin: 30px auto; padding: 0 20px; }
        
        /* Barra de Filtros en Botones redondeados */
        .toolbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; flex-wrap: wrap; gap: 15px; }
        .filter-group { display: flex; gap: 10px; }
        .filter-group a { text-decoration: none; padding: 10px 20px; background-color: white; color: #555; border-radius: 25px; font-size: 14px; font-weight: 500; border: 1px solid #ddd; transition: all 0.3s ease; }
        .filter-group a:hover, .filter-group a.active { background-color: #0275d8; color: white; border-color: #0275d8; box-shadow: 0 3px 6px rgba(2, 117, 216, 0.3); }
        
        /* Tabla Comercial E-commerce */
        .tabla-productos { width: 100%; border-collapse: collapse; background-color: white; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .tabla-productos th { background-color: #0275d8; color: white; text-align: left; padding: 15px 20px; font-size: 15px; font-weight: 500; }
        .tabla-productos td { padding: 18px 20px; border-bottom: 1px solid #eee; vertical-align: middle; font-size: 15px; }
        .tabla-productos tr:last-child td { border-bottom: none; }
        .tabla-productos tr:hover { background-color: #f9fbfd; }
        
        /* Elementos de catálogo */
        .img-producto { width: 65px; height: 65px; object-fit: cover; border-radius: 8px; border: 1px solid #ddd; background-color: #fff; }
        .nombre-prod { font-weight: 600; color: #222; }
        .categoria-badge { display: inline-block; padding: 4px 12px; background-color: #e3f2fd; color: #0d47a1; border-radius: 15px; font-size: 12px; font-weight: 500; }
        .precio-prod { font-weight: 700; color: #0275d8; font-size: 16px; }
        .stock-disponible { color: #2e7d32; font-weight: 500; font-size: 14px; }
        
        /* Botón de Pedido Directo (Estilo WhatsApp Oficial) */
        .btn-comprar { text-decoration: none; background-color: #25d366; color: white; padding: 10px 18px; border-radius: 6px; font-size: 14px; font-weight: 600; display: inline-flex; align-items: center; gap: 5px; transition: background 0.2s ease; }
        .btn-comprar:hover { background-color: #128c7e; box-shadow: 0 3px 6px rgba(18, 140, 126, 0.3); }
    </style>
</head>
<body>

  <header style="display: flex; align-items: center; gap: 20px;">
    <img src="img/logo.jpg" alt="Logo Acqua di Mare" style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid rgba(255,255,255,0.3);">
    
    <div>
        <h1 style="margin: 0; font-size: 28px;">🌊 Acqua di Mare</h1>
        <p style="margin: 0; opacity: 0.9; font-size: 14px;">Equipamientos, Motores y Productos para tu Piscina o Jacuzzi</p>
    </div>
</header>

    <div class="contenedor">
        
        <div class="toolbar">
            <div class="filter-group">
                <a href="ProductoControlador?accion=listar" class="${param.categoria == null ? 'active' : ''}">Todos los Productos</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Motores" class="${param.categoria == 'Motores' ? 'active' : ''}">Motores</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Filtros" class="${param.categoria == 'Filtros' ? 'active' : ''}">Filtros</a>
                
                <a href="ProductoControlador?accion=filtrar&categoria=Iluminaci%C3%B3n" class="${param.categoria == 'Iluminación' ? 'active' : ''}">Iluminación</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Qu%C3%ADmicos" class="${param.categoria == 'Químicos' ? 'active' : ''}">Químicos</a>
            </div>
        </div>

        <table class="tabla-productos">
            <thead>
                <tr>
                    <th style="width: 10%;">Imagen</th>
                    <th style="width: 35%;">Producto</th>
                    <th style="width: 15%;">Categoría</th>
                    <th style="width: 15%;">Disponibilidad</th>
                    <th style="width: 15%;">Precio</th>
                    <th style="width: 10%; text-align: center;">Acción</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${productos}">
                    <tr>
                        <td>
                            <img src="${p.imagenUrl}" alt="${p.nombre}" class="img-producto">
                        </td>
                        <td>
                            <div class="nombre-prod">${p.nombre}</div>
                            <small style="color: #666; font-size: 13px;">${p.descripcion}</small>
                        </td>
                        <td>
                            <span class="categoria-badge">${p.categoria}</span>
                        </td>
                        <td>
                            <span class="stock-disponible">✓ Disponible</span>
                        </td>
                        <td>
                            <div class="precio-prod">
                                <fmt:formatNumber value="${p.precio}" type="currency" currencySymbol="Gs. " maxFractionDigits="0"/>
                            </div>
                        </td>
                        <td style="text-align: center;">
                            <a href="https://wa.me/595982962711?text=Hola%20Acqua%20di%20Mare,%20estoy%20interesado%20en%20el%20producto:%20<c:out value="${p.nombre}"/>%20(Categor%C3%ADa:%20<c:out value="${p.categoria}"/>)" 
                               target="_blank" class="btn-comprar">
                                Solicitar
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty productos}">
                    <tr>
                        <td colspan="6" style="text-align: center; color: #888; padding: 40px;">
                            No encontramos productos en esta categoría en este momento.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

</body>
</html>
