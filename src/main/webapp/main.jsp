<%--
  Created by IntelliJ IDEA.
  User: LiYH
  Date: 2022/11/12
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>河南工业大学运动会管理系统</title>

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
            <img src="assets/img/center.jpg" width="100%" height="100%" alt=""/>
        </div>

        <jsp:include page="common/footer.jsp" />
    </div>

    <script src="plugins/echarts/echarts.min.js" type="text/javascript"></script>
    <script src="plugins/jQuery/jquery-3.6.1.min.js" type="text/javascript"></script>
    <script src="plugins/jQueryUI/jquery-ui.min.js" type="text/javascript"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="plugins/select2/select2.full.min.js" type="text/javascript"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js" type="text/javascript"></script>
    <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="plugins/bootstrap-slider/bootstrap-slider.js" type="text/javascript"></script>
    <script src="plugins/adminLTE/js/app.min.js" type="text/javascript"></script>
    <script type="text/javascript">
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
            setSidebarActive("admin-index");
        });
    </script>
</body>
</html>
