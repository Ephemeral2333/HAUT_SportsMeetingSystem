<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/20
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="department" class="org.haut.entity.Department" scope="application"/>
<%
    department.findAll();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>院系信息列表</title>
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
                院系信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="../main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">院系人员</li>
                <li class="active">院系信息</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-primary" style="display: none" id="display">
                <div class="box-header with-border">
                    <h3 class="box-title">院系信息列表</h3>
                </div>

                <div class="box-body">
                    <div class="table-box">
                        <div class="">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            data-toggle="modal" data-target="#myModal" onclick="findObjects()">
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
                        <!--工具栏/-->


                        <form id="selection" action="" method="post">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr style="text-align: center">
                                    <th>
                                        <input id="selall" type="checkbox">
                                    </th>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">学院</th>
                                    <th class="text-center">院长</th>
                                    <th class="text-center">学院学生总数</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${department.departmentList}" var="department" varStatus="status">
                                    <tr style="text-align: center">
                                        <td><input name="cId" value="${department.DId}" type="checkbox"></td>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${department.DName}</td>
                                        <td class="text-center">${department.teacher.TName}</td>
                                        <td class="text-center">${department.total}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/Detail/DepartmentDetail.jsp?dId=${department.DId}'">
                                                详情
                                            </button>
                                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                    data-target="#myModal"
                                                    onclick="getDepts(${department.DId},${department.DDeanid})">修改
                                            </button>
                                            <button type="button" class="btn bg-red btn-xs "
                                                    onclick="deleteDepartmentById(${department.DId})">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </form>

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            data-toggle="modal" data-target="#myModal" onclick="findObjects()">
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
                        <!--工具栏/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

            </div>

        </section>

        <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form id="myForm" method="post">
                    <div class="modal-content" style="border-radius: 6px">
                        <div class="modal-header">
                            <h4 class="modal-title" id="title">新建</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="hidden" name="DId" id="DId">

                                <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                <label for="DName" class="col-sm-3 control-label">学院名称</label>
                                <div class="col-sm-9">
                                    <input id="DName" type="text" class="form-control rounded"
                                           name="DName" required="required" placeholder="学院名称"/>
                                </div>
                                <br>
                                <br>
                                <label for="DDeanid" class="col-sm-3 control-label">院长</label>
                                <div class="col-sm-9">
                                    <select id="DDeanid" style="width: 100%;" name="DDeanid" class="form-control">
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
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
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

    function findObjects() {
        var url = "${pageContext.request.contextPath}/teacher/findAllTeachers";
        $.get(url, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].tId + "\">" + data[i].tName + "</option>";
            }
            $("#DDeanid").html(html);
        });
    }


    function getDepts(id, ctid, cdid) {
        var url1 = "${pageContext.request.contextPath}/teacher/findAllTeachers";
        $.get(url1, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i].tId == ctid)
                    html += "<option value=\"" + data[i].tId + "\" selected = 'selected'>" + data[i].tName + "</option>";
                else
                    html += "<option value=\"" + data[i].tId + "\">" + data[i].tName + "</option>";
            }
            $("#DDeanid").html(html);
        });

        var url2 = "${pageContext.request.contextPath}/department/findById?id=" + id;
        $.get(url2, function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("DId").value = data.dId;
            document.getElementById("DName").value = data.dName;
            document.getElementById("DDeanid").value = data.dDeanid;
            $("#btn").text('修改');
            $("#title").text('修改');
        });
    }


    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/department/update", //提交的地址
                async: false,
                data: {
                    "dId": $("#DId").val(),
                    "dName": $("#DName").val(),
                    "dDeanid": $("#DDeanid").val()
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
                url: "${pageContext.request.contextPath}/department/add", //提交的地址
                async: false,
                data: {
                    "dName": $("#DName").val(),
                    "dDeanid": $("#DDeanid").val()
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

    $('#dataList').DataTable({
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


    function deleteDepartmentById(dId) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/department/deleteByPK?dId=' + dId;
            alert("删除成功!");
            location.href = '${pageContext.request.contextPath}/People/DepartmentList.jsp';
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


    $(document).ready(function () {
        document.getElementById("display").removeAttribute("style");
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
        setSidebarActive("department-list");

        $("#refresh1").click(function () {
            window.location.reload(true);
        });


        $("#refresh2").click(function () {
            window.location.reload(true);
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
