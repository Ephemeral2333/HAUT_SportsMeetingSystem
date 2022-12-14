<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/13
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ page import="org.haut.entity.Student" %>
<jsp:useBean id="student" class="org.haut.entity.Student" scope="application"/>
<%
  Subject subject = (Subject) session.getAttribute("subject");
  student = Student.createStudent(subject.getPrincipal().toString());
%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>我的信息</title>
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
  <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="hold-transition skin-blue-light sidebar-mini">
<div class="wrapper">
  <jsp:include page="common/header.jsp"/>
  <jsp:include page="common/aside.jsp" />

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        我的信息
      </h1>
      <ol class="breadcrumb">
        <li><a href="main.jsp"><i class="fa fa-dashboard"></i>
          首页</a>
        </li>
        <li class="active">我的信息</li>
      </ol>
    </section>

    <section class="content">
      <shiro:hasRole name="STUDENT">
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
                         value="${student.SNo}">
                </div>

                <div class="col-sm-2 title">姓名</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         name="SName"
                         value="<%=student.getSName()%>">
                </div>

                <div class="col-sm-2 title">性别</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         name="SGenderStr"
                         value="<%=student.getSGender().equals(true) ? '男':'女'%>">
                </div>

                <div class="col-sm-2 title">手机号码</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         name="SPhone"
                         value="<%=student.getSPhone()%>">
                </div>

                <div class="col-sm-2 title">电子邮箱</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         name="SEmail"
                         value="<%=student.getSEmail()%>">
                </div>

                <div class="col-sm-2 title">身份证号码</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         name="SIdcard"
                         value="<%=student.getSIdcard()%>">
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
                         value="${student.classes.CName}">
                </div>

                <div class="col-sm-2 title">专业名称</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control " disabled
                         value="${student.classes.CMajor}">
                </div>

                <div class="col-sm-2 title">班主任</div>
                <div class="col-sm-10 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" disabled
                         value="${student.classes.teacher.TName}">
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
                         value="${student.classes.department.DName}">
                </div>

                <div class="col-sm-2 title">院长</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control " disabled
                         value="${student.classes.department.teacher.TName}">
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

                <c:forEach items="${student.user.matches}" var="matches" varStatus="status">
                  <tr>
                    <td class="text-center">${status.index+1}</td>
                    <td class="text-center">${matches.event.sportmeeting.SId}届</td>
                    <td class="text-center">${student.SName}</td>
                    <td class="text-center">${matches.event.EName}</td>
                    <td class="text-center">${matches.event.EDateStr}</td>
                    <td class="text-center">
                        ${matches.MScore.length()==null ? "成绩未录入" : matches.MScore}${matches.MScore.length() == null ? "": matches.event.EUnit }
                    </td>
                    <td class="text-center">
                      <button type="button" class="btn bg-olive btn-xs "
                              onclick="location.href='${pageContext.request.contextPath}/Detail/GradeDetail.jsp?mId=${matches.MId}'">
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
                  <th class="text-center">借用ID</th>
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

                <c:forEach items="${student.user.borrow}" var="borrow" varStatus="status">
                  <tr>
                    <td class="text-center">${status.index+1}</td>
                    <td class="text-center">${student.SName}</td>
                    <td class="text-center">${borrow.equipment.EName}</td>
                    <td class="text-center">${borrow.equipment.EPlace}</td>
                    <td class="text-center">${borrow.BNum}</td>
                    <td class="text-center">${borrow.BStarttimeStr}</td>
                    <td class="text-center">${borrow.BEndtimeStr}</td>
                    <td align="center">
                      <span class=" label ${borrow.BState == false ? "label-danger":"label-success"} ">
                          ${borrow.BState==false?"未还":"已还"}
                      </span>
                    </td>
                    <td class="text-center">${borrow.BDescription}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      </shiro:hasRole>

      <shiro:hasRole name="TEACHER">
        <div id="teacher" class="box-body">

        <form id="form" action="${pageContext.request.contextPath}/student/update.do"
              method="post">
          <!--tab页-->
          <div class="nav-tabs-custom">

            <!--tab头-->
            <ul class="nav nav-tabs">
              <li class="active">
                <a href="#tab-teacher" data-toggle="tab">教师信息</a>
              </li>
            </ul>
            <!--tab头/-->

            <!--tab内容-->
            <div class="tab-content">

              <!--label显示的内容-->
              <div class="tab-pane active" id="tab-teacher">
                <div class="row data-type">

                  <div class="col-sm-2 title">教工号</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TNo}">
                  </div>

                  <div class="col-sm-2 title">姓名</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TName}">
                  </div>

                  <div class="col-sm-2 title">性别</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white;  BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TGender==true?"男":"女"}">
                  </div>

                  <div class="col-sm-2 title">身份</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TIdentity}">
                  </div>

                  <div class="col-sm-2 title">手机号码</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TPhone}">
                  </div>

                  <div class="col-sm-2 title">电子邮箱</div>
                  <div class="col-sm-4 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TEmail}">
                  </div>

                  <div class="col-sm-2 title">身份证号码</div>
                  <div class="col-sm-10 data text">
                    <input type="text"
                           style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                           class="form-control" readonly="readonly"
                           value="${teacher.TIdcard}">
                  </div>

                </div>
              </div>


            </div>
          </div>
        </form>

        <!--tab页-->
        <div class="nav-tabs-custom">

          <!--tab头-->
          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#tab-student2" data-toggle="tab">所管辖班级的学生信息</a>
            </li>
            <li class="">
              <a href="#tab-borrow" data-toggle="tab">体育器材借还情况</a>
            </li>
          </ul>
          <!--tab头/-->

          <!--tab内容-->
          <div class="tab-content">

            <!--label显示的内容-->
            <div class="tab-pane active" id="tab-student2">
              <!--数据列表-->
              <table id="dataList3"
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

                <c:forEach items="${studentList}" var="student" varStatus="status">

                  <tr>
                    <td class="text-center">${status.index+1}</td>
                    <td class="text-center">${student.classes.CName }</td>
                    <td class="text-center">${student.SNo}</td>
                    <td class="text-center">${student.SName}</td>
                    <td class="text-center">${student.SGenderStr }</td>
                    <td class="text-center">${student.SPhone }</td>
                    <td class="text-center">${student.SEmail }</td>
                    <td class="text-center">${student.SIdcard }</td>
                    <td class="text-center">
                      <button type="button" class="btn bg-olive btn-xs "
                              onclick="location.href='${pageContext.request.contextPath}/student/findDetailsBysId.do?sId=${student.SId}'">
                        详情
                      </button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <!--数据列表/-->
            </div>
            <!--label显示的内容-->
            <div class="tab-pane" id="tab-borrow">
              <!--数据列表-->
              <table id="dataList4"
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

                <c:forEach items="${borrowList}" var="borrow" varStatus="status">
                  <tr>
                    <td class="text-center">${status.index+1}</td>
                    <td align="center">${teacher.TName }</td>
                    <td align="center">${borrow.equipment.EName}</td>
                    <td align="center">${borrow.equipment.EPlace }</td>
                    <td align="center">${borrow.BNum }</td>
                    <td align="center">${borrow.BStarttimeStr }</td>
                    <td align="center">${borrow.BEndtimeStr != null ? borrow.BEndtimeStr: "未还"}</td>
                    <td align="center"><span
                            class=" label ${borrow.BState == false ? "label-danger":"label-success"} "> ${borrow.BState==false?"未还":"已还"}</span>
                    </td>
                    <td align="center">${borrow.BDescription }</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <!--数据列表/-->

            </div>


          </div>


        </div>
      </div>
      </shiro:hasRole>

      <shiro:hasRole name="ADMIN">
        <div id="admin" class="box-body">
        <!--tab页-->
        <div class="nav-tabs-custom">

          <!--tab头-->
          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#tab-other" data-toggle="tab">我的信息</a>
            </li>
          </ul>
          <!--tab头/-->

          <!--tab内容-->
          <div class="tab-content">

            <!--label显示的内容-->
            <div class="tab-pane active" id="tab-other">
              <div class="row data-type">

                <div class="col-sm-2 title">标识</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         value="<%=subject.getPrincipal()%>">
                </div>

                <div class="col-sm-2 title">名称</div>
                <div class="col-sm-4 data text">
                  <input type="text"
                         style="background-color: white; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: solid"
                         class="form-control" readonly="readonly"
                         value="<%=subject.getPrincipal()%>">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </shiro:hasRole>
    </section>
  </div>
</div>
</body>
<script src="plugins/jQuery/jquery-3.6.1.min.js"></script>
<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>
<script src="plugins/select2/select2.full.min.js"></script>
<script src="plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="plugins/adminLTE/js/app.min.js"></script>
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
