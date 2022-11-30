<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/20
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>用户管理</title>
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
        用户管理
      </h1>
      <ol class="breadcrumb">
        <li><a href="../main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">系统管理</li>
        <li class="active">用户管理</li>
      </ol>
    </section>

    <section class="content">
      <div class="nav-tabs-custom" id="display" style="display: none">
        <ul class="nav nav-tabs">
          <li class="active">
            <a href="#tab-student" data-toggle="tab">学生管理</a>
          </li>
          <li>
            <a href="#tab-teacher" data-toggle="tab">教师管理</a>
          </li>
          <li>
            <a href="#tab-other" data-toggle="tab">其他人员管理</a>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-student">
            <table id="dataList1"
                   class="table table-bordered table-striped table-hover dataTable">
              <thead>
              <tr>
                <th class="text-center">ID</th>
                <th class="text-center">学号</th>
                <th class="text-center">姓名</th>
                <th class="text-center">性别</th>
                <th class="text-center">班级</th>
                <th class="text-center">状态</th>
              </tr>
              </thead>
              <tbody>

              <c:forEach items="${student}" var="student">
                <tr>
                  <td class="text-center">${student.SId}</td>
                  <td class="text-center">${student.SNo }</td>
                  <td class="text-center">${student.SName}</td>
                  <td class="text-center">${student.SGender == false ? "女":"男" }</td>
                  <td class="text-center">${student.classes.CName}</td>
                  <td align="center">
                    <button type="button"
                            class="btn btn-xs ${student.user.UStatus == true ? "btn-primary":"btn-danger"}"
                            onclick="updateUstatus(${student.SNo},${student.user.UStatus})">
                        ${student.user.UStatus == true ? "开启":"禁用"}</button>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="tab-pane" id="tab-teacher">
            <form id="selection2" action="" method="post">
              <table id="dataList2"
                     class="table table-bordered table-striped table-hover dataTable">
                <thead>

                <tr>
                  <th class="text-center">ID</th>
                  <th class="text-center">教工号</th>
                  <th class="text-center">姓名</th>
                  <th class="text-center">性别</th>
                  <th class="text-center">身份</th>
                  <th class="text-center">状态</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="" var="teacher">
                  <tr>
                    <td class="text-center">${teacher.TId}</td>
                    <td class="text-center">${teacher.TNo}</td>
                    <td class="text-center">${teacher.TName}</td>
                    <td class="text-center">${teacher.TGender == false ? "女":"男" }</td>
                    <td class="text-center">${teacher.TIdentity }</td>
                    <td align="center">
                      <button type="button"
                              class="btn btn-xs ${teacher.user.UStatus == true ? "btn-primary":"btn-danger"}"
                              onclick="updateUstatus(${teacher.TNo},${teacher.user.UStatus})">
                          ${teacher.user.UStatus == true ? "开启":"禁用"}</button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </form>
          </div>
          <div class="tab-pane" id="tab-other">
            <form id="selection3" action="" method="post">
              <table id="dataList3"
                     class="table table-bordered table-striped table-hover dataTable">
                <thead>

                <tr>
                  <th class="text-center">ID</th>
                  <th class="text-center">NO</th>
                  <th class="text-center">NAME</th>
                  <th class="text-center">STATUS</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="" var="other">
                  <tr>
                    <td class="text-center">${other.OId}</td>
                    <td class="text-center">${other.ONo }</td>
                    <td class="text-center">${other.OName}</td>
                    <td align="center">
                      <button type="button"
                              class="btn btn-xs ${other.user.UStatus == true ? "btn-primary":"btn-danger"}"
                              onclick="updateUstatus('${other.ONo}',${other.user.UStatus})">
                          ${other.user.UStatus == true ? "开启":"禁用"}</button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </form>
          </div>
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
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script>
  $('#dataList1').DataTable({
    "processing": true,
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "order": [0, 'asc'],
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
    },
  });

  $('#dataList2').DataTable({
    "processing": true,
    "paging": true,
    // "pagingType":   "full_numbers",//分页按钮有首页、上一页、下一页、尾页、页码
    "lengthChange": true,
    "searching": true,
    "order": [0, 'asc'],
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
    },
  });

  $('#dataList3').DataTable({
    "processing": true,
    "paging": true,
    // "pagingType":   "full_numbers",//分页按钮有首页、上一页、下一页、尾页、页码
    "lengthChange": true,
    "searching": true,
    "order": [0, 'asc'],
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
    },
  });

  function updateUstatus(Id, uStatus) {
    if (uStatus) {
      if (confirm("您确定要禁用此账户吗？")) {
        location.href = '${pageContext.request.contextPath}/user/updateUstatus.do?Id=' + Id + '&uStatus=' + uStatus;
        return true;
      } else
        return false;
    }
    if (!uStatus) {
      if (confirm("您确定要开启此账户吗？")) {
        location.href = '${pageContext.request.contextPath}/user/updateUstatus.do?Id=' + Id + '&uStatus=' + uStatus;
        return true;
      } else
        return false;
    }
  }

  $(document).ready(function () {
    document.getElementById("display").removeAttribute("style");
    // 激活导航位置
    setSidebarActive("user-setting");
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


    // 全选操作
    $("#selall1").click(function () {
      var clicks = $(this).is(':checked');
      if (!clicks) {
        $("#dataList1 td input[type='checkbox']").iCheck("uncheck");
      } else {
        $("#dataList1 td input[type='checkbox']").iCheck("check");
      }
      $(this).data("clicks", !clicks);
    });

    $("#selall2").click(function () {
      var clicks = $(this).is(':checked');
      if (!clicks) {
        $("#dataList2 td input[type='checkbox']").iCheck("uncheck");
      } else {
        $("#dataList2 td input[type='checkbox']").iCheck("check");
      }
      $(this).data("clicks", !clicks);
    });

    $("#selall3").click(function () {
      var clicks = $(this).is(':checked');
      if (!clicks) {
        $("#dataList3 td input[type='checkbox']").iCheck("uncheck");
      } else {
        $("#dataList3 td input[type='checkbox']").iCheck("check");
      }
      $(this).data("clicks", !clicks);
    });
  });
</script>
</html>
