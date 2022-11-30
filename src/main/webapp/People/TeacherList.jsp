<%--
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
<jsp:useBean id="teacher" class="org.haut.entity.Teacher" scope="application" />
<%
    teacher.findAll();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>教师信息列表</title>
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
                教师信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp"><i class="fa fa-dashboard"></i>
                    首页</a>
                </li>
                <li class="active">院系人员</li>
                <li class="active">教师信息</li>
            </ol>
        </section>

        <section class="content">
            <div class="box box-primary" style="display: none" id="display">
                <div class="box-header with-border">
                    <h3 class="box-title">教师信息列表</h3>
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
                                    <th class="" style="padding-right: 0px;">
                                        <input id="selall" type="checkbox">
                                    </th>
                                    <th class="text-center">序号</th>
                                    <th class="text-center">教工号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">性别</th>
                                    <th class="text-center">身份</th>
                                    <th class="text-center">操作</th>

                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${teacher.teacherList}" var="teacher" varStatus="status">
                                    <tr style="text-align: center">
                                        <td><input name="tId" value="${teacher.TId}" type="checkbox"></td>
                                        <td class="text-center">${status.index+1 }</td>
                                        <td class="text-center">${teacher.TNo }</td>
                                        <td class="text-center">${teacher.TName }</td>
                                        <td class="text-center">${teacher.TGender==true?"男":"女" }</td>
                                        <td class="text-center">${teacher.TIdentity }</td>
                                        <td class="text-center">
                                            <button type="button"
                                                    class="btn bg-olive btn-xs "
                                                    onclick="location.href='${pageContext.request.contextPath}/Detail/TeacherDetail.jsp?tId=${teacher.TId}'">
                                                详情
                                            </button>
                                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                    data-target="#myModal"
                                                    onclick="getTeacher(${teacher.TId},${teacher.TNo})">修改
                                            </button>
                                            <button type="button" class="btn bg-red btn-xs "
                                                    onclick="deleteTeacherById('${teacher.TNo}')">删除
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
                                    <input type="hidden" name="TId" id="TId">
                                    <input type="hidden" name="OTNo" id="OTNo">

                                    <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                    <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">
                                    <label for="TNo" class="col-sm-3 control-label">教工号</label>
                                    <div class="col-sm-9">
                                        <input id="TNo" type="text" class="form-control rounded"
                                               name="TNo" required="required" placeholder="教工号"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TName" class="col-sm-3 control-label">姓名</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="TName" class="form-control"
                                               name="TName" required="required" placeholder="姓名"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TGender" class="col-sm-3 control-label">性别</label>
                                    <div class="col-sm-9">
                                        <select id="TGender" style="width: 100%;" name="TGender" class="form-control">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TIdentity" class="col-sm-3 control-label">身份</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="TIdentity" class="form-control"
                                               name="TIdentity" required="required" placeholder="身份"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TPhone" class="col-sm-3 control-label">手机号码</label>
                                    <div class="col-sm-9">
                                        <input type="tel" id="TPhone" class="form-control"
                                               name="TPhone" required="required" placeholder="手机号码"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TEmail" class="col-sm-3 control-label">邮箱</label>
                                    <div class="col-sm-9">
                                        <input type="email" id="TEmail" class="form-control"
                                               name="TEmail" required="required" placeholder="邮箱"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="TIdcard" class="col-sm-3 control-label">身份证号</label>
                                    <div class="col-sm-9">
                                        <input type="number" id="TIdcard" class="form-control"
                                               name="TIdcard" required="required" placeholder="身份证号"/>
                                    </div>
                                    <br>
                                    <br>
                                    <label for="Password" class="col-sm-3 control-label">密码</label>
                                    <div class="col-sm-9">
                                        <input type="password" id="Password" class="form-control"
                                               name="Password" required="required" placeholder="密码"/>
                                    </div>
                                    <br>
                                    <br>
