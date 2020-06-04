package webhisServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class DiagnosisServlet extends HttpServlet {
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
            CallableStatement cs3=conn.prepareCall("call `3`(?,?,?,?,?,?,?,?,?,?)");
            request.setCharacterEncoding("utf-8");
            System.out.println(request.getParameter("check"));
            int registerid1=Integer.parseInt(request.getParameter("check"));
            String str=request.getParameter("zhusu");
            String str1=request.getParameter("xianbingshi");
            String str2=request.getParameter("xianbingzhiliaoqingkuang");
            String str3=request.getParameter("jiwangshi");
            String str4=request.getParameter("guominshi");
            String str5=request.getParameter("tigejiancha");
            String str6=request.getParameter("jianchajianyi");
            String str7=request.getParameter("zhuyishixiang");
            cs3.setInt(1, registerid1);
            cs3.setString(2, str);
            cs3.setString(3, str1);
            cs3.setString(4, str2);
            cs3.setString(5, str3);
            cs3.setString(6, str4);
            cs3.setString(7, str5);
            cs3.setString(8, str6);
            cs3.setString(9, str7);
            cs3.registerOutParameter(10, Types.NUMERIC);
            cs3.execute();
            int ifsuccess3=cs3.getInt(10);
            if(ifsuccess3==1) {
                int doctorID=Integer.parseInt(request.getParameter("doctorID"));
                String doctorName=request.getParameter("doctorName");
                request.setAttribute("registerID",registerid1);
                request.setAttribute("doctorID",doctorID);
                request.setAttribute("doctorName",doctorName);
                request.getRequestDispatcher("/prescription.jsp").forward(request, response);
                System.out.println("操作成功！");
            }else {
                System.out.println("操作失败！");
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
    }
}
