<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="user-header">
    <div class="logo-container">
        <img src="<c:url value='/images/releaf-logo.jpg'/>" alt="Releaf Logo" class="logo">
        <span class="logo-text">Releaf</span>
    </div>
    <div class="main-nav">
        <nav>
            <a href="<c:url value='/user/dashboard'/>" class="nav-link ${pageContext.request.servletPath == '/user/dashboard.jsp' ? 'active' : ''}">Dashboard</a>
            <a href="<c:url value='/user/tasks'/>" class="nav-link ${pageContext.request.servletPath == '/user/tasks-landing.jsp' ? 'active' : ''}">Tasks</a>
            <a href="<c:url value='/user/achievements'/>" class="nav-link ${pageContext.request.servletPath == '/user/achievements.jsp' ? 'active' : ''}">Achievements</a>
            <a href="<c:url value='/user/groups'/>" class="nav-link ${pageContext.request.servletPath == '/user/groups.jsp' ? 'active' : ''}">Groups</a>
            <a href="<c:url value='/user/notices'/>" class="nav-link ${pageContext.request.servletPath == '/user/notices.jsp' ? 'active' : ''}">Notices</a>
        </nav>
    </div>
    <div class="user-menu">
        <div class="user-info">
            <span class="username">${sessionScope.userName}</span>
            <span class="xp-points">${user.xpPoints} XP</span>
        </div>
        <div class="profile-dropdown">
            <img src="${empty user.profilePicture ? pageContext.request.contextPath.concat('/images/default-avatar.png') : pageContext.request.contextPath.concat('/user-photos/').concat(user.profilePicture)}" alt="User Avatar" class="avatar">
            <div class="dropdown-content">
                <a href="<c:url value='/user/profile'/>">Profile</a>
                <a href="<c:url value='/user/messages'/>">Messages</a>
                <a href="<c:url value='/logout'/>">Logout</a>
            </div>
        </div>
    </div>
</header>