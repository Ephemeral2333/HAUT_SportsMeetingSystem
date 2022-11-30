<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/15
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="m" class="org.haut.entity.Matches" scope="application"/>
<%
    Subject subject = (Subject) session.getAttribute("subject");
    String uid = subject.getPrincipal().toString();
    m.selectMatches(uid);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的参赛</title>
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
                我的参赛
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">我的参赛</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-primary" id="display" style="display: none">
                <div class="box-header with-border">
                    <h3 class="box-title">参赛列表</h3>
                </div>

                <div class="box-body">
                    <div class="table-box">
<%--                        退赛servlet--%>
                        <form id="del" action="" method="post">
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">届时</th>
                                    <th class="text-center">参赛人学号</th>
                                    <th class="text-center">参赛人姓名</th>
                                    <th class="text-center">参赛项目</th>
                                    <th class="text-center">分道结果</th>
                                    <th class="text-center">赛事成绩</th>
                                    <th class="text-center">赛事排名</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                参赛信息遍历--%>
                                <c:forEach items="${m.matchesList}" var="matches" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${matches.event.ESportmeetingid}届</td>
                                        <td class="text-center">${matches.user.student.SNo }</td>
                                        <td class="text-center">${matches.user.student.SName}</td>
                                        <td class="text-center">${matches.event.EName }</td>
                                        <td class="text-center">${matches.MSort==null ? "暂未分道":matches.MSort }</td>
                                        <td class="text-center">${matches.MScore==null ? "未录入":matches.MScore }${matches.MScore==null ? "":matches.event.EUnit }</td>
                                        <td class="text-center">${matches.MRank==null ? "未录入":matches.MRank }</td>
                                        <td class="text-center">
<%--                                            查看详情--%>
                                            <button type="button" class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/Detail/GradeDetail.jsp?mId=${matches.MId}'">
                                                详情
                                            </button>
<%--                                            退赛--%>
                                            <button type="button" class="btn btn-danger btn-xs "
                                                    onclick="cancle(${matches.MId})">
                                                退赛
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

    function cancle(id) {
        if (confirm("你确定要退赛吗？")) {
            location.href = '${pageContext.request.contextPath}/withdraw?id=' + id;
            alert("成功退赛！");
            location.reload();
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
        setSidebarActive("user-participate");
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

