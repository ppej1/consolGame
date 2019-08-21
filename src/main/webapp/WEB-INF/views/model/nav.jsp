<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-chess"></i>
			</div>
			<div class="sidebar-brand-text mx-3">
				GameBill <sup>2</sup>
			</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item"id="DashboardNav"><a class="nav-link" href="disboard"> <i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">User</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item" id="UserserviceNav"><a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i> <span>User
					service</span>
			</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">User Pages:</h6>
					<a class="collapse-item" href="gameList">게임리스트</a>
					<c:if test="${not empty sessionScope.loginId}">
						<a class="collapse-item" href="checkLend">대여 이력 조회</a>
					</c:if>
				</div>
			</div>
		</li>


		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Heading -->
		<div class="sidebar-heading">Addons</div>
		<!-- Nav Item - Charts -->
		<li class="nav-item" id="ChartsNav"><a class="nav-link" href="chart"> <i class="fas fa-fw fa-chart-area"></i>
				<span>Charts</span></a></li>
		<c:if test="${sessionScope.loginLevel == 0}">
			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Nav Item - Utilities Collapse Menu -->
			<div class="sidebar-heading">Manager</div>
			<li class="nav-item" id="ManagerNav"><a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i
						class="fas fa-fw fa-wrench"></i> <span>Manager</span>
				</a>
				<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="lendRequestList">대여 신청 목록</a> 
						<a class="collapse-item" href="lendList">대여 목록</a> <a
							class="collapse-item" href="overdueList">연체 목록</a> 
							<a class="collapse-item" href="userInfo">유저 정보 조회</a>
					</div>
				</div>
			</li>
		</c:if>
		<!-- Divider -->
		<hr class="sidebar-divider">
		<li>
			<!-- Topbar Search -->
			<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-3 my-md-0 mw-100 navbar-search">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
						aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
		</li>
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

	</ul>
