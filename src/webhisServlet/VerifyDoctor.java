package webhisServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;

public class VerifyDoctor extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/his?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    static final String USER = "root";
    static final String PASS = "hero1235";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Connection conn = null;
        Statement stmt = null;
        try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 打开链接
            System.out.println("connecting...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行查询
            System.out.println("creatStatement...");
            stmt = conn.createStatement();

            String username=request.getParameter("name");
            String pwd=request.getParameter("pwd");
            ResultSet rs = stmt.executeQuery("SELECT id, realname, password FROM user where user.username='"+username+"'");
            if(rs.next() && rs.getString("password").equals(pwd)) {
                request.setAttribute("DoctorID",rs.getInt("id"));
                request.setAttribute("DoctorName",rs.getString("realname"));
                request.getRequestDispatcher("/diagnosis.jsp").forward(request, response);
            }else {
                request.setAttribute("message","登录失败！");
                request.getRequestDispatcher("/doctor-login.jsp").forward(request, response);
            }

            rs.close();
            stmt.close();
            conn.close();
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
    }
}
