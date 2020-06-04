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
public class PrescriptionServlet extends HttpServlet{
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
            request.setCharacterEncoding("utf-8");
            CallableStatement cs4=conn.prepareCall("call `4`(?,?,?,?)");
            int id4=Integer.parseInt(request.getParameter("registerID"));
            String prescriptionname=request.getParameter("prescription");
            String medicines="";
            String[] medArray=request.getParameterValues("medicine");
            String[] amountArray=request.getParameterValues("amount");
            medicines=medicines+medArray[0]+"-"+amountArray[0];
            for(int i=1;i<medArray.length;i++){
                medicines=medicines+","+medArray[i]+"-"+amountArray[i];
            }
            System.out.println(medicines);
            cs4.setInt(1, id4);
            cs4.setString(2, prescriptionname);
            cs4.setString(3, medicines);
            cs4.registerOutParameter(4, Types.NUMERIC);
            cs4.execute();
            int ifsuccess4=cs4.getInt(4);
            if(ifsuccess4==1) {
                String registerID=request.getParameter("registerID");
                request.setAttribute("registerID",registerID);
                System.out.println("操作成功！");
                request.getRequestDispatcher("finish.jsp").forward(request,response);
            }else {
                request.setAttribute("message","操作失败！");
                String doctorID=request.getParameter("doctorID");
                String doctorName=request.getParameter("doctorName");
                String registerID=request.getParameter("registerID");
                request.setAttribute("registerID",registerID);
                request.setAttribute("doctorID",doctorID);
                request.setAttribute("doctorName",doctorName);
                request.getRequestDispatcher("prescription.jsp").forward(request,response);
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
