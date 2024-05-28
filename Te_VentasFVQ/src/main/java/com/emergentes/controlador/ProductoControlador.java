package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Producto prod = new Producto();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    request.setAttribute("producto", prod);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    prod = dao.getByid(id);
                    request.setAttribute("producto", prod);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    //Obtener la lista de registros u objetos
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }
        }catch(Exception ex){
            System.out.println("Error "+ ex.getMessage());
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id =Integer.parseInt(request.getParameter("id"));
       String nombre = request.getParameter("nombre");
       String descripcion = request.getParameter("descripcion");
       float precio = Float.parseFloat(request.getParameter("precio"));
       
       Producto prod = new Producto();
       
       prod.setId(id);
       prod.setNombre(nombre);
       prod.setDescripcion(descripcion);
       prod.setPrecio(precio);
       
       ProductoDAO dao = new ProductoDAOimpl();
       if(id == 0){
           try {
               //Nuevo registro
               dao.insert(prod);
           } catch (Exception ex) {
               System.out.println("Error al insertar"+ ex.getMessage());
           }
           
       }
       else{
           try {
               //Edicion de registro
               dao.update(prod);
           } catch (Exception ex) {
               System.out.println("Error al editar"+ ex.getMessage());
           }   
        }
       response.sendRedirect("ProductoControlador");
    }
}
