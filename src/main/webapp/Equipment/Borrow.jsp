<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/30
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="equip" class="org.haut.entity.Equipment" scope="application"/>
<%
  equip.findAll();
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>器材借用登记</title>
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
        借用登记
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">借用登记</li>
      </ol>
    </section>

    <section class="content">

      <!-- .box-body -->
      <div class="box box-primary" id="display" style="display: none">
        <div class="box-header with-border">
          <h3 class="box-title">可借列表</h3>
        </div>

        <div class="box-body">

          <!-- 数据表格 -->
          <div class="table-box">

            <!--数据列表-->
            <table id="dataList"
                   class="table table-bordered table-striped table-hover dataTable">
              <thead>
              <tr>
                <th class="text-center">ID</th>
                <th class="text-center">器材名称</th>
                <th class="text-center">型号</th>
                <th class="text-center">放置地点</th>
                <th class="text-center">可外借</th>
                <th class="text-center">采购时间</th>
                <th class="text-center">操作</th>
              </tr>
              </thead>

              <tbody>
              <c:forEach items="${equip.equipmentList}" var="equipment">
                <tr>
                  <td class="text-center">${equipment.EId }</td>
                  <td class="text-center">${equipment.EName}</td>
                  <td class="text-center">${equipment.EModel }</td>
                  <td class="text-center">${equipment.EPlace }</td>
                  <td class="text-center">${equipment.ESum - equipment.borrow<0 ? "0":equipment.ESum - equipment.borrow }</td>
                  <td class="text-center">${equipment.EBuytimeStr}</td>
                  <td class="text-center">
                    <button type="button" class="btn bg-olive btn-xs "
                            onclick="location.href='${pageContext.request.contextPath}/equipment/findDetailsByeId.do?eId=${equipment.EId}'">
                      详情
                    </button>
                    <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                            data-target="#myModal"
                            onclick="getObject(${equipment.EId},'${equipment.EName}')">
                      借出
                    </button>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <!--数据列表/-->

          </div>
          <!-- 数据表格 /-->

        </div>
        <!-- /.box-body -->

      </div>


      <%--保存弹出窗--%>
      <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <form id="myForm" method="post">
            <div class="modal-content" style="border-radius: 6px">
              <div class="modal-header">
                <h4 class="modal-title" id="title">借出</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                  <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="update">
                  <input type="hidden" id="BEid" name="BEid">

                  <label for="BNo" class="col-sm-3 control-label">借用人(学号)</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control pull-right"
                           placeholder="借用人学号" id="BNo" name="BNo" required="required">
                  </div>
                  <br>
                  <br>
                  <label for="EName" class="col-sm-3 control-label">借出器材</label>
                  <div class="col-sm-9 data">
                    <input type="text" class="form-control pull-right"
                           placeholder="借出器材" id="EName" name="EName" required="required"
                           disabled="disabled">
                  </div>
                  <br>
                  <br>
                  <label for="BNum" class="col-sm-3 control-label">借出数量</label>
                  <div class="col-sm-9 data">
                    <input type="text" class="form-control pull-right"
                           placeholder="借出数量" id="BNum" name="BNum" required="required">
                  </div>
                  <br>
                  <br>
                  <label for="BDescription" class="col-sm-3 control-label">借用理由</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control pull-right"
                           placeholder="借用理由" id="BDescription" name="BDescription"
                           required="required">
                  </div>
                  <br>
                  <br>
                </div>
              </div>

              <div class="modal-footer">
                <button id="Submitbtn" type="button" class="btn bg-maroon">借出</button>
                <button type="button" class="btn bg-blue" data-dismiss="modal">关闭</button>
              </div>
            </div>
          </form>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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

  $('#myModal').on('hidden.bs.modal', function () {
    document.getElementById("myForm").reset();
    $("#btn").text('借出');
    $("#title").text('借出');
  });

  function getObject(BEid, EName) {
    document.getElementById("BEid").value = BEid;
    document.getElementById("EName").value = EName;
  }


  $("#Submitbtn").click(function () {
    $.ajax({
      type: "POST",   //提交的方法
      url: "${pageContext.request.contextPath}/borrow/add", //提交的地址
      async: false,
      data: {
        "bNo": $("#BNo").val(),
        "bEid": $("#BEid").val(),
        "bNum": $("#BNum").val(),
        "bDescription": $("#BDescription").val()
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
          location.href = '${pageContext.request.contextPath}/Equipment/Borrow.jsp';
        }
      }
    });
  });

  $('#dataList').DataTable({
    "paging": true,
    "lengthChange": true,
    "order": [0, 'asc'],
    "columnDefs": [{"orderable": false, "targets": 0}],
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

    document.getElementById("display").removeAttribute("style");

    // 激活导航位置
    setSidebarActive("borrow");

    // WYSIHTML5编辑器
    $(".textarea").wysihtml5({
      locale: 'zh-CN'
    });

    // $('#EBuytime').datetimepicker({
    //   format: "yyyy-mm-dd hh:ii:ss",
    //   autoclose: true,
    //   todayBtn: true,
    //   language: "zh-CN"
    // });


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
