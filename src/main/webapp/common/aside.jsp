<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String name = (String) session.getAttribute("name");
%>

<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../assets/img/img.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <%=name%>
                </p>
                <a href="#">
                    <i class="fa fa-circle text-success"></i> 在线
                </a>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index">
                <a href="">
                    <i class="fa fa-home"></i>
                    <span>首页</span>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i>
                    <span>我的信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                <ul class="treeview-menu">
                    <li id="user-list">
                        <a href="${pageContext.request.contextPath}/UserDetail.jsp">
                            <i class="fa fa-circle-o"></i> 我的信息
                        </a>
                    </li>
                    <li id="user-updatepw">
                        <a href="${pageContext.request.contextPath}/updatepw.jsp">
                            <i class="fa fa-circle-o"></i> 密码修改
                        </a>
                    </li>
                </ul>
            </li>

            <shiro:hasRole name="STUDENT">
                <li class="treeview">
                    <a href="#"> <i class="fa fa-trophy"></i>
                        <span>参加比赛</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="participateEvent-list">
                            <a href="${pageContext.request.contextPath}/Student/eventList.jsp">
                                <i class="fa fa-circle-o"></i> 项目列表
                            </a></li>
                        <li id="user-participate"><a
                                href="${pageContext.request.contextPath}/Student/myEvent.jsp">
                            <i class="fa fa-circle-o"></i> 我的参赛
                        </a></li>
                    </ul>
                </li>
            </shiro:hasRole>

            <li class="treeview">
                <a href="#"> <i class="fa fa-bar-chart"></i>
                    <span>运动信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right">
                        </i>
				</span>
                </a>
                <ul class="treeview-menu">
                    <li id="sportmeeting-list">
                        <a href="${pageContext.request.contextPath}/Meeting/openingInformation.jsp">
                            <i class="fa fa-circle-o"></i> 运动会开幕信息
                        </a>
                    </li>
<%--                    <li id="broadcast-list">--%>
<%--                        <a href="">--%>
<%--                            <i class="fa fa-circle-o"></i> 运动会广播信息--%>
<%--                        </a>--%>
<%--                    </li>--%>
                    <li id="event-list">
                        <a href="${pageContext.request.contextPath}/Meeting/eventList.jsp">
                            <i class="fa fa-circle-o"></i> 比赛项目信息
                        </a></li>
                    <li id="matches-list">
                        <a href="${pageContext.request.contextPath}/Meeting/gradeList.jsp">
                            <i class="fa fa-circle-o"></i> 比赛成绩信息
                        </a>
                    </li>
<%--                    <li id="equipment-list"><a--%>
<%--                            href="">--%>
<%--                        <i class="fa fa-circle-o"></i> 运动器材信息--%>
<%--                    </a></li>--%>
                </ul>
            </li>

            <shiro:hasRole name="ADMIN">
                <li class="treeview"><a href="#">
                    <i class="fa fa-users"></i>
                    <span>院系人员</span> <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">
                        <li id="student-list"><a
                                href="${pageContext.request.contextPath}/People/StudentList.jsp">
                            <i class="fa fa-circle-o"></i> 学生信息
                        </a></li>
                        <li id="teacher-list"><a
                                href="${pageContext.request.contextPath}/People/TeacherList.jsp">
                            <i class="fa fa-circle-o"></i> 教师信息
                        </a></li>
                        <li id="volunteer-list"><a
                                href="${pageContext.request.contextPath}/People/VolunteerList.jsp">
                            <i class="fa fa-circle-o"></i> 志愿者信息
                        </a></li>
                        <li id="judge-list"><a
                                href="${pageContext.request.contextPath}/People/JudgeList.jsp">
                            <i class="fa fa-circle-o"></i> 裁判信息
                        </a></li>
                        <li id="classes-list"><a
                                href="${pageContext.request.contextPath}/People/ClassList.jsp">
                            <i class="fa fa-circle-o"></i> 班级信息
                        </a></li>
                        <li id="department-list"><a
                                href="${pageContext.request.contextPath}/People/DepartmentList.jsp">
                            <i class="fa fa-circle-o"></i> 院系信息
                        </a></li>
                    </ul>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="ADMIN">
                <li id="sportmeeting-manage">
                    <a href="${pageContext.request.contextPath}/Manage/OpeningManage.jsp">
                        <i class="fa fa-hand-o-right"></i>
                        <span>开幕管理</span> <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
				        </span>
                    </a>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="ADMIN">
                <li id="broadcast-manage">
                    <a href="${pageContext.request.contextPath}/Manage/BroadcastManage.jsp">
                        <i class="fa fa-hand-o-right"></i>
                        <span>广播管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
				        </span>
                    </a>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="ADMIN">
                <li id="event-manage">
                    <a href="${pageContext.request.contextPath}/Manage/EventManage.jsp">
                        <i class="fa fa-hand-o-right"></i>
                        <span>项目管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			    	    </span>
                    </a>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="ADMIN">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-hand-o-right"></i>
                        <span>成绩管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			        	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="matches-manage">
                            <a href="${pageContext.request.contextPath}/Grade/GradeManage.jsp">
                                <i class="fa fa-circle-o"></i>成绩列表
                            </a>
                        </li>
                        <li id="matches-input">
                            <a href="${pageContext.request.contextPath}/Grade/GradeInput.jsp">
                                <i class="fa fa-circle-o"></i>成绩录入
                            </a>
                        </li>
                    </ul>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="JUDGE">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-hand-o-right"></i>
                        <span>成绩管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			        	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="grade-input">
                            <a href="${pageContext.request.contextPath}/Grade/Judge.jsp">
                                <i class="fa fa-circle-o"></i>成绩录入
                            </a>
                        </li>
                    </ul>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="VOLUNTEER">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-hand-o-right"></i>
                        <span>信息报告</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			        	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="message-list">
                            <a href="${pageContext.request.contextPath}/Message/MessageList.jsp">
                                <i class="fa fa-circle-o"></i>报告信息列表
                            </a>
                        </li>
                    </ul>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="TEACHER">
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-hand-o-right"></i>
                        <span>信息报告</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
			        	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="message-handle">
                            <a href="${pageContext.request.contextPath}/Message/MessageHandle.jsp">
                                <i class="fa fa-circle-o"></i>报告信息处理
                            </a>
                        </li>
                    </ul>
                </li>
            </shiro:hasRole>

            <shiro:hasRole name="ADMIN">
                <li class="treeview"><a href="#"> <i class="fa fa-hand-o-right"></i>
                    <span>器材管理</span> <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
				    </span>
                </a>
                    <ul class="treeview-menu">
                        <li id="equipment-manage">
                            <a href="${pageContext.request.contextPath}/Equipment/EquipmentManage.jsp">
                                <i class="fa fa-circle-o"></i> 器材采购管理
                            </a></li>
                        <li id="borrow-manage">
                            <a href="${pageContext.request.contextPath}/Equipment/BorrowCondition.jsp">
                                <i class="fa fa-circle-o"></i> 器材借还记录
                            </a></li>
                        <li id="borrow">
                            <a href="${pageContext.request.contextPath}/Equipment/Borrow.jsp">
                                <i class="fa fa-circle-o"></i> 器材借用登记
                            </a></li>
                        <li id="return">
                            <a href="${pageContext.request.contextPath}/Equipment/BorrowReturn.jsp">
                                <i class="fa fa-circle-o"></i> 器材归还登记
                            </a></li>
                    </ul>
                </li>
            </shiro:hasRole>
        </ul>
    </section>
</aside>