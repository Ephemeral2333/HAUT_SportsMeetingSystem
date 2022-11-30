<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/20
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="equipment" class="org.haut.entity.Equipment" scope="application" />
<%
  equipment.findAll();
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>器材管理</title>
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
        器材管理
      </h1>
      <ol class="breadcrumb">
        <li><a href="../main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">器材管理</li>
      </ol>
    </section>

    <section class="content">
      <div class="box box-primary" id="display" style="display: none">
        <div class="box-header with-border">
          <h3 class="box-title">器材列表</h3>
        </div>

        <div class="box-body">
          <div class="table-box">
            <div class="form-group form-inline">
              <div class="btn-group">
                <button type="button" class="btn btn-default" data-toggle="modal"
                        data-target="#myModal" title="新建">
                  <i class="fa fa-file-o"></i> 购入
                </button>
                <button type="button" class="btn btn-default" title="删除"
                        onclick="void(0);" id="delSelected">
                  <i class="fa fa-trash-o"></i> 删除
                </button>
                <button id="refresh" type="button" class="btn btn-default" title="刷新">
                  <i class="fa fa-refresh"></i> 刷新
                </button>
              </div>
            </div>
            <form id="selection" action="" method="post">
              <table id="dataList"
                     class="table table-bordered table-striped table-hover dataTable">
                <thead>
                <tr>
                  <th>
                    <input id="selall" type="checkbox">
                  </th>
                  <th class="text-center">ID</th>
                  <th class="text-center">器材名称</th>
                  <th class="text-center">型号</th>
                  <th class="text-center">放置地点</th>
                  <th class="text-center">总数</th>
                  <th class="text-center">已借出</th>
                  <th class="text-center">采购时间</th>
                  <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${equipment.equipmentList}" var="equipment">
                  <tr>
                    <td><input name="id" value="${equipment.EId}" type="checkbox"></td>
                    <td class="text-center">${equipment.EId }</td>
                    <td class="text-center">${equipment.EName}</td>
                    <td class="text-center">${equipment.EModel }</td>
                    <td class="text-center">${equipment.EPlace }</td>
                    <td class="text-center">${equipment.ESum }</td>
                    <td class="text-center">${equipment.borrow == null ? "0":equipment.borrow }</td>
                    <td class="text-center">${equipment.EBuytimeStr}</td>
                    <td class="text-center">
                      <button type="button" class="btn bg-olive btn-xs "
                              onclick="location.href='${pageContext.request.contextPath}/Detail/EquipmentDetail.jsp?eId=${equipment.EId}'">
                        详情
                      </button>
                      <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                              data-target="#myModal" onclick="getEvent(${equipment.EId})">修改
                      </button>
                      <button type="button"
                              class="btn bg-red btn-xs "
                              onclick="deleteEquipmentById(${equipment.EId})">
                        删除
                      </button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </form>
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

                  <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                  <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                  <input id="EId" type="hidden" name="EId">

                  <label for="EName" class="col-sm-3 control-label">名称</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control pull-right"
                           placeholder="器材名称" id="EName" name="EName" required="required">
                  </div>
                  <br>
                  <br>
                  <label for="EModel" class="col-sm-3 control-label">型号</label>
                  <div class="col-sm-9 data">
                    <input type="text" class="form-control pull-right"
                           placeholder="器材型号" id="EModel" name="EModel" required="required">
                  </div>
                  <br>
                  <br>
                  <label for="EPlace" class="col-sm-3 control-label">放置地点</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control pull-right"
                           placeholder="放置地点" id="EPlace" name="EPlace" required="required">
                  </div>
                  <br>
                  <br>
                  <label for="ESum" class="col-sm-3 control-label">总数</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control pull-right"
                           placeholder="总数" id="ESum" name="ESum"
                           required="required">
                  </div>
                  <br>
                  <br>
                  <label for="EBuytime" class="col-sm-3 control-label">购入时间</label>
                  <div class="col-sm-9">
                    <div class="input-group date">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                      <input type="text" class="form-control pull-right"
                             placeholder="购入时间" id="EBuytime" name="EBuytime" required="required">
                    </div>
                  </div>
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
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script>
  $('#myModal').on('hidden.bs.modal', function () {
    document.getElementById("myForm").reset();
    $("#btn").text('保存');
    $("#title").text('新增');
  });

  function getEvent(id) {
    var url = "${pageContext.request.contextPath}/equipment/findById?id=" + id;
    $.get(url, function (data) {
      document.getElementById("updateOrInsert").value = "update";
      document.getElementById("EId").value = id;
      document.getElementById("EName").value = data.eName;
      document.getElementById("EModel").value = data.eModel;
      document.getElementById("EPlace").value = data.ePlace;
      document.getElementById("ESum").value = data.eSum;
      document.getElementById("EBuytime").value = data.eBuytime;
      $("#btn").text('修改');
      $("#title").text('修改');
    });
  }


  $("#Submitbtn").click(function () {
    var updateorinsert = document.getElementById("updateOrInsert").value.toString();
    if (updateorinsert == "update") {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/equip/update", //提交的地址
        async: false,
        data: {
          "eId": $("#EId").val(),
          "eName": $("#EName").val(),
          "eModel": $("#EModel").val(),
          "ePlace": $("#EPlace").val(),
          "eSum": $("#ESum").val(),
          "eBuytime": $("#EBuytime").val()
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
            location.href = '${pageContext.request.contextPath}/Equipment/EquipmentManage.jsp';
          }
        }
      });
    } else {
      $.ajax({
        type: "POST",   //提交的方法
        url: "${pageContext.request.contextPath}/equip/add", //提交的地址
        async: false,
        data: {
          "eName": $("#EName").val(),
          "eModel": $("#EModel").val(),
          "ePlace": $("#EPlace").val(),
          "eSum": $("#ESum").val(),
          "eBuytime": $("#EBuytime").val()
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
            location.href = '${pageContext.request.contextPath}/Equipment/EquipmentManage.jsp';
          }
        }
      });
    }
  });

  $('#dataList').DataTable({
    "paging": true,
    "lengthChange": true,
    "order": [1, 'asc'],
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

  function deleteEquipmentById(id) {
    if (confirm("您确定要删除吗？")) {
      location.href = '${pageContext.request.contextPath}/equipment/deleteById?id=' + id;
      alert("删除成功!");
      location.href = '${pageContext.request.contextPath}/Equipment/EquipmentManage.jsp';
    }
  }

  document.getElementById("delSelected").onclick = function () {
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

    document.getElementById("display").removeAttribute("style");

    $("#refresh").click(function () {
      window.location.reload(true);
    });

    // 激活导航位置
    setSidebarActive("equipment-manage");

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
