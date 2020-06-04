package webhisServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
public class LoadPatients extends HttpServlet{
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/his?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    static final String USER = "root";
    static final String PASS = "hero1235";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();

            request.setCharacterEncoding("utf-8");
            String medno=request.getParameter("medno");
            System.out.println(medno);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter out = response.getWriter();
            ResultSet rs = stmt.executeQuery("select `name`, idno, address from registerrecord where medrecordno='"+medno+"'");
            JSONArray jArray = new JSONArray();
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("name",rs.getString("name"));
                jo.put("idno",rs.getString("idno"));
                jo.put("address",rs.getString("address"));
                jArray.put(jo);
            }
            out.println(jArray);
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
