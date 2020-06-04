<%--
  Created by IntelliJ IDEA.
  User: 33747
  Date: 2019/7/24
  Time: 14:12
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
    <script type="text/javascript"
            src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>现场挂号</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<%
    Object msg = request.getAttribute("message");
    if(msg!=null)
        out.println(msg);
%>
<article class="page-container">
    <form action="MemberAdd" method="post" class="form form-horizontal" id="form-member-add">
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>发票号（不用填）：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="invoiceno" name="invoiceno">
            </div>
            <div class="formControls col-xs-2 col-sm-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;挂号&nbsp;&nbsp;">
            </div>
            <div class="formControls col-xs-2 col-sm-2">
                <input class="btn btn-primary radius" type="reset" value="&nbsp;&nbsp;清空&nbsp;&nbsp;">
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1">挂号信息</label>
            <label class="form-label col-xs-11 col-sm-11"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>病历号（不用填）：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="medno" name="medno">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>姓名：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" name="sex">
					<option value="nan">男</option>
					<option value="nv">女</option>
				</select></span>
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>年龄：</label>
            <div class="formControls col-xs-1 col-sm-1">
                <input type="text" class="input-text" value="" placeholder="" id="age" name="age">
            </div>
            <div class="formControls col-xs-1 col-sm-1">
				<span class="select-box"><select class="select" name="agetype">
					<option value="sui">岁</option>
					<option value="yue">月</option>
					<option value="ri">日</option>
				</select></span>
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>出生日期：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="date" value="" placeholder="" id="birthdate" name="birthdate">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>身份证号：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="idno" name="idno">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>家庭住址：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="text" class="input-text" value="" placeholder="" id="address" name="address">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>结算类别：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" name="settletype">
					<option value="1">自费</option>
					<option value="2">市医保</option>
				</select></span>
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>看诊日期：</label>
            <div class="formControls col-xs-2 col-sm-2">
                <input type="date" value="" placeholder="" id="visitingdate" name="visitingdate">
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>午别：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" name="wubie">
					<option value="shangwu">上午</option>
					<option value="xiawu">下午</option>
				</select></span>
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>挂号科室：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" id="department" name="department" onchange="getDoctor(this.value)">
					<option>选择科室</option>
				</select></span>
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>号别：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" name="level">
					<option value="1">专家号</option>
					<option value="2">普通号</option>
				</select></span>
            </div>
            <label class="form-label col-xs-5 col-sm-5"></label>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>是否要病历本：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" name="whetherwantmed">
					<option value="1">是</option>
					<option value="2">否</option>
				</select></span>
            </div>
            <label class="form-label col-xs-1 col-sm-1"><span class="c-red">*</span>看诊医生：</label>
            <div class="formControls col-xs-2 col-sm-2">
				<span class="select-box"><select class="select" id= "doctor" name="doctor">
					<option>选择医生</option>
				</select></span>
            </div>
        </div>
        <label class="form-label col-xs-5 col-sm-5"></label>
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
<script type="text/javascript">
$(document).ready(function () {
$.ajax({
type:"get",
url:"LoadDept",//访问后台去数据库查询select的选项
success:function(userList){
var unitObj=document.getElementById("department"); //页面上的<html:select>元素
    if(userList!=null){ //后台传回来的select选项
    for(var i=0;i<userList.length;i++){
    //遍历后台传回的结果，一项项往select中添加option
    unitObj.options.add(new Option(userList[i].name,userList[i].name));
    }
    }
    },
    error:function(){
    J.alert('Error');
    }
    })

    });
    function getDoctor(a) {
    var dept={value:a}
    $.ajax({
    type:"get",
    url:"LoadDoctor",//访问后台去数据库查询select的选项
    data:dept,
    dataType:'json',
    success:function(userList){
    var unitObj=document.getElementById("doctor"); //页面上的<html:select>元素
        unitObj.options.length=1;
        if(userList!=null){ //后台传回来的select选项
        for(var i=0;i<userList.length;i++){
        //遍历后台传回的结果，一项项往select中添加option
        unitObj.options.add(new Option(userList[i].name));
        }
        }
        },
        error:function(){
        J.alert('Error');
        }
        })

        }
        $(function(){
        $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
        });

        $("#form-member-add").validate({
        rules:{
        name:{
        required:true,
        minlength:2,
        maxlength:16
        },
        sex:{
        required:true
        },
        age:{
        required:true,
        number:true
        },
        birthdate:{
        required:true,
        date:true
        },
        idno:{
        required:true,
        },
        address:{
        required:true,
        },
        visitingdate:{
        required:true,
        date:true
        }

        },
        message:{
        name:{
        required:"姓名不能为空",
        minlength:"最小长度为2",
        maxlength:"最大长度为16"
        },
        sex:{
        required:"性别不能为空"
        },
        age:{
        required:"年龄不能为空",
        number:"必须为数字"
        },
        birthdate:{
        required:"生日不能为空",
        },
        idno:{
        required:"身份证号不能为空",
        },
        address:{
        required:"地址不能为空",
        },
        visitingdate:{
        required:"看诊日期不能为空",
        date:true
        }
        }
        /* onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
        //$(form).ajaxSubmit();
        var index = parent.layer.getFrameIndex(window.name);
        //parent.$('.btn-refresh').click();
        parent.layer.close(index);
        } */
        });
        });
        </script>
        <!--/请在上方写此页面业务相关的脚本-->
        </body>
        </html>
