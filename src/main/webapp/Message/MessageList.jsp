<%@ page import="org.apache.shiro.subject.Subject" %><%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/19
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="message" class="org.haut.entity.Message" scope="application" />
<%
    Subject subject = (Subject) session.getAttribute("subject");
    message.selectByVNo(subject.getPrincipal().toString());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>报告信息列表</title>
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
                报告信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">报告信息列表</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-primary" style="display: none" id="display">
                <div class="box-header with-border">
                    <h3 class="box-title">报告信息列表</h3>
                </div>
                <div class="box-body">
                    <div class="table-box">
                        <div class="">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            data-toggle="modal" data-target="#myModal" onclick="">
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
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr style="text-align: center">
                                    <th class="text-center">报告号</th>
                                    <th class="text-center">报告人</th>
                                    <th class="text-center">学生姓名</th>
                                    <th class="text-center">标题</th>
                                    <th class="text-center">内容</th>
                                    <th class="text-center">时间</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${message.messageList}" var="message" varStatus="status">
                                    <tr style="text-align: center">
                                        <td class="text-center">${message.MId }</td>
                                        <td class="text-center">${message.MSender }</td>
                                        <td class="text-center">${message.student.SName }</td>
                                        <td class="text-center">${message.MTitle }</td>
                                        <td class="text-center">${message.MContent }</td>
                                        <td class="text-center">${message.MTimeStr }</td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                    data-target="#myModal"
                                                    onclick="getTeacher(${message.MId})">修改
                                            </button>
                                            <button type="button" class="btn bg-red btn-xs "
                                                    onclick="deleteTeacherById(${message.MId})">删除
                                            </button>
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
                                            data-toggle="modal" data-target="#myModal" onclick="">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick="void(0);" id="delSelected2">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-default" title="刷新" id="refresh2">
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
                                    <input type="hidden" name="MId" id="MId">
                                    <input type="hidden" name="MSender" id="MSender">
                                    <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                    <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                    <label for="MSNo" class="col-sm-3 control-label">报告学生学号</label>
                                    <div class="col-sm-9">
                                        <input id="MSNo" type="text" class="form-control rounded"
                                               name="MSNo" required="required" placeholder="报告学生学号"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="MTitle" class="col-sm-3 control-label">标题</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="MTitle" class="form-control"
                                               name="MTitle" required="required" placeholder="标题"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="MContent" class="col-sm-3 control-label">内容</label>
                                    <div class="col-sm-9">
                                        <input type="tel" id="MContent" class="form-control"
                                               name="MContent" required="required" placeholder="内容"/>
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

    function getTeacher(id) {
        var url = "${pageContext.request.contextPath}/message/findById?id=" + id;
        $.get(url, function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("MId").value = data.mId;
            document.getElementById("MSender").value = data.mSender;
            document.getElementById("MSNo").value = data.mSno;
            document.getElementById("MTitle").value = data.mTitle;
            document.getElementById("MContent").value = data.mContent;
            $("#btn").text('修改');
            $("#title").text('修改');
        });
    }

    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/message/update", //提交的地址
                async: false,
                data: {
                    "mId": $("#MId").val(),
                    "mSno": $("#MSNo").val(),
                    "mTitle": $("#MTitle").val(),
                    "mContent": $("#MContent").val()
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
                        location.href = '${pageContext.request.contextPath}/Message/MessageList.jsp';
                    }
                }
            });
        } else {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/message/add", //提交的地址
                async: false,
                data: {
                    "mSno": $("#MSNo").val(),
                    "mSender": $("#MSender").val(),
                    "mTitle": $("#MTitle").val(),
                    "mContent": $("#MContent").val()
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
                        location.href = '${pageContext.request.contextPath}/Message/MessageList.jsp';
                    }
                }
            });
        }
    });


    $('#dataList').DataTable({
        "processing": true,
        "paging": true,
        // "pagingType":   "full_numbers",//分页按钮有首页、上一页、下一页、尾页、页码
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
        },
    });

    function deleteTeacherById(jNo) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/message/deleteByPK?mNo=' + jNo;
            alert("删除成功!");
            location.href = '${pageContext.request.contextPath}/Message/MessageList.jsp';
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
        setSidebarActive("message-list");

        $("#refresh1").click(function () {
            window.location.reload(true);
        });

        $("#refresh2").click(function () {
            window.location.reload(true);
        });

        // // 列表按钮
        // $("#dataList td input[type='checkbox']").iCheck({
        //     checkboxClass: 'icheckbox_square-blue',
        //     increaseArea: '20%'
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
