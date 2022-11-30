<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/13
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的信息</title>
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
                    <li><a href="../main.jsp"><i class="fa fa-dashboard"></i>
                        首页</a>
                    </li>
                    <li class="active">我的信息</li>
                </ol>
            </section>

            <section class="content">
                <div id="student" class="box-body">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-student" data-toggle="tab">学生信息</a>
                            </li>
                            <li>
                                <a href="#tab-class" data-toggle="tab">班级信息</a>
                            </li>
                            <li>
                                <a href="#tab-dept" data-toggle="tab">学院信息</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-student">
                                <div class="row data-type">
                                    <div class="col-sm-2 title">学号</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SNo"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">姓名</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SName"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">性别</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SGenderStr"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">手机号码</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SPhone"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">电子邮箱</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SEmail"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">身份证号码</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="SIdcard"
                                               value="">
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-class">
                                <div class="row data-type">
                                    <div class="col-sm-2 title">所在班级</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="student.classes.CName"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">专业名称</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control " disabled
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">班主任</div>
                                    <div class="col-sm-10 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" disabled
                                               value="">
                                    </div>
                                </div>
                            </div>

                            <!--label显示的内容-->
                            <div class="tab-pane " id="tab-dept">
                                <div class="row data-type">
                                    <div class="col-sm-2 title">学院</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control" readonly="readonly"
                                               name="student.classes.department.DName"
                                               value="">
                                    </div>

                                    <div class="col-sm-2 title">院长</div>
                                    <div class="col-sm-4 data text">
                                        <input type="text"
                                               style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                                               class="form-control " disabled
                                               value="">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="nav-tabs-custom">

                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-match" data-toggle="tab">参赛信息</a>
                            </li>
                            <li>
                                <a href="#tab-borrow2" data-toggle="tab">体育设备借用信息</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-match">
                                <table id="dataList"
                                       class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="text-center">序号</th>
                                        <th class="text-center">参赛届时</th>
                                        <th class="text-center">参赛人</th>
                                        <th class="text-center">参赛项目</th>
                                        <th class="text-center">参赛时间</th>
                                        <th class="text-center">成绩</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="" var="matches" varStatus="status">
                                        <tr>
                                            <td class="text-center"></td>
                                            <td class="text-center">届</td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center">

                                            </td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs "
                                                        onclick=>
                                                    详情
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="tab-borrow2">
                                <table id="dataList2"
                                       class="table table-bordered table-striped table-hover dataTable">
                                    <thead>

                                    <tr>
                                        <th class="text-center">序号</th>
                                        <th class="text-center">借用人</th>
                                        <th class="text-center">借用器材</th>
                                        <th class="text-center">借用地点</th>
                                        <th class="text-center">借出数量</th>
                                        <th class="text-center">借出时间</th>
                                        <th class="text-center">归还时间</th>
                                        <th class="text-center">借还状态</th>
                                        <th class="text-center">借用描述</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="" var="borrow" varStatus="status">
                                        <tr>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td class="text-center"></td>
                                            <td align="center">
                                            <span class=" label ">

                                            </span>
                                            </td>
                                            <td class="text-center"></td>
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
    $('#dataList').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [4, 'desc'],
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

    $('#dataList2').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [5, 'desc'],
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

    $('#dataList3').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [0, 'asc'],
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

    $('#dataList4').DataTable({
        "paging": true,
        "lengthChange": true,
        "order": [5, 'desc'],
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

    $(document).ready(function () {
        if (${student.SId!=null})
            document.getElementById("student").removeAttribute("style");
        if (${teacher.TId!=null})
            document.getElementById("teacher").removeAttribute("style");
        if (${other.OId!=null})
            document.getElementById("other").removeAttribute("style");
    });


    $(document).ready(function () {
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
        setSidebarActive("user-list");


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
