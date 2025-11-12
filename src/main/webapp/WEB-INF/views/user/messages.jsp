<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages - ReLeaf</title>
    <link rel="stylesheet" href="/css/modern-admin.css">
    <link rel="stylesheet" href="/css/messages.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <%@ include file="../common/user-header.jsp" %>

    <main class="main-content">
        <h1 class="page-title">My Messages</h1>

        <c:if test="${not empty success}">
            <div class="alert alert-success">
                ${success}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-error">
                ${error}
            </div>
        </c:if>

        <!-- Messages Overview -->
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Inbox</h2>
                <c:if test="${unreadCount > 0}">
                    <span class="unread-badge">${unreadCount} unread</span>
                </c:if>
            </div>
            
            <c:choose>
                <c:when test="${empty messages}">
                    <div class="no-messages">
                        <div class="no-messages-icon">📬</div>
                        <h3>No messages yet</h3>
                        <p>You haven't received any messages from administrators yet. Check back later!</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="messages-list">
                        <c:forEach var="message" items="${messages}">
                            <div class="message-item ${message.isRead ? 'read' : 'unread'}" onclick="window.location.href='/user/messages/${message.id}'">
                                <div class="message-header">
                                    <div class="message-sender">
                                        <strong>${message.fromUser}</strong>
                                        <c:if test="${!message.isRead}">
                                            <span class="unread-indicator">●</span>
                                        </c:if>
                                    </div>
                                    <div class="message-date">
                                        ${message.createdAt.toLocalDate()} at ${message.createdAt.toLocalTime().toString().substring(0, 5)}
                                    </div>
                                </div>
                                <div class="message-subject">
                                    ${message.subject}
                                </div>
                                <div class="message-preview">
                                    ${message.body.length() > 100 ? message.body.substring(0, 100).concat('...') : message.body}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Help Section -->
        <div class="card">
            <div class="card-body" style="text-align: center; padding: 2rem 0;">
                <h2>Need Help?</h2>
                <p>
                    Administrators may send you important messages about your account, tasks, or platform updates.
                    Make sure to check your inbox regularly!
                </p>
                <div>
                    <a href="/user/dashboard" class="btn btn-primary">Back to Dashboard</a>
                    <a href="/user/tasks" class="btn btn-secondary">Browse Tasks</a>
                </div>
            </div>
        </div>
    </main>

</body>
</html> 