<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Greenverse Tasks - ReLeaf</title>

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="<c:url value='/css/modern-admin.css'/>">
<link rel="stylesheet" href="<c:url value='/css/greenverse-tasks.css'/>">

</head>
<body>
<%@ include file="/WEB-INF/views/common/user-header.jsp" %>

<main class="main-content">
<div class="page-header">
<h1>Greenverse Tasks</h1>
<a href="<c:url value='/user/greenverse'/>" class="back-btn"><i class="fas fa-arrow-left"></i> Back to Greenverse</a>
</div>

<!-- Stats Section -->
<section class="stats-grid">
<div class="stat-card">
<div class="stat-icon-wrapper">
<i class="fas fa-check-double animated-icon"></i>
</div>
<div class="stat-info">
<p>Completed Tasks</p>
<h3 class="stat-number" data-target="${completedTasks}">0</h3>
</div>
</div>
<div class="stat-card">
<div class="stat-icon-wrapper">
<i class="fas fa-list-check animated-icon"></i>
</div>
<div class="stat-info">
<p>Available Tasks</p>
<h3 class="stat-number" data-target="${availableTasks.size()}">0</h3>
</div>
</div>
<div class="stat-card">
<div class="stat-icon-wrapper">
<i class="fas fa-trophy animated-icon"></i>
</div>
<div class="stat-info">
<p>Total XP</p>
<h3 class="stat-number" data-target="${user.xpPoints}">0</h3>
</div>
</div>
</section>

<!-- Topics Container -->
<section class="topics-container">
<c:set var="topicIcons" value="fa-seedling,fa-shield-alt,fa-tint,fa-hourglass-half,fa-tree,fa-cogs,fa-smog,fa-chalkboard-teacher" />
<c:set var="topicIconsArray" value="${fn:split(topicIcons, ',')}" />

<c:forEach var="progress" items="${progressList}" varStatus="loop">
<div class="topic-card ${progress.topic eq currentTopic.topic ? 'current' : ''} ${!progress.isUnlocked ? 'locked' : ''}">
<c:if test="${!progress.isUnlocked}">
<div class="locked-overlay" title="Unlock by completing previous challenges.">
<i class="fas fa-lock"></i>
</div>
</c:if>
<div class="topic-header">
    <div class="topic-title">
        <i class="fas ${topicIconsArray[loop.index % fn:length(topicIconsArray)]} topic-mascot"></i>
        ${progress.topic}
        <c:if test="${progress.topic eq currentTopic.topic}">
            <span class="current-label">Current</span>
        </c:if>
    </div>
<div class="topic-summary">
<div class="topic-progress-overview">
<c:set var="topicTaskCount" value="${taskCounts[progress.topic]}" />
<span class="progress-text">
    <c:choose>
        <c:when test="${not empty topicTaskCount}">
            ${progress.easyCompleted + progress.mediumCompleted + progress.hardCompleted} / ${topicTaskCount.total} Tasks
        </c:when>
        <c:otherwise>
            0 / 0 Tasks
        </c:otherwise>
    </c:choose>
</span>
<div class="progress-bar-container">
    <c:set var="totalCompleted" value="${progress.easyCompleted + progress.mediumCompleted + progress.hardCompleted}" />
    <c:set var="percentage" value="0" />
    <c:if test="${not empty topicTaskCount and topicTaskCount.total > 0}">
        <c:set var="percentage" value="${(totalCompleted / topicTaskCount.total) * 100}" />
    </c:if>
    <div class="progress-bar" style="width: <c:out value="${percentage}"/>%"></div>
</div>
</div>
<button class="expand-btn"><i class="fas fa-chevron-down"></i></button>
</div>
</div>

<div class="topic-content">
<div class="progress-details">
<div class="progress-item">
<i class="fas fa-leaf" style="color: #28a745;"></i>
<p>Easy: ${progress.easyCompleted} / ${not empty topicTaskCount ? topicTaskCount.easy : 0}</p>
</div>
<div class="progress-item">
<i class="fas fa-mountain" style="color: #ffc107;"></i>
<p>Medium: ${progress.mediumCompleted} / ${not empty topicTaskCount ? topicTaskCount.medium : 0}</p>
</div>
<div class="progress-item">
<i class="fas fa-crown" style="color: #dc3545;"></i>
<p>Hard: ${progress.hardCompleted} / ${not empty topicTaskCount ? topicTaskCount.hard : 0}</p>
</div>
</div>

