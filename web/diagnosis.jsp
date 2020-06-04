<%--
  Created by IntelliJ IDEA.
  User: 33747
  Date: 2019/7/24
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="record"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/his?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true"
                   user="root"
                   password="hero1235" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="style sheet" href="bootstrap-table-develop/dist/bootstrap-table.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->
    <title>现场挂号</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>

<article class="page-container">
    <%
        Object id = request.getAttribute("DoctorID");
        Object name = request.getAttribute("DoctorName");
        /*if(id!=null){
            out.println("医生ID："+id+" ");
            if(name!=null){
                out.println("医生姓名："+name+"<br/>");
                out.println("待诊患者：");
            }
        }*/
    %>
    <c:set var="doctorId" value="<%=id.toString()%>"/>
    <sql:query dataSource="${record}" var="result">
        SELECT id,medrecordno,name from registerrecord where state=1 and doctorID=?;
        <sql:param value="${doctorId}" />
    </sql:query>

    <form action="DiagnosisServlet" method="post" class="form form-horizontal" id="form-diagnosis" name="form-diagnosis">
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">医生ID</label>
            <div class="formControls col-xs-2 col-sm-2">
              <input type="text" class="input-text" readonly="readonly" value=<%=id%> name="doctorID">
            </div>
            <label class="form-label col-xs-1 col-sm-1">医生姓名</label>
            <div class="formControls col-xs-2 col-sm-2">
              <input type="text" class="input-text" readonly="readonly" value=<%=name%> name="doctorName">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
            <table id="table-page" data-toggle="table" data-search="true" data-show-columns="true" data-pagination="true" data-page-size="2">
                <thead>
                <tr>
                    <th data-field="id">ID</th>
                    <th data-field="medno">病历号</th>
                    <th data-field="name">姓名</th>
                    <th data-field="choice">选择患者</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}" /></td>
                        <td><c:out value="${row.medrecordno}" /></td>
                        <td><c:out value="${row.name}" /></td>
                        <td>
                            <input type="radio" name="check" value="${row.id}">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">主诉</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="zhusu" name="zhusu" style="height:51px;width:600px" >
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">现病史</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="xianbingshi" name="xianbingshi" style="height:51px;width:600px" >
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">现病治疗情况</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="xianbingzhiliaoqingkuang" name="xianbingzhiliaoqingkuang" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">既往史</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="jiwangshi" name="jiwangshi" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">过敏史</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="guominshi" name="guominshi" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">体格检查</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="tigejiancha" name="tigejiancha" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">检查建议</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="jianchajianyi" name="jianchajianyi" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">注意事项</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="zhuyishixiang" name="zhuyishixiang" style="height:51px;width:600px">
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-2 col-sm-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
            <div class="formControls col-xs-2 col-sm-2">
                <input class="btn btn-primary radius" type="reset" value="&nbsp;&nbsp;清空&nbsp;&nbsp;">
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="bootstrap-table-develop/dist/bootstrap-table.min.js"></script>
<script src="bootstrap-table-develop/dist/bootstrap-table-locale-all.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-diagnosis").validate({
            rules:{
                check:{
                  required:true
                },
                zhusu:{
                    required:true
                },
                xianbingshi:{
                    required:true
                },
                guominshi:{
                    required:true
                },
                jiwangshi:{
                    required:true
                },
                jianchajianyi:{
                    required:true
                },
                tigejiancha:{
                    required:true
                },
                zhuyishixiang:{
                    required:true
                },
                xianbingzhiliaoqingkuang:{
                    required:true
                }
            },
            message:{
                check:{
                    required:"必须选择！"
                },
                zhusu:{
                    required:"不能为空！"
                },
                xianbingshi:{
                    required:"不能为空！"
                },
                guominshi:{
                    required:"不能为空！"
                },
                jiwangshi:{
                    required:"不能为空！"
                },
                jianchajianyi:{
                    required:"不能为空！"
                },
                tigejiancha:{
                    required:"不能为空！"
                },
                zhuyishixiang:{
                    required:"不能为空！"
                },
                xianbingzhiliaoqingkuang:{
                    required:"不能为空！"
                }
            }
            /*onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                //$(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                //parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }*/
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
