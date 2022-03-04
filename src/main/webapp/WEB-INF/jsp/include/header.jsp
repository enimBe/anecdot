<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header>
			<div class="header-logo">
				<div class="header-logo-home">AnecDOT.</div>
				<div class="header-logo-page">
					timeline
				</div>
			</div>
			<div class="header-nav">
				Nav bar here
				
				<c:if test="${not empty userName }">
					<div class="mr-4">${userName }님 <a href="/user/sign_out">로그아웃</a> </div>
				</c:if>
			</div>
		</header>