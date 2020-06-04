<%--
  Created by IntelliJ IDEA.
  User: 33747
  Date: 2019/7/26
  Time: 18:45
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.css">
</head>
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

    <title>缴费</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<%
    Object id=request.getAttribute("operatorID");
    Object name=request.getAttribute("operatorName");
%>
<article class="page-container">
    <form action="Charge" method="post" class="form form-horizontal" id="form-charge">
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">操作员ID：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" readonly="readonly" id="operatorID" name="operatorID" value=<%=id%>>
            </div>
            <label class="form-label col-xs-1 col-sm-1">操作员姓名：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" readonly="readonly" id="operatorName" name="operatorName" value=<%=name%>>
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">病历号：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="medno" name="medno" required="required">
            </div>
            <div class="formControls col-xs-2 col-sm-2">
                <input id="a" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;搜索&nbsp;&nbsp;">
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">患者信息：</label>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">身份证号：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="idno" name="idno">
            </div>
            <label class="form-label col-xs-1 col-sm-1">姓名：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
            </div>
            <label class="form-label col-xs-1 col-sm-1">家庭住址：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="address" name="address">
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">患者费用信息：</label>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">处方ID：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="prescriptionID" name="prescriptionID" required="required">
            </div>
            <label class="form-label col-xs-1 col-sm-1">处方名称：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="prescriptionName" name="prescriptionName" required="required">
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div>
            <table id="programs" data-toggle="table" data-toolbar="#toolbar">
                <thead>
                <tr>
                    <th data-field="pName">项目名称</th>
                    <th data-field="price">单价</th>
                    <th data-field="amount">数量</th>
                    <th data-field="oTime">开立时间</th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="row cl" id="toolbar">
            <div class="formControls col-xs-2 col-sm-2">
                <input id = "b" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;收费结算&nbsp;&nbsp;">
            </div>
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
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.3/dist/bootstrap-table.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#a").click(function () {
            $.ajax({
                type:"get",
                url:"LoadPatients",
                data:{medno:$("#medno").val()},
                dataType:'json',
                success:function(userList){
                    var pName=document.getElementById("name");
                    var idno=document.getElementById("idno");
                    var addr=document.getElementById("address");
                    if(userList!=null){
                        pName.value=userList[0].name;
                        idno.value=userList[0].idno;
                        addr.value=userList[0].address;
                    }
                },
                error:function(){
                    J.alert('Error');
                }
            });
            $.ajax({
                type:"get",
                url:"LoadPrograms",
                data:{medno:$("#medno").val()},
                dataType:'json',
                success:function(userList){
                    var rows=[];
                    for (var i = 0; i < userList.length; i++){
                        rows.push({
                            pName: userList[i]["name"],
                            price: userList[i]["unitprice"],
                            amount: userList[i]["quantity"],
                            oTime: userList[i]["time"]
                        })
                    }
                    $("#programs").bootstrapTable('load',rows)
                },
                error:function(){
                    J.alert('Error');
                }
            });
            $.ajax({
                type:"get",
                url:"LoadPrescription",
                data:{medno:$("#medno").val()},
                dataType:'json',
                success:function (userList) {
                    var prescriptionID=document.getElementById("prescriptionID");
                    var prescriptionName=document.getElementById("prescriptionName");
                    if(userList!=null){
                        prescriptionName.value=userList[0].name;
                        prescriptionID.value=userList[0].id;
                    }
                },
                error:function () {
                    J.alert('Error');
                }
            })
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
