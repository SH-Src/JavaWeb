<%--
  Created by IntelliJ IDEA.
  User: 33747
  Date: 2019/8/7
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>缴费成功</title>
    <link rel="stylesheet" href="static/h-ui/css/pintuer.css">
    <link rel="stylesheet" href="static/h-ui/css/admin.css">
    <script src="static/h-ui/js/jquery.js"></script>
</head>
<body>
<%
    Object invoicenumber=request.getAttribute("invoicenumber");
%>
<article class="page-container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="member-add.jsp" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>缴费完成</h1></div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field">
                                <label class="form-label col-xs-2 col-sm-2">发票号: </label>
                                <input type="text" class="input input-big" name="name" readonly="readonly" value=<%=invoicenumber%>>
                            </div>
                        </div>
                        <!--  <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                               <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">

                            </div>
                        </div>  -->
                    </div>

                    <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="退出"></div>
                </div>
            </form>
        </div>
    </div>
</article>

</body>
</html>
