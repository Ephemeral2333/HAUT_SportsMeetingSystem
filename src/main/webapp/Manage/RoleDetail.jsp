<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/20
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>角色信息详情</title>
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
        角色信息详情
      </h1>
      <ol class="breadcrumb">
        <li><a href="../main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li><a href=""> 角色列表</a></li>
        <li class="active">角色信息详情</li>
      </ol>
    </section>

    <section class="content">
      <div class="box-body" id="display" style="display: none">
        <div class="nav-tabs-custom">
          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#tab-sportmeeting" data-toggle="tab">角色信息详情</a>
            </li>
          </ul>
          <div class="tab-content">

            <div class="tab-pane active" id="tab-sportmeeting">
              <div class="row data-type">

                <div class="col-sm-2 title">角色名称</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         id="SId"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         value="">
                </div>

                <div class="col-sm-2 title">角色描述</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         id="SStatus"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         value="">
                </div>

              </div>
            </div>
            <br>
          </div>
        </div>
        <div class="nav-tabs-custom">

          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#tab-user" data-toggle="tab">用户列表</a>
            </li>
          </ul>

          <div class="tab-content">
            <div class="tab-pane active" id="tab-user">
              <table
                      id="dataList"
                      class="table table-bordered table-striped table-hover dataTable">
                <thead>
                <tr>
                  <th class="text-center">序号</th>
                  <th class="text-center">u_id</th>
                  <th class="text-center">u_status</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="" var="roleUserList" varStatus="status">
                  <tr>
                    <td class="text-center">${status.index+1}</td>
                    <td class="text-center">${roleUserList.UId}</td>
                    <td class="text-center">${roleUserList.user.UStatus}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
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
  function deleteRoleUser() {

  }

  $('#dataList').DataTable({
    "paging": true,
    "lengthChange": true,
    // "columnDefs": [{"orderable": false, "targets": 0}],
    "order": [0, 'asc'],
    "searching": true,
    "ordering": true,
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
    setSidebarActive("role");

    document.getElementById("display").removeAttribute("style");
    // 选择框
    $(".select2").select2();

    // WYSIHTML5编辑器
    $(".textarea").wysihtml5({
      locale: 'zh-CN'
    });

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
