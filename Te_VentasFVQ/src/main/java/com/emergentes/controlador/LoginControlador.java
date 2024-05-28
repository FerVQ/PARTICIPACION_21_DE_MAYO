package com.emergentes.controlador;

import com.emergentes.utiles.ConexionDB;
//import com.emergentes.utiles.Validate;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (request.getParameter("action") == null) ? "view" : request.getParameter("action");
        if(action.equals("Logout")){
            HttpSession ses = request.getSession();
            ses.invalidate();
        }
        
        response.sendRedirect("login.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");
            String sql = "select * from usuarios where correo = ? and password = md5(?)";
            ResultSet rs;
            ConexionDB canal = new ConexionDB();
            Connection cn = canal.conectar();
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            if(rs.next()){
                // crear unas variables de sesion
                HttpSession ses = request.getSession();
                System.out.println("Todo Ok");
                ses.setAttribute("login", "OK");
                ses.setAttribute("usuario", rs.getString("nombres")+" "+rs.getString("apellidos"));
                response.sendRedirect("ClienteControlador");
            }else{
                System.out.println("Incorrecto");
                response.sendRedirect("login.jsp");
            }
            /*Validate v = new Validate();
            System.out.println("Datos.." +correo +" "+password);
            verificar los datos
            if(v.checkUser(correo, password)){
                System.out.println("Todo Ok");
                HttpSession ses =request.getSession();
                ses.setAttribute("login", "OK");
                response.sendRedirect("ClienteControlador");
            }*/
        } catch (SQLException ex) {
            System.out.println("Error al conectar a la base de datos"+ex.getMessage());
        }
        
    }

}
