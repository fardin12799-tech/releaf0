<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groups - ReLeaf</title>
    <link rel="stylesheet" href="/css/modern-admin.css">
    <link rel="stylesheet" href="/css/groups.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/user-header.jsp" %>

    <main class="main-content">
        <h1 class="page-title">Groups</h1>

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

        <c:if test="${not empty warning}">
            <div class="alert alert-warning">
                ${warning}
            </div>
        </c:if>

        <!-- Current Group Status -->
        <c:if test="${currentUser.group != null and currentUser.group.groupName != null}">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title">Your Current Group</h2>
                </div>
                <div class="current-group">
                    <h3>${currentUser.group.groupName}</h3>
                    <p class="description">${currentUser.group.description != null ? currentUser.group.description : 'No description available'}</p>
                    <div class="members-section">
                        <h4>Members (${currentUser.group.members != null ? currentUser.group.members.size() : 0})</h4>
                        <table class="members-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>XP Points</th>
                                    <th>Completed Tasks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="member" items="${currentUser.group.members}">
                                    <c:if test="${member != null and member.name != null}">
                                        <tr class="${member.id == currentUser.id ? 'current-user' : ''}">
                                            <td>
                                                ${member.name}
                                                <c:if test="${member.id == currentUser.id}">
                                                    <span class="badge">You</span>
                                                </c:if>
                                            </td>
                                            <td class="xp-cell">${member.xpPoints != null ? member.xpPoints : 0} XP</td>
                                            <td>${member.completedTasks != null ? member.completedTasks.size() : 0}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Group Chat Section -->
                    <div class="chat-section">
                        <h4>Group Chat</h4>
                        <div id="chat-messages" class="chat-messages">
                            <!-- Messages will be loaded dynamically -->
                        </div>
                        <div class="chat-input">
                            <input type="text" id="message-input" placeholder="Type your message..." maxlength="1000">
                            <button id="send-message" class="btn btn-primary">Send</button>
                        </div>
                    </div>
                    
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            const chatMessages = document.getElementById('chat-messages');
                            const messageInput = document.getElementById('message-input');
                            const sendButton = document.getElementById('send-message');

                            // Show loading state
                            chatMessages.innerHTML = '<div class="chat-loading">Loading messages...</div>';

                            function loadMessages() {
                                if (!chatMessages) {
                                    console.error('Chat messages container not found');
                                    return;
                                }

                                fetch('/user/groups/messages?groupId=${currentUser.group.id}')  // Add groupId parameter
                                    .then(response => {
                                        if (!response.ok) throw new Error('Network response was not ok');
                                        return response.json();
                                    })
                                    .then(messages => {
                                        if (!messages || !Array.isArray(messages)) {
                                            throw new Error('Invalid message format received');
                                        }
                                        
                                        // Process messages
                                        displayMessages(messages);
                                    })
                                    .catch(error => {
                                        console.error('Error:', error);
                                        showErrorMessage('Unable to load messages. Please refresh the page.');
                                    });
                            }

                            function displayMessages(messages) {
                                if (!messages.length) {
                                    chatMessages.innerHTML = '<div class="chat-empty">No messages yet. Start the conversation!</div>';
                                    return;
                                }

                                // Clear only if this is the first load
                                if (!lastMessageId) {
                                    chatMessages.innerHTML = '';
                                }

                                messages.forEach(message => {
                                    if (message && message.id > (lastMessageId || 0)) {
                                        appendMessage(message);
                                        lastMessageId = message.id;
                                    }
                                });

                                scrollToBottom();
                            }

                            function showErrorMessage(message) {
                                const errorDiv = document.createElement('div');
                                errorDiv.className = 'chat-error';
                                errorDiv.textContent = message;
                                chatMessages.appendChild(errorDiv);
                            }

                            function scrollToBottom() {
                                chatMessages.scrollTop = chatMessages.scrollHeight;
                            }

                            // Load initial messages
                            loadMessages();

                            // Setup periodic refresh
                            setInterval(loadMessages, 5000);

                            // Send message function
                            function sendMessage() {
                                const message = messageInput.value.trim();
                                if (!message) return;

                                // Disable input while sending
                                messageInput.disabled = true;
                                sendButton.disabled = true;

                                const formData = new FormData();
                                formData.append('message', message);
                                formData.append('groupId', '${currentUser.group.id}');  // Add groupId

                                fetch('/user/groups/send-message', {
                                    method: 'POST',
                                    body: formData
                                })
                                .then(response => {
                                    if (!response.ok) throw new Error('Failed to send message');
                                    return response.json();
                                })
                                .then(() => {
                                    messageInput.value = '';
                                    loadMessages();
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    showErrorMessage('Failed to send message. Please try again.');
                                })
                                .finally(() => {
                                    messageInput.disabled = false;
                                    sendButton.disabled = false;
                                    messageInput.focus();
                                });
                            }

                            // Event listeners
                            sendButton.addEventListener('click', sendMessage);
                            messageInput.addEventListener('keypress', function(e) {
                                if (e.key === 'Enter' && !e.shiftKey) {
                                    e.preventDefault();
                                    sendMessage();
                                }
                            });
                        });
                    </script>


                    <form method="post" action="/user/leave-group" class="leave-group-form">
                        <button type="submit" class="btn btn-danger">Leave Group</button>
                    </form>
                </div>
            </div>
            
            <!-- Chat JavaScript -->
            <script>
            document.addEventListener('DOMContentLoaded', function() {
                const chatMessages = document.getElementById('chat-messages');
                const messageInput = document.getElementById('message-input');
                const sendButton = document.getElementById('send-message');

                if (!chatMessages || !messageInput || !sendButton) {
                    console.error('Required chat elements not found');
                    return;
                }

                let lastMessageId = null;

                // Load new messages
                function loadMessages() {
                    fetch('/user/groups/messages')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(messages => {
                            if (!messages || !Array.isArray(messages)) {
                                console.warn('No messages received or invalid format');
                                return;
                            }
                            
                            try {
                                // Check if we have new messages
                                const latestMessageId = messages[0]?.id;
                                if (lastMessageId === null) {
                                    // First load - clear and show all messages
                                    chatMessages.innerHTML = '';
                                    messages.reverse().forEach(msg => {
                                        if (msg && msg.messageText) {
                                            appendMessage(msg);
                                        }
                                    });
                                    lastMessageId = latestMessageId;
                                } else if (latestMessageId && latestMessageId !== lastMessageId) {
                                    // New messages - only append new ones
                                    const newMessages = messages.filter(msg => msg.id > lastMessageId);
                                    newMessages.reverse().forEach(msg => {
                                        if (msg && msg.messageText) {
                                            appendMessage(msg);
                                        }
                                    });
                                    lastMessageId = latestMessageId;
                                }
                                chatMessages.scrollTop = chatMessages.scrollHeight;
                            } catch (err) {
                                console.error('Error processing messages:', err);
                            }
                        })
                        .catch(error => {
                            console.error('Error loading messages:', error);
                            // Only show error once per session
                            if (!window.errorShown) {
                                window.errorShown = true;
                                chatMessages.innerHTML += `
                                    <div class="message-error">
                                        Unable to load messages. Please refresh the page.
                                    </div>
                                `;
                            }
                        });
                }

                // Append a new message to the chat
                function appendMessage(message) {
                    const currentUserId = '${currentUser.id}';
                    const isCurrentUser = message.user.id === parseInt(currentUserId);
                    const div = document.createElement('div');
                    div.className = 'message ' + (isCurrentUser ? 'message-own' : 'message-other');
                    
                    const timestamp = new Date(message.createdAt).toLocaleTimeString('en-US', {
                        hour: '2-digit',
                        minute: '2-digit',
                        hour12: false
                    });
                    
                    div.innerHTML = `
                        <div class="message-header">
                            <span class="message-username">${isCurrentUser ? 'You' : message.user.name}</span>
                            <span class="message-time">${timestamp}</span>
                        </div>
                        <div class="message-text">${message.messageText}</div>
                    `;
                    chatMessages.appendChild(div);
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                }

                // Send message handler
                function sendMessage() {
                    const message = messageInput.value.trim();
                    if (!message) return;

                    const formData = new FormData();
                    formData.append('message', message);

                    fetch('/user/groups/send-message', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.error) {
                            console.error(data.error);
                            return;
                        }
                        messageInput.value = '';
                        loadMessages();
                    })
                    .catch(error => console.error('Error sending message:', error));
                }

                // Event listeners
                sendButton.addEventListener('click', sendMessage);
                messageInput.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        sendMessage();
                    }
                });

                // Load messages initially and refresh periodically
                loadMessages();
                setInterval(loadMessages, 10000); // Refresh every 10 seconds
            });
            </script>

        </c:if>

        <!-- Available Groups -->
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Available Groups</h2>
            </div>
            <div class="groups-grid">
                <c:choose>
                    <c:when test="${empty groups}">
                        <div class="no-groups-message">
                            <h3>No groups available yet</h3>
                            <p>There are currently no groups to join. Check back later!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="group" items="${groups}">
                            <c:if test="${currentUser.group == null || currentUser.group.id != group.id}">
                        <div class="group-card">
                            <div class="group-info">
                                <h3>${group.groupName}</h3>
                                <p class="description">${group.description != null ? group.description : 'No description available'}</p>
                                <div class="group-stats">
                                    <span class="member-count">${group.members != null ? group.members.size() : 0} members</span>
                                    <c:if test="${group.members != null and group.members.size() > 0}">
                                        <span class="avg-xp">
                                            Avg. XP: ${group.avgXp != null ? group.avgXp : 0}
                                        </span>
                                    </c:if>
                                </div>
                            </div>
                            <div class="group-actions">
                                <c:if test="${currentUser.group == null}">
                                    <form method="post" action="/user/join-group/${group.id}">
                                        <button type="submit" class="btn btn-primary">Join Group</button>
                                    </form>
                                </c:if>
                            </div>
                            <div class="members-preview">
                                <h4>Top Members</h4>
                                <div class="top-members">
                                    <c:forEach var="member" items="${group.topMembers}" varStatus="status">
                                        <div class="member-row">
                                            <span class="rank">#${status.index + 1}</span>
                                            <span class="name">${member.name}</span>
                                            <span class="xp">${member.xpPoints != null ? member.xpPoints : 0} XP</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

</body>
</html>
