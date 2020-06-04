package webhisServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
public class Charge extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/his?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    static final String USER = "root";
    static final String PASS = "hero1235";
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());

        Connection conn = null;
        Statement stmt = null;
        try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            CallableStatement cs5=conn.prepareCall("call `5`(?,?,?,?)");
            request.setCharacterEncoding("UTF-8");
            int prescriptionid=Integer.parseInt(request.getParameter("prescriptionID"));
            int operatorid=Integer.parseInt(request.getParameter("operatorID"));
            cs5.setInt(1, prescriptionid);
            cs5.setInt(2, operatorid);
            cs5.registerOutParameter(3, Types.NUMERIC);
            cs5.registerOutParameter(4, Types.NUMERIC);
            cs5.execute();
            int ifsuccess5=cs5.getInt(3);
            int invoicenumber=cs5.getInt(4);
            if(ifsuccess5==1) {
                request.setAttribute("invoicenumber",invoicenumber);
                request.getRequestDispatcher("charge-finish.jsp").forward(request,response);
                System.out.println("缴费成功！");
            }else {
                String id=request.getParameter("operatorID");
                String name=request.getParameter("operatorName");
                request.setAttribute("operatorID",id);
                request.setAttribute("operatorName",name);
                request.getRequestDispatcher("charge.jsp").forward(request,response);
                System.out.println("缴费失败！");
            }
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
        // TODO Auto-generated method stub

    }
}
