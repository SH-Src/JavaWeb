package webhisServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class MemberAdd
 */
public class MemberAdd extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/his?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
    static final String USER = "root";
    static final String PASS = "hero1235";

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());

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

            CallableStatement cs=conn.prepareCall("call `1`(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            request.setCharacterEncoding("UTF-8");
            String idno=request.getParameter("idno");
            String name1=request.getParameter("name");
            //String sex1=request.getParameter("sex");
            String sex2=request.getParameter("sex");
            String sex1 = "男";
            if(sex2.equals("nan")) {
                sex1="男";
            }else if(sex2.equals("nv")) {
                sex1="女";
            }
            Date birthdate=Date.valueOf(request.getParameter("birthdate"));
            int age=Integer.parseInt(request.getParameter("age"));
            //String agetype=request.getParameter("agetype");
            String agetype1=request.getParameter("agetype");
            String agetype="岁";
            if(agetype1.equals("sui")) {
                agetype="岁";
            }else if(agetype1.equals("yue")) {
                agetype="月";
            }else if(agetype1.equals("ri")) {
                agetype="日";
            }
            String address=request.getParameter("address");
            Date visitingdate=Date.valueOf(request.getParameter("visitingdate"));
            //String wubie=request.getParameter("wubie");
            String wubie1=request.getParameter("wubie");
            String wubie="上";
            if(wubie1.equals("shangwu")) {
                wubie="上";
            }else if(wubie1.equals("xiawu")) {
                wubie="下";
            }
            //int deptID=Integer.parseInt(request.getParameter("department"));
            //int doctorID=Integer.parseInt(request.getParameter("doctor"));
            String dept=request.getParameter("department");
            String doctor=request.getParameter("doctor");
            ResultSet rs = stmt.executeQuery("select id from department where `name`='"+dept+"'");
            int deptID=0;
            while(rs.next()){
                deptID=rs.getInt("id");
            }
            ResultSet rs1 = stmt.executeQuery("select id from `user` where realname='"+doctor+"'");
            int doctorID=0;
            while(rs1.next()){
                doctorID=rs1.getInt("id");
            }
            int levelID=Integer.parseInt(request.getParameter("level"));
            int settletype=Integer.parseInt(request.getParameter("settletype"));
            int whetherwantmed=Integer.parseInt(request.getParameter("whetherwantmed"));
            int registerstuffID=9;//超级管理员
            cs.setString(1, idno);
            cs.setString(2, name1);
            cs.setString(3, sex1);
            cs.setDate(4, birthdate);
            cs.setInt(5, age);
            cs.setString(6, agetype);
            cs.setString(7, address);
            cs.setDate(8, visitingdate);
            cs.setString(9, wubie);
            cs.setInt(10, deptID);
            cs.setInt(11, doctorID);
            cs.setInt(12, levelID);
            cs.setInt(13, settletype);
            cs.setInt(14, whetherwantmed);
            cs.setInt(15, registerstuffID);
            int ifsuccess = 0;
            cs.registerOutParameter(16, Types.NUMERIC);
            cs.execute();
            ifsuccess=cs.getInt(16);
            if(ifsuccess==1) {
                request.setAttribute("message","挂号成功！");
                request.getRequestDispatcher("/member-add.jsp").forward(request, response);
            }else {
                System.out.println("操作失败！");
            }
            // 完成后关闭
            rs.close();
            rs1.close();
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