<div class="difficulty-tabs">
<button class="tab active" data-difficulty="easy" data-topic="${progress.topic}">Easy</button>
<button class="tab ${progress.mediumUnlocked ? '' : 'locked'}" data-difficulty="medium" data-topic="${progress.topic}">Medium</button>
<button class="tab ${progress.hardUnlocked ? '' : 'locked'}" data-difficulty="hard" data-topic="${progress.topic}">Hard</button>
</div>

<div class="tasks-grid-container">
<!-- Tasks grids for each difficulty -->
<div id="easy-tasks-${progress.topic}" class="tasks-grid active">
    <c:forEach var="task" items="${availableTasks}">
        <c:if test="${task.topic eq progress.topic && task.level eq 'Easy'}">
            <div class="task-card">
                <c:set var="taskStatus" value="NONE" />
                <c:forEach var="userTask" items="${userTasks}">
                    <c:if test="${userTask.task.id eq task.id}">
                        <c:set var="taskStatus" value="${userTask.status}" />
                    </c:if>
                </c:forEach>
                <div class="task-status-badge ${fn:toLowerCase(taskStatus)}">${taskStatus}</div>
                <p class="task-description">${task.description}</p>
                <p class="task-xp"><i class="fas fa-star"></i> ${task.xpReward} XP</p>
                <button class="btn btn-primary" onclick="openTaskModal('${task.id}', '${task.description}', this)"
                        <c:if test="${taskStatus ne 'NONE'}">disabled</c:if>>
                    <c:choose>
                        <c:when test="${taskStatus eq 'PENDING_REVIEW'}">Pending</c:when>
                        <c:when test="${taskStatus eq 'APPROVED'}">Completed</c:when>
                        <c:when test="${taskStatus eq 'REJECTED'}">Rejected</c:when>
                        <c:otherwise>Complete Task</c:otherwise>
                    </c:choose>
                </button>
            </div>
        </c:if>
    </c:forEach>
</div>

<div id="medium-tasks-${progress.topic}" class="tasks-grid">
<c:forEach var="task" items="${availableTasks}">
<c:if test="${task.topic eq progress.topic && task.level eq 'Medium'}">
<div class="task-card">
<c:set var="taskStatus" value="NONE" />
<c:forEach var="userTask" items="${userTasks}">
<c:if test="${userTask.task.id eq task.id}">
<c:set var="taskStatus" value="${userTask.status}" />
</c:if>
</c:forEach>
<div class="task-status-badge ${fn:toLowerCase(taskStatus)}">${taskStatus}</div>
<p class="task-description">${task.description}</p>
<p class="task-xp"><i class="fas fa-star"></i> ${task.xpReward} XP</p>
<button class="btn btn-primary" onclick="openTaskModal('${task.id}', '${task.description}', this)"
        <c:if test="${taskStatus ne 'NONE'}">disabled</c:if>>
    <c:choose>
        <c:when test="${taskStatus eq 'PENDING_REVIEW'}">Pending</c:when>
        <c:when test="${taskStatus eq 'APPROVED'}">Completed</c:when>
        <c:when test="${taskStatus eq 'REJECTED'}">Rejected</c:when>
        <c:otherwise>Complete Task</c:otherwise>
    </c:choose>
</button>
</div>
</c:if>
</c:forEach>
</div>

<div id="hard-tasks-${progress.topic}" class="tasks-grid">
<c:forEach var="task" items="${availableTasks}">
<c:if test="${task.topic eq progress.topic && task.level eq 'Hard'}">
<div class="task-card">
<c:set var="taskStatus" value="NONE" />
<c:forEach var="userTask" items="${userTasks}">
<c:if test="${userTask.task.id eq task.id}">
<c:set var="taskStatus" value="${userTask.status}" />
</c:if>
</c:forEach>
<div class="task-status-badge ${fn:toLowerCase(taskStatus)}">${taskStatus}</div>
<p class="task-description">${task.description}</p>
<p class="task-xp"><i class="fas fa-star"></i> ${task.xpReward} XP</p>
<button class="btn btn-primary" onclick="openTaskModal('${task.id}', '${task.description}', this)"
        <c:if test="${taskStatus ne 'NONE'}">disabled</c:if>>
    <c:choose>
        <c:when test="${taskStatus eq 'PENDING_REVIEW'}">Pending</c:when>
        <c:when test="${taskStatus eq 'APPROVED'}">Completed</c:when>
        <c:when test="${taskStatus eq 'REJECTED'}">Rejected</c:when>
        <c:otherwise>Complete Task</c:otherwise>
    </c:choose>
