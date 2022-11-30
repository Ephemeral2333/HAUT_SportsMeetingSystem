<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/19
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.haut.entity.Student" %>
<jsp:useBean id="students" class="org.haut.entity.Student" scope="application"/>
<%
  students.findAll();
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>学生信息列表</title>
  <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
  <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
  <jsp:include page="../common/header.jsp"/>
  <jsp:include page="../common/aside.jsp" />

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        学生信息
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">院系人员</li>
        <li class="active">学生信息</li>
      </ol>
    </section>

    <section class="content">
      <div id="display" class="box box-primary" style="display: none">
        <div class="box-header with-border">
          <h3 class="box-title">学生信息列表</h3>
        </div>

        <div class="box-body">
          <div class="table-box">
            <div class="">
              <div class="form-group form-inline">
                <div class="btn-group">
                  <button type="button" class="btn btn-default" title="新建"
                          data-toggle="modal" data-target="#myModal" onclick="findAllRoles()">
                    <i class="fa fa-file-o"></i> 新建
                  </button>
                  <button type="button" class="btn btn-default" title="删除"
                          onclick="void(0);" id="delSelected">
                    <i class="fa fa-trash-o"></i> 删除
                  </button>
                  <button id="refresh1" type="button" class="btn btn-default" title="刷新">
                    <i class="fa fa-refresh"></i> 刷新
                  </button>
                </div>
              </div>
            </div>

            <form id="selection" action="" method="post">
              <table id="dataList1"
                     class="table table-bordered table-striped table-hover dataTable">
                <thead>
                <tr style="text-align: center">
                  <th>
                    <input id="selall" type="checkbox">
                  </th>
                  <th class="text-center">序号</th>
                  <th class="text-center">学号</th>
                  <th class="text-center">姓名</th>
                  <th class="text-center">性别</th>
                  <th class="text-center">班级</th>
                  <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${students.studentList}" var="student" varStatus="status">
                  <tr style="text-align: center">
                    <td><input name="sNo" value="${student.SNo}" type="checkbox"></td>
                    <td class="text-center">${status.index+1 }</td>
                    <td class="text-center">${student.SNo }</td>
                    <td class="text-center">${student.SName }</td>
                    <td class="text-center">${student.SGenderStr }</td>
                    <td class="text-center">${student.classes.CName }</td>
                    <td class="text-center">
                      <button type="button" class="btn bg-olive btn-xs "
                              onclick="location.href='${pageContext.request.contextPath}/Detail/StudentDetail.jsp?sId=${student.SId}'">
                        详情
                      </button>
                      <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                              data-target="#myModal"
                              onclick="getStudent(${student.SId},'${student.SNo}',${student.SClassid})">
                        修改
                      </button>
                      <button type="button" class="btn bg-red btn-xs "
                              onclick="deleteStudentById(${student.SNo})">删除
                      </button>
                    </td>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </form>

            <div class="pull-left">
              <div class="form-group form-inline">
                <div class="btn-group">
                  <button type="button" class="btn btn-default" title="新建"
                          data-toggle="modal" data-target="#myModal" onclick="findAllRoles()">
                    <i class="fa fa-file-o"></i> 新建
                  </button>
                  <button type="button" class="btn btn-default" title="删除"
                          onclick="void(0);" id="delSelected2">
                    <i class="fa fa-trash-o"></i> 删除
                  </button>
                  <button id="refresh2" type="button" class="btn btn-default" title="刷新">
                    <i class="fa fa-refresh"></i> 刷新
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <form id="myForm" method="post">
            <div class="modal-content" style="border-radius: 6px">
              <div class="modal-header">
                <h4 class="modal-title" id="title">新建</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <input type="hidden" name="formToken" value="">
                  <input type="hidden" name="SId" id="SId">
                  <input type="hidden" name="OSNo" id="OSNo">

                  <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                  <label for="SNo" class="col-sm-3 control-label">学号</label>
                  <div class="col-sm-9">
                    <input id="SNo" type="text" class="form-control rounded"
                           name="SNo" required="required" placeholder="学号"/>
                  </div>
                  <br>
                  <br>
                  <label for="SName" class="col-sm-3 control-label">姓名</label>
                  <div class="col-sm-9">
                    <input type="text" id="SName" class="form-control"
                           name="SName" required="required" placeholder="姓名"/>
                  </div>
                  <br>
                  <br>
                  <label for="SGender" class="col-sm-3 control-label">性别</label>
                  <div class="col-sm-9">
                    <select id="SGender" style="width: 100%;" name="SGender" class="form-control">
                      <option value="男">男</option>
                      <option value="女">女</option>
                    </select>
                  </div>
                  <br>
                  <br>
                  <label for="SClassid" class="col-sm-3 control-label">班级</label>
                  <div class="col-sm-9">
                    <select id="SClassid" style="width: 100%;" name="SClassid" class="form-control">
                    </select>
                  </div>
                  <br>
                  <br>
                  <label for="SPhone" class="col-sm-3 control-label">手机号码</label>
                  <div class="col-sm-9">
                    <input type="tel" id="SPhone" class="form-control"
                           name="SPhone" required="required" placeholder="手机号码"/>
                  </div>
                  <br>
                  <br>
                  <label for="SEmail" class="col-sm-3 control-label">邮箱</label>
                  <div class="col-sm-9">
                    <input type="email" id="SEmail" class="form-control"
                           name="SEmail" required="required" placeholder="邮箱"/>
                  </div>
                  <br>
                  <br>
                  <label for="SIdcard" class="col-sm-3 control-label">身份证号</label>
                  <div class="col-sm-9">
                    <input type="number" id="SIdcard" class="form-control"
                           name="SIdcard" required="required" placeholder="身份证号"/>
                  </div>
                  <br>
                  <br>
                  <label for="Password" class="col-sm-3 control-label">密码</label>
                  <div class="col-sm-9">
                    <input type="password" id="Password" class="form-control"
                           name="Password" required="required" placeholder="密码"/>
                  </div>
                  <br>
                  <br>
