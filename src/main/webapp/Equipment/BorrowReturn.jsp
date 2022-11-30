<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/30
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="borrow" class="org.haut.entity.Borrow" scope="application"/>
<%
    borrow.findAllOff();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>器材归还登记</title>
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
                器材归还
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">器材归还</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-primary" id="display" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">借还列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" title="删除"
                                        onclick="void(0);" id="delSelected">
                                    <i class="fa fa-pencil-square-o"></i> 归还
                                </button>
                                <button id="refresh" type="button" class="btn btn-default" title="刷新">
                                    <i class="fa fa-refresh"></i> 刷新
                                </button>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <!--数据列表-->
                        <form id="selection" action="${pageContext.request.contextPath}/borrow/update"
                              method="post">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th>
                                        <input id="selall" type="checkbox">
                                    </th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">借用人ID</th>
                                    <th class="text-center">借用人</th>
                                    <th class="text-center">借出器材ID</th>
                                    <th class="text-center">借出器材名称</th>
                                    <th class="text-center">借出输数量</th>
                                    <th class="text-center">借出时间</th>
                                    <th class="text-center">借用理由</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${borrow.borrowList}" var="borrow">
                                    <tr>
                                        <td><input name="id" value="${borrow.BId}" type="checkbox"></td>
                                        <td class="text-center">${borrow.BId }</td>
                                        <td class="text-center">${borrow.BNo}</td>
                                        <td class="text-center">${borrow.user.student.SName}</td>
                                        <td class="text-center">${borrow.BEid}</td>
                                        <td class="text-center">${borrow.equipment.EName}</td>
                                        <td class="text-center">${borrow.BNum}</td>
                                        <td class="text-center">${borrow.BStarttimeStr}</td>
                                        <td class="text-center">${borrow.BDescription }</td>
                                        <td class="text-center">
                                            <button type="button"
                                                    class="btn bg-red btn-xs "
                                                    onclick="returnTo(${borrow.BId})">
                                                归还
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </form>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                <!-- /.box-body -->

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
    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [7, 'desc'],
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

    function returnTo(id) {
        if (confirm("是否归还？")) {
            location.href = '${pageContext.request.contextPath}/borrow/update?id=' + id;
            alert("归还成功");
            location.href = '${pageContext.request.contextPath}/Equipment/BorrowReturn.jsp';
        }
    }

    document.getElementById("delSelected").onclick = function () {
        if (confirm("你确定要归还选中条目吗")) {
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
        setSidebarActive("return");

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });

        $('#EBuytime').datetimepicker({
            format: "yyyy-mm-dd hh:ii:ss",
            autoclose: true,
            todayBtn: true,
            language: "zh-CN"
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
