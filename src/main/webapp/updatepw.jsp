<%@ page import="org.apache.shiro.subject.Subject" %><%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/15
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Subject subject = (Subject) session.getAttribute("subject");
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改密码</title>
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
  <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
  <jsp:include page="common/header.jsp"/>
  <jsp:include page="common/aside.jsp" />

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        修改密码
      </h1>
      <ol class="breadcrumb">
        <li><a href="main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">修改密码</li>
      </ol>
    </section>

    <section class="content">
      <div align="center">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">修改密码</h3>
          </div>

          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-4 control-label ">登录账号/Login
                Account：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
              <div class="col-sm-5">
<%--                下面填ID--%>
                <input type="text" class="form-control" id="uId" name="uId" readonly="readonly"
                       value="<%=subject.getPrincipal().toString()%>">
              </div>
            </div>
            <br>
            <br>
            <div class="form-group">
              <label class="col-sm-4 control-label ">原始密码/Original Password：</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="oldPassword" name="oldPassword"
                       placeholder="请输入您的原始密码才能进行修改操作">
                <span id="currentMsg"></span>
              </div>
            </div>

            <br>
            <br>

            <div class="form-group">
              <label class="col-sm-4 control-label">新的密码/New
                Password：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="newPassword" name="newPassword"
                       placeholder="密码必须为4~20位，可由数字和字母或符号混合组成。">
                <span id="newMsg"></span>
              </div>
            </div>
            <br>
            <br>

            <div class="form-group">
              <label class="col-sm-4 control-label">确认密码/Confirm Password：</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="repeatPassword"
                       name="repeatPassword"
                       placeholder="请再输入一遍新的密码。">
                <span id="confirmMsg"></span>
              </div>
            </div>

          </div>
          <div class="box-footer">
            <button type="button" class="btn btn-default" onclick="clearInput()">重置/Reset</button>
            <button type="button" id="submit" class="btn btn-danger">保存/Submit</button>
          </div>
        </div>

      </div>

    </section>
  </div>
</div>
</body>
<script src="plugins/jQuery/jquery-3.6.1.min.js"></script>
<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>
<script src="plugins/select2/select2.full.min.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="plugins/adminLTE/js/app.min.js"></script>
<script>

  $("#submit").click(function () {
    var data = {};
    var uId = $("#uId").val().toString();
    var oldPassword = $("#oldPassword").val().toString();
    var newPassword = $("#newPassword").val().toString();
    var repeatPassword = $("#repeatPassword").val().toString();

    if (oldPassword == "")
      alert("请输入原始密码");
    else if (newPassword == "")
      alert("请输入新的密码");
    else if (repeatPassword == "")
      alert("请输入确认密码");
    else if (oldPassword.length < 4 || oldPassword.length > 20 || newPassword.length < 4 || newPassword.length > 20)
      alert("密码长度必须为4~20位！");
    else if (newPassword != repeatPassword)
      alert("新密码和确认密码不一致");
    else if (newPassword == repeatPassword) {
      $.ajax({
        type: "POST",   //提交的方法
        url: "updatePW", //提交的地址
        async: false,
        data: {
            uid: $("#uId").val(),
            oldPassword: $("#oldPassword").val(),
            newPassword: $("#newPassword").val()
        },
        dataType: 'json',
        success: function (msg) {  //成功
          if (msg==-1)
            alert("原始密码错误，修改失败!");
          else {
            alert("修改成功,请重新登录!");
            location.href = 'login.jsp';
          }
        }
      });
    } else
      alert("未知的错误");
  });


  function clearInput() {
    $("#oldPassword").val("");
    $("#newPassword").val("");
    $("#repeatPassword").val("");
    clearErrorMsg();
    document.getElementById("submit").setAttribute("disabled", "disabled");
  }

  $(document).ready(function () {
    // 选择框
    $(".select2").select2();

    // WYSIHTML5编辑器
    $(".textarea").wysihtml5({
      locale: 'zh-CN'
    });
  });

  // 设置激活菜单
  function setSidebarActive(tagUri) {
    var liObj = $("#" + tagUri);
    if (liObj.length > 0) {
      liObj.parent().parent().addClass("active");
      liObj.addClass("active");
    }
  }

  $(document).ready(function () {

    // 激活导航位置
    setSidebarActive("user-updatepw");


    // 全选操作
    $("#selall").click(function () {
      var clicks = $(this).is(':checked');
      if (!clicks) {
        $("#dataList td input[type='checkbox']").iCheck("uncheck");
      } else {
        $("#dataList td input[type='checkbox']").iCheck("check");
      }
      $(this).data("clicks", !clicks);
    });
  });

</script>
</html>