<%--                  <label for="RoleList" class="col-sm-3 control-label" id="rl">角色</label>--%>
<%--                  <div class="col-sm-9" id="rls">--%>
<%--                    <select id="RoleList" class="form-control" data-placeholder="角色"--%>
<%--                            style="width: 100%;" name="RoleList">--%>
<%--                      <option value="1">学生</option>--%>
<%--                      <option value="2">管理员</option>--%>
<%--                      <option value="3">裁判</option>--%>
<%--                      <option value="4">志愿者</option>--%>
<%--                      <option value="5">教师</option>--%>
<%--                    </select>--%>
<%--                  </div>--%>
<%--                  <br>--%>
<%--                  <br>--%>
                  <label for="Status" class="col-sm-3 control-label">用户状态</label>
                  <div class="col-sm-9">
                    <select id="Status" style="width: 100%;" name="Status" class="form-control">
                      <option value="1">开启</option>
                      <option value="0">禁用</option>
                    </select>
                  </div>
                  <br>
                  <br>
                </div>
              </div>

              <div class="modal-footer">
                <button id="Submitbtn" type="button" class="btn bg-maroon">保存</button>
                <button type="button" class="btn bg-blue" data-dismiss="modal">关闭</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
  </div>
</div>
</body>
<script src="../plugins/jQuery/jquery-3.6.1.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script>
  $('#myModal').on('hidden.bs.modal', function () {
    document.getElementById("myForm").reset();
    $("#btn").text('保存');
    $("#title").text('新增');
  });

  function exportToExcel() {
    location.href = "${pageContext.request.contextPath}/student/exportToExcel.do";
  }

  function findAllRoles() {
    var url2 = "${pageContext.request.contextPath}/classes/findAllClasses";
    $.get(url2, function (data) {
      var html = "";
      for (var i = 0; i < data.length; i++) {
        html += "<option value=\"" + data[i].cId + "\">" + data[i].cName + "</option>";
      }
      $("#SClassid").html(html);
    });
  }


  function getStudent(id, no, cid) {
    //请求项目列表
    var url = "${pageContext.request.contextPath}/role/findAll";
    $.get(url, function (data) {
      var html = "";

      for (var i = 0; i < data.length; i++) {
        if (data[i].rId == 1)
          html += "<option value=\"" + data[i].rId + "\" selected = 'selected'>" + data[i].rName + "</option>";
        else
          html += "<option value=\"" + data[i].rId + "\">" + data[i].rName + "</option>";
      }
      $("#RoleList").html(html);
    });

    //请求项目列表
    var url = "${pageContext.request.contextPath}/classes/findAllClasses";
    $.get(url, function (data) {
      var html = "";

      for (var i = 0; i < data.length; i++) {
        if (data[i].cId == cid)
          html += "<option value=\"" + data[i].cId + "\" selected = 'selected'>" + data[i].cName + "</option>";
        else
          html += "<option value=\"" + data[i].cId + "\">" + data[i].cName + "</option>";
      }
      $("#SClassid").html(html);
    });

    //请求角色列表
    var url = "${pageContext.request.contextPath}/student/findById?id=" + id;
    $.get(url, function (data) {
      document.getElementById("updateOrInsert").value = "update";
      document.getElementById("SId").value = data.sId;
      document.getElementById("OSNo").value = data.sNo;
      document.getElementById("SNo").value = data.sNo;
      document.getElementById("SName").value = data.sName;
      $("#SGender").val(data.sGender == false ? '0' : '1').trigger("change");
      document.getElementById("SPhone").value = data.sPhone;
      document.getElementById("SEmail").value = data.sEmail;
      document.getElementById("SIdcard").value = data.sIdcard;
      $("#Status").val(data.status == false ? '0' : '1').trigger("change");
      document.getElementById("RoleList").remove();
      document.getElementById("rl").remove();
      document.getElementById("rls").remove();
      $("#btn").text('修改');
      $("#title").text('修改');
    });
  }


  $("#Submitbtn").click(function () {
    var updateorinsert = document.getElementById("updateOrInsert").value.toString();
    if (updateorinsert == "update") {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/student/update", //提交的地址
        async: false,
        data: {
            "sId": $("#SId").val(),
            "sNo": $("#SNo").val(),
            "sName": $("#SName").val(),
            "sGender": $("#SGender").val(),
            "sPhone": $("#SPhone").val(),
            "sEmail": $("#SEmail").val(),
            "sIdcard": $("#SIdcard").val(),
            "status": $("#Status").val(),
            "sClassid": $("#SClassid").val(),
            "sPassword": $("#Password").val()
        },
        dataType: "json",
        error: function () {  //失败的话
          alert("修改失败!")
        },
        success: function (msg) {  //成功
          if (msg==-1)
            alert("修改失败!");
          else {
            alert("修改成功!");
          }
        }
      });
    } else {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/student/add", //提交的地址
        async: false,
        data: {
          "sNo": $("#SNo").val(),
          "sName": $("#SName").val(),
          "sGender": $("#SGender").val(),
          "sPhone": $("#SPhone").val(),
          "sEmail": $("#SEmail").val(),
          "sIdcard": $("#SIdcard").val(),
          "status": $("#Status").val(),
          "sClassid": $("#SClassid").val(),
          "sPassword": $("#Password").val()
        },
        dataType: "json",
        error: function () {  //失败的话
          alert("添加失败!")
        },
        success: function (msg) {  //成功
          if (msg==-1)
            alert("添加失败!");
          else {
            alert("添加成功!");
          }
        }
      });
    }
  });



  $('#dataList1').DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "columnDefs": [{"orderable": false, "targets": 0}],
    "order": [1, 'asc'],
    "info": true,
    "autoWidth": true,
    "language": {
      "sLoadingRecords": "正在加载...",
      "sProcessing": "正在获取数据，请稍候...",
      "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
      "sInfoFiltered": "(从_MAX_条筛选 )",
      "sInfoEmpty": "共筛选到0条",
      "sSearch": "搜索:",
      "sLengthMenu": "每页显示 _MENU_ 条",
      "sZeroRecords": "无相关记录",
      "paginate": {
        "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
        "sLast": "尾页",
        "sPrevious": "上一页",
        "sNext": "下一页",
        "first": "First page",
        "last": "Last page",
        "next": "Next page",
        "previous": "Previous page"
      }
    }


  });


  function deleteStudentById(sNo) {
    if (confirm("您确定要删除吗？")) {
      location.href = '${pageContext.request.contextPath}/student/deleteByPK?sNo=' + sNo;
      alert("删除成功!");
      location.href = '${pageContext.request.contextPath}/People/StudentList.jsp';
    }
  }

  document.getElementById("delSelected").onclick = function () {
    if (confirm("你确定要删除选中条目吗")) {
      document.getElementById("selection").submit();
    }
  };

  document.getElementById("delSelected2").onclick = function () {
    if (confirm("你确定要删除选中条目吗")) {
      document.getElementById("selection").submit();
    }
  };

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
    setSidebarActive("student-list");

    $("#refresh1").click(function () {
      window.location.reload(true);
    });

    $("#refresh2").click(function () {
      window.location.reload(true);
    });

    document.getElementById("display").removeAttribute("style");
    // 选择框
    $(".select2").select2();

    // WYSIHTML5编辑器
    $(".textarea").wysihtml5({
      locale: 'zh-CN'
    });

    $("#refresh").click(function () {
      window.location.reload(true);
    });

    // 全选操作
    $("#selall").click(function () {
      var clicks = $(this).is(':checked');
      if (!clicks) {
        $("#dataList1 td input[type='checkbox']").iCheck("uncheck");
      } else {
        $("#dataList1 td input[type='checkbox']").iCheck("check");
      }
      $(this).data("clicks", !clicks);
    });
  });
</script>
</html>
