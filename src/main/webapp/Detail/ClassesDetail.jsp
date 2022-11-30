<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/29
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="classes" class="org.haut.entity.Classes" scope="application"/>
<jsp:useBean id="student" class="org.haut.entity.Student" scope="application"/>
<%
    String cId = request.getParameter("cId");
    classes.findDetailsBycId(Integer.parseInt(cId));
    student.selectByCid(Integer.parseInt(cId));
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>班级详细信息</title>
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
                我的信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/People/ClassList.jsp"> 班级信息</a></li>
                <li class="active">班级信息详情</li>
            </ol>
        </section>

        <section class="content">

            <div class="box-body">

                <form id="form" action=""
                      method="post">
                    <!--tab页-->
                    <div class="nav-tabs-custom">

                        <!--tab头-->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-classes" data-toggle="tab">班级信息</a>
                            </li>
                        </ul>
                        <!--tab头/-->

                        <!--tab内容-->
                        <div class="tab-content">

                            <!--label显示的内容-->
                            <div class="tab-pane active" id="tab-classes">
                                <div class="row data-type">

                                    <div class="col-sm-2 title">班级名称</div>
                                    <div class="col-sm-10 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${classes.CName}">
                                    </div>
                                    <div class="col-sm-2 title">专业</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${classes.CMajor}">
                                    </div>

                                    <div class="col-sm-2 title">班主任</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${classes.teacher.TName}">
                                    </div>


                                    <div class="col-sm-2 title">学院</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${classes.department.DName}">
                                    </div>

                                    <div class="col-sm-2 title">院长</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               value="${classes.department.teacher.TName}">
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                </form>

                <!--tab页-->
                <div class="nav-tabs-custom" id="display" style="display: none">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-student" data-toggle="tab">班级所有学生信息</a>
                        </li>
                    </ul>
                    <!--tab头/-->

                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-student">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">班级名称</th>
                                    <th class="text-center">学号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">性别</th>
                                    <th class="text-center">电话号码</th>
                                    <th class="text-center">电子邮箱</th>
                                    <th class="text-center">身份证号</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${student.studentList}" var="student" varStatus="status">

                                    <tr>
                                        <td class="text-center">${status.index+1}</td>
                                        <td class="text-center">${classes.CName }</td>
                                        <td class="text-center">${student.SNo}</td>
                                        <td class="text-center">${student.SName}</td>
                                        <td class="text-center">${student.SGenderStr }</td>
                                        <td class="text-center">${student.SPhone }</td>
                                        <td class="text-center">${student.SEmail }</td>
                                        <td class="text-center">${student.SIdcard }</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/Detail/StudentDetail.jsp?sId=${student.SId}'">
                                                详情
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
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

    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
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
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });

        // 激活导航位置
        setSidebarActive("classes-list");


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