</button>
</div>
</c:if>
</c:forEach>
</div>
</div>
</div>
</div>
</c:forEach>
</section>
</main>

<!-- Task Completion Modal -->
<div id="taskModal" class="modal">
<div class="modal-content">
<div class="modal-header">
<h2 class="modal-title">Complete Task</h2>
<span class="close" onclick="closeTaskModal()">&times;</span>
</div>
<div class="modal-body">
<p id="taskDescription"></p>
<form id="taskForm" method="post" action="<c:url value='/user/complete-task'/>" enctype="multipart/form-data">
<input type="hidden" id="taskId" name="taskId">
<div class="form-group">
<label for="proofImage">Upload Proof (Image)</label>
<input type="file" id="proofImage" name="proofImage" class="form-control" accept="image/*" required>
</div>
<button type="submit" class="btn btn-primary">Submit for Review</button>
</form>
</div>
</div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
// Count-up animation for stats
const counters = document.querySelectorAll('.stat-number');
const speed = 200; // The lower the slower

counters.forEach(counter => {
const updateCount = () => {
const target = +counter.getAttribute('data-target');
const count = +counter.innerText;
const inc = target / speed;

if (count < target) {
counter.innerText = Math.ceil(count + inc);
setTimeout(updateCount, 1);
} else {
counter.innerText = target;
}
};
updateCount();
});

// Collapsible topic cards
const topicHeaders = document.querySelectorAll('.topic-header');
topicHeaders.forEach(header => {
header.addEventListener('click', () => {
const topicCard = header.closest('.topic-card');
if (!topicCard.classList.contains('locked')) {
topicCard.classList.toggle('expanded');
}
});
});

// Auto-expand current topic
const currentTopic = document.querySelector('.topic-card.current');
if (currentTopic && !currentTopic.classList.contains('locked')) {
currentTopic.classList.add('expanded');
}

// Difficulty tabs
const tabs = document.querySelectorAll('.difficulty-tabs .tab');
tabs.forEach(tab => {
tab.addEventListener('click', (e) => {
e.stopPropagation();
if (tab.classList.contains('locked')) return;

const topicCard = tab.closest('.topic-card');
const topicId = tab.dataset.topic;
const difficulty = tab.dataset.difficulty;

// Update tabs
topicCard.querySelectorAll('.difficulty-tabs .tab').forEach(t => t.classList.remove('active'));
tab.classList.add('active');

// Update task grids
topicCard.querySelectorAll('.tasks-grid').forEach(grid => grid.classList.remove('active'));
topicCard.querySelector(`#${difficulty}-tasks-${topicId}`).classList.add('active');
});
});
});

    let currentTaskButton = null;

    // Modal functions
    function openTaskModal(taskId, description, button) {
        document.getElementById('taskId').value = taskId;
        document.getElementById('taskDescription').innerText = description;
        document.getElementById('taskModal').style.display = 'flex';
        currentTaskButton = button;
    }

    function closeTaskModal() {
        document.getElementById('taskModal').style.display = 'none';
        currentTaskButton = null;
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById('taskModal')) {
            closeTaskModal();
        }
    }

    document.getElementById('taskForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const form = event.target;
        const formData = new FormData(form);
        const submitButton = form.querySelector('button[type="submit"]');
        submitButton.disabled = true;
        submitButton.textContent = 'Submitting...';

        fetch(form.action, {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                closeTaskModal();
                if (currentTaskButton) {
                    currentTaskButton.textContent = 'Pending';
                    currentTaskButton.disabled = true;
                    const taskCard = currentTaskButton.closest('.task-card');
                    if (taskCard) {
                        const statusBadge = taskCard.querySelector('.task-status-badge');
                        if (statusBadge) {
                            statusBadge.textContent = 'PENDING_REVIEW';
                            statusBadge.className = 'task-status-badge pending_review';
                        }
                    }
                }
                // Optionally, show a success message
                alert(data.success);
            } else {
                alert('Error: ' + data.error);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An unexpected error occurred. Please try again.');
        })
        .finally(() => {
            submitButton.disabled = false;
            submitButton.textContent = 'Submit for Review';
        });
    });
</script>
</body>
</html>