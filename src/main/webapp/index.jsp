<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%
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
        header { background: linear-gradient(135deg, #0275d8, #014c8c); color: white; padding: 30px 40px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .contenedor { max-width: 1200px; margin: 30px auto; padding: 0 20px; }
        .toolbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; flex-wrap: wrap; gap: 15px; }
        .filter-group { display: flex; gap: 10px; }
        .filter-group a { text-decoration: none; padding: 10px 20px; background-color: white; color: #555; border-radius: 25px; font-size: 14px; font-weight: 500; border: 1px solid #ddd; transition: all 0.3s ease; }
        .filter-group a:hover, .filter-group a.active { background-color: #0275d8; color: white; border-color: #0275d8; }
        .tabla-productos { width: 100%; border-collapse: collapse; background-color: white; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .tabla-productos th { background-color: #0275d8; color: white; text-align: left; padding: 15px 20px; }
        .tabla-productos td { padding: 18px 20px; border-bottom: 1px solid #eee; }
        .img-producto { width: 65px; height: 65px; object-fit: cover; border-radius: 8px; }
        .btn-comprar { text-decoration: none; background-color: #25d366; color: white; padding: 10px 18px; border-radius: 6px; font-size: 14px; font-weight: 600; }
        footer { background: #014c8c; color: white; padding: 40px; margin-top: 50px; text-align: center; }
    </style>
</head>
<body>

    <header>
        <div style="display: flex; align-items: center; gap: 20px;">
            <img src="https://i.postimg.cc/Lsk5TcNv/logo.jpg" alt="Logo" style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid rgba(255,255,255,0.3);">
            <div>
                <h1 style="margin: 0; font-size: 28px;">🌊 Acqua di Mare</h1>
                <p style="margin: 0; opacity: 0.9;">Equipamientos, Motores y Productos para tu Piscina o Jacuzzi</p>
            </div>
        </div>
    </header>

    <div class="contenedor">
        <div class="toolbar">
            <div class="filter-group">
                <a href="ProductoControlador?accion=listar" class="${param.categoria == null ? 'active' : ''}">Todos</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Motores" class="${param.categoria == 'Motores' ? 'active' : ''}">Motores</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Filtros" class="${param.categoria == 'Filtros' ? 'active' : ''}">Filtros</a>
               <a href="ProductoControlador?accion=filtrar&categoria=Iluminacion" class="${param.categoria == 'Iluminacion' ? 'active' : ''}">Iluminación</a>
                <a href="ProductoControlador?accion=filtrar&categoria=Quimicos">Químicos</a>
            </div>
        </div>

        <table class="tabla-productos">
            <thead>
                <tr>
                    <th>Imagen</th><th>Producto</th><th>Categoría</th><th>Disponibilidad</th><th>Precio</th><th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${productos}">
                    <tr>
                        <td><img src="${p.imagenUrl}" class="img-producto"></td>
                        <td><strong>${p.nombre}</strong><br><small>${p.descripcion}</small></td>
                        <td>${p.categoria}</td>
                        <td>✓ Disponible</td>
                        <td><fmt:formatNumber value="${p.precio}" type="currency" currencySymbol="Gs. " maxFractionDigits="0"/></td>
                        <td style="text-align: center;">
                            <a href="https://wa.me/595982962711?text=Interesado%20en:%20${p.nombre}" target="_blank" class="btn-comprar">Solicitar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <footer>
        <h3>Acqua di Mare - Piscinas Hidro Láser</h3>
        <p><strong>Misión:</strong> Brindar soluciones integrales de calidad técnica y diseño para el bienestar en tu hogar.</p>
        <p><strong>Visión:</strong> Ser referentes en innovación y servicio en el Departamento Central y Cordillera.</p>
        <hr style="opacity: 0.2; margin: 20px 0;">
        <p>📍 Luque, Central, Paraguay | 🚚 Cobertura en Central y Cordillera</p>
        <p>📞 WhatsApp: +595 982 962 711</p>
    </footer>

</body>
</html>
