<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/29
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="sportmeeting" class="org.haut.entity.Sportmeeting" scope="application"/>
<%
    sportmeeting.findAll();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>开幕信息管理</title>
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
                开幕信息管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">开幕信息管理</li>
            </ol>
        </section>

        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">开幕信息记录</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" data-toggle="modal"
                                        data-target="#myModal" title="新建">
                                    <i class="fa fa-file-o"></i> 新建
                                </button>
                                <button id="refresh" type="button" class="btn btn-default" title="刷新">
                                    <i class="fa fa-refresh"></i> 刷新
                                </button>
                                <%--                                <button type="button" class="btn btn-default" title="导出"--%>
                                <%--                                        onclick="location.href='${pageContext.request.contextPath}/sportmeeting/export.do'">--%>
                                <%--                                    <i class="fa fa-refresh"></i> 导出--%>
                                <%--                                </button>--%>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="text-center">序号</th>
                                <th class="text-center">届时</th>
                                <th class="text-center">运动会名称</th>
                                <th class="text-center">运动会主题</th>
                                <th class="text-center">举办时间</th>
                                <th class="text-center">状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${sportmeeting.sportmeetingList}" var="spormeeting" varStatus="status">
                                <tr>
                                    <td class="text-center">${status.index+1 }</td>
                                    <td class="text-center">${spormeeting.SId }届</td>
                                    <td class="text-center">${spormeeting.SName }</td>
                                    <td class="text-center">${spormeeting.STheme }</td>
                                    <td class="text-center">${spormeeting.SDateStr }</td>
                                    <td class="text-center">
                                        <button type="button"
                                                class="btn btn-xs ${spormeeting.SStatus == true ? "btn-primary":"btn-danger"}"
                                                onclick="updatestatus(${spormeeting.SId},${spormeeting.SStatus})">
                                                ${spormeeting.SStatus == true ? "开启":"关闭"}</button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs "
                                                onclick="location.href='${pageContext.request.contextPath}/Detail/OpeingDetail.jsp?sId=${spormeeting.SId}'">
                                            详情
                                        </button>
                                        <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                data-target="#myModal" onclick="getProject(${spormeeting.SId})">修改
                                        </button>
                                        <button type="button"
                                                class="btn bg-red btn-xs "
                                                onclick="deleteSportmeetingById(${spormeeting.SId})">
                                            删除
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
                                <h4 class="modal-title" id="title">新建</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">

                                    <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                    <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">

                                    <label for="SId" class="col-sm-3 control-label">届时</label>
                                    <div class="col-sm-9">
                                        <input id="SId" type="text" class="form-control rounded" placeholder="届时"
                                               name="SId" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SStatus" class="col-sm-3 control-label">状态</label>
                                    <div class="col-sm-9 data">
                                        <select id="SStatus" style="width: 100%;" name="SStatus" class="form-control">
                                            <option value="0">关闭</option>
                                            <option value="1">开启</option>
                                        </select>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SName" class="col-sm-3 control-label">名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="SName" class="form-control" placeholder="名称" name="SName"
                                               required="required"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="STheme" class="col-sm-3 control-label">主题</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control pull-right"
                                               placeholder="主题" id="STheme" name="STheme" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SDate" class="col-sm-3 control-label">举办时间</label>
                                    <div class="col-sm-9">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right"
                                                   placeholder="举办时间" id="SDate" name="SDate" required="required">
                                        </div>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SPlace" class="col-sm-3 control-label">举办地点</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control pull-right"
                                               placeholder="举办地点" id="SPlace" name="SPlace" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SStarttime" class="col-sm-3 control-label">开始时间</label>
                                    <div class="col-sm-9">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right"
                                                   placeholder="开始时间" id="SStarttime" name="SStarttime"
                                                   required="required">
                                        </div>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SEndtime" class="col-sm-3 control-label">结束时间</label>
                                    <div class="col-sm-9">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right"
                                                   placeholder="结束时间" id="SEndtime" name="SEndtime" required="required">
                                        </div>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="SDescription" class="col-sm-3 control-label rowHeight2x">描述</label>
                                    <div class="col-sm-9">
                                        <input id="SDescription" class="form-control" rows="3" placeholder="输入 ..."
                                               name="SDescription"></input>
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

    function getProject(id) {
        document.getElementById("SId").setAttribute("readonly", "readonly");
        var url = "${pageContext.request.contextPath}/sportmeeting/findBysId?id=" + id;
        $.get(url, function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("SId").value = id;
            $("#SStatus").val(data.sStatus == false ? '0' : '1').trigger("change");
            document.getElementById("SName").value = data.sName;
            document.getElementById("STheme").value = data.sTheme;
            document.getElementById("SDate").value = data.sDate;
            document.getElementById("SPlace").value = data.sPlace;
            document.getElementById("SStarttime").value = data.sStarttime;
            document.getElementById("SEndtime").value = data.sEndtime;
            document.getElementById("SDescription").value = data.sDescription;
            $("#btn").text('修改');
            $("#title").text('修改');
        });
    }


    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/sport/update", //提交的地址
                async: false,
                data: {
                    "sId": $("#SId").val(),
                    "sStatus": $("#SStatus").val(),
                    "sName": $("#SName").val(),
                    "sTheme": $("#STheme").val(),
                    "sDate": $("#SDate").val(),
                    "sPlace": $("#SPlace").val(),
                    "sStarttime": $("#SStarttime").val(),
                    "sEndtime": $("#SEndtime").val(),
                    "sDescription": $("#SDescription").val()
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
                url: "${pageContext.request.contextPath}/sport/add", //提交的地址
                async: false,
                data: {
                    "sId": $("#SId").val(),
                    "sStatus": $("#SStatus").val(),
                    "sName": $("#SName").val(),
                    "sTheme": $("#STheme").val(),
                    "sDate": $("#SDate").val(),
                    "sPlace": $("#SPlace").val(),
                    "sStarttime": $("#SStarttime").val(),
                    "sEndtime": $("#SEndtime").val(),
                    "sDescription": $("#SDescription").val()
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

    function updatestatus(Id, Status) {
        if (Status) {
            if (confirm("您确定要关闭此届运动会吗？")) {
                location.href = '${pageContext.request.contextPath}/sportmeeting/updateStatus.do?Id=' + Id + '&Status=' + Status;
            }
        }
        if (!Status) {
            if (confirm("您确定要开启此届运动会吗？")) {
                location.href = '${pageContext.request.contextPath}/sportmeeting/updateStatus.do?Id=' + Id + '&Status=' + Status;
            }
        }
    }


    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [1, 'desc'],
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

    function deleteSportmeetingById(sId) {
        if (confirm("您确定要删除吗？若执意要删除，将删除掉与本届运动会相关的所有信息，包括广播信息，项目信息和成绩信息...")) {
            location.href = '${pageContext.request.contextPath}/sportmeeting/deleteByPK?sId=' + sId;
            alert("删除成功！");
            location.reload();
        }
    }


    // $(document).ready(function () {
    //     $('#SDate').datetimepicker({
    //         format: "yyyy-mm-dd hh:ii:ss",
    //         autoclose: true,
    //         todayBtn: true,
    //         language: "zh-CN"
    //     });
    //     $('#SStarttime').datetimepicker({
    //         format: "yyyy-mm-dd hh:ii:ss",
    //         autoclose: true,
    //         todayBtn: true,
    //         language: "zh-CN"
    //     });
    //     $('#SEndtime').datetimepicker({
    //         format: "yyyy-mm-dd hh:ii:ss",
    //         autoclose: true,
    //         todayBtn: true,
    //         language: "zh-CN"
    //     });
    // });


    $(document).ready(function () {

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
        setSidebarActive("sportmeeting-manage");

        $("#refresh").click(function () {
            window.location.reload(true);
        });

        // $("#SStarttime").datetimepicker({
        //     format: "yyyy-mm-dd hh:ii:ss",
        // });
        // $("#SEndtime").datetimepicker({
        //     format: "yyyy-mm-dd hh:ii:ss",
        // });
        // $("#SDate").datetimepicker({
        //     format: "yyyy-mm-dd hh:ii:ss",
        // });
    });
</script>
</html>