<%--                                    <label for="RoleList" class="col-sm-3 control-label" id="rl">角色</label>--%>
<%--                                    <div class="col-sm-9" id="rls">--%>
<%--                                        <select id="RoleList" class="form-control" data-placeholder="角色"--%>
<%--                                                style="width: 100%;" name="RoleList">--%>
<%--                                            <option value="1">学生</option>--%>
<%--                                            <option value="2">管理员</option>--%>
<%--                                            <option value="3">裁判</option>--%>
<%--                                            <option value="4">志愿者</option>--%>
<%--                                            <option value="5">教师</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                    <br>--%>
<%--                                    <br>--%>
                                    <label for="Status" class="col-sm-3 control-label">用户状态</label>
                                    <div class="col-sm-9">
                                        <select id="Status" style="width: 100%;" name="Status" class="form-control">
                                            <option value="1">开启</option>
                                            <option value="0">禁用</option>
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

    function findAllRoles() {
        var url = "${pageContext.request.contextPath}/role/findAll.do";
        $.get(url, function (data) {
            var html = "";
            for (var i = 0; i < data.length; i++) {
                html += "<option value=\"" + data[i].rId + "\">" + data[i].rName + "</option>";
            }
            $("#RoleList").html(html);
        });
    }

    function getTeacher(id, no) {
        //请求项目列表
        var url = "${pageContext.request.contextPath}/role/findAll.do";
        $.get(url, function (data) {
            var html = "";

            for (var i = 0; i < data.length; i++) {
                if (data[i].rId == 1)
                    html += "<option value=\"" + data[i].rId + "\" selected = 'selected'>" + data[i].rName + "</option>";
                else
                    html += "<option value=\"" + data[i].rId + "\">" + data[i].rName + "</option>";
            }
            $("#RoleList").html(html);
        });


        var url = "${pageContext.request.contextPath}/teacher/findById?id=" + id;
        $.get(url, function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("TId").value = data.tId;
            document.getElementById("TNo").value = data.tNo;
            document.getElementById("OTNo").value = data.tNo;
            document.getElementById("TName").value = data.tName;
            $("#TGender").val(data.tGender == false ? '0' : '1').trigger("change");
            document.getElementById("TIdentity").value = data.tIdentity;
            document.getElementById("TPhone").value = data.tPhone;
            document.getElementById("TEmail").value = data.tEmail;
            document.getElementById("TIdcard").value = data.tIdcard;
            $("#Status").val(data.status == false ? '0' : '1').trigger("change");
            document.getElementById("rl").remove();
            document.getElementById("rls").remove();
            $("#btn").text('修改');
            $("#title").text('修改');
        });
    }

    $("#Submitbtn").click(function () {
        var updateorinsert = document.getElementById("updateOrInsert").value.toString();
        if (updateorinsert == "update") {
            $.ajax({
                type: "POST",   //提交的方法
                url: "${pageContext.request.contextPath}/teacher/update", //提交的地址
                async: false,
                data: {
                    "tId": $("#TId").val(),
                    "tNo": $("#TNo").val(),
                    "tName": $("#TName").val(),
                    "tGender": $("#TGender").val(),
                    "tIdentity": $("#TIdentity").val(),
                    "tPhone": $("#TPhone").val(),
                    "tEmail": $("#TEmail").val(),
                    "tIdcard": $("#TIdcard").val(),
                    "status": $("#Status").val(),
                    "password": $("#Password").val()
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
                url: "${pageContext.request.contextPath}/teacher/add", //提交的地址
                async: false,
                data: {
                    "tNo": $("#TNo").val(),
                    "tName": $("#TName").val(),
                    "tGender": $("#TGender").val(),
                    "tIdentity": $("#TIdentity").val(),
                    "tPhone": $("#TPhone").val(),
                    "tEmail": $("#TEmail").val(),
                    "tIdcard": $("#TIdcard").val(),
                    "status": $("#Status").val(),
                    "password": $("#Password").val()
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

    function deleteTeacherById(tId) {
        if (confirm("您确定要删除吗？")) {
            location.href = '${pageContext.request.contextPath}/teacher/deleteByPK?tId=' + tId;
            alert("删除成功!");
            location.href = '${pageContext.request.contextPath}/People/TeacherList.jsp';
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
        setSidebarActive("teacher-list");

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
