<%--
  Created by IntelliJ IDEA.
  User: 33747
  Date: 2019/7/25
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="bootstrap-table-develop/dist/bootstrap-table.min.css">
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

    <title>开药</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    Object registerID=request.getAttribute("registerID");
    Object doctorID=request.getAttribute("doctorID");
    Object doctorName=request.getAttribute("doctorName");
    Object msg=request.getAttribute("message");
    if(msg!=null){
        out.println(msg);
    }
%>
<article class="page-container">
    <form action="PrescriptionServlet" method="post" class="form form-horizontal" id="form-member-add">
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">医生ID</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" readonly="readonly" name="doctorID" value=<%=doctorID%> >
            </div>
            <label class="form-label col-xs-1 col-sm-1">医生姓名</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" readonly="readonly" name="doctorName" value=<%=doctorName%> >
            </div>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>处方名称：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="prescription" name="prescription" required="required">
            </div>
            <div>
                <button id="button1" type="button" class="btn btn-secondary" onclick="addMed()">添加药品</button>
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <%--<div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>药品名称：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="medicine" name="medicine">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>数量：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="amount" name="amount">
            </div>
        </div>--%>
        <div>
            <table data-toggle="table">
                <thead>
                <tr>
                    <th data-field="name">药品名称</th>
                    <th data-field="quantity">数量</th>
                    <th data-field="operation">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <tr>
                    <td><input type="text" class="input-text" value="" placeholder="" id="medicine" name="medicine" required="required"></td>
                    <td><input type="number" class="input-text" value="" placeholder="" id="amount" name="amount" required="required"></td>
                    <td><button id="button2" type="button" class="btn btn-secondary" onclick="delMed(this)">删除</button></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">挂号ID：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" readonly="readonly" id="registerID" name="registerID" value=<%=registerID%>>
            </div>
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
<script>

function addMed(){
    var trObj = document.createElement("tr");
    trObj.innerHTML = "<td><input type=\"text\" class=\"input-text\" value=\"\" placeholder=\"\" id=\"medicine\" name=\"medicine\" required=\"required\"></td>" +
        "<td><input type=\"number\" class=\"input-text\" value=\"\" placeholder=\"\" id=\"amount\" name=\"amount\" required=\"required\"></td>" +
        "<td><button id=\"button2\" class=\"btn btn-secondary\" onclick=\"delMed(this)\">删除</button></td>";
    document.getElementById("tb").appendChild(trObj);
}
function delMed(obj) {
    var trObj = obj.parentNode.parentNode;
    document.getElementById("tb").removeChild(trObj);
}
</script>
<!--/请在上方写此页面业务相关的脚本-->

</body>
</html>
