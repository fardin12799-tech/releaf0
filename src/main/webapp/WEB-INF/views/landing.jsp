<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReLeaf - Gamify Your Green Life</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
    <link rel="stylesheet" href="/css/landing.css">
    <link rel="stylesheet" href="/css/button.css">
    <link rel="stylesheet" href="/css/gamify.css">
    <style>
        .preload * {
            transition: none !important;
        }
    </style>
</head>
<body class="preload">
    <!-- Navigation -->
    <nav class="navbar glass">
        <div class="navbar-content">
            <div class="logo">
                <img src="/images/logo.png" alt="ReLeaf Logo">
                <span class="logo-text">ReLeaf</span>
            </div>
            <ul class="nav-links">
                <li><a href="#features" class="nav-link">Features</a></li>
                <li><a href="#mission" class="nav-link">Our Mission</a></li>
                <li><a href="#stats" class="nav-link">Impact</a></li>
                <li><a href="/login" class="nav-link cta-button cta-secondary">Sign In</a></li>
                <li><a href="${pageContext.request.contextPath}/register" class="nav-link cta-button cta-primary">Get Started</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="leaf-pattern"></div>
        <div class="hero-leaves" aria-hidden="true">
            <span class="leaf leaf-1"></span>
            <span class="leaf leaf-2"></span>
            <span class="leaf leaf-3"></span>
            <span class="leaf leaf-4"></span>
            <span class="leaf leaf-5"></span>
        </div>
        
        <div class="hero-content">
            <h1 class="hero-title">Transform Your Daily Habits Into <br>Green Impact</h1>
            <p class="hero-subtitle">Join our community of eco-warriors and make every action count towards a sustainable future. Track your progress, earn rewards, and see your real environmental impact.</p>
            <div class="hero-cta">
                <a href="${pageContext.request.contextPath}/register" class="cta-button cta-primary">
                    <i class="fas fa-seedling"></i>
                    Start Your Journey
                </a>
            </div>
            <div class="hero-stats">
                <div class="stat-item">
                    <span class="stat-number">50K+</span>
                    <span class="stat-label">Eco Warriors</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">100K+</span>
                    <span class="stat-label">Trees Planted</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">500K+</span>
                    <span class="stat-label">Green Actions</span>
                </div>
            </div>
            <div class="hero-proof" role="status">12,000+ eco-actions completed this month</div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features">
        <div class="eco-badges">
            <div class="badge-item">🌱</div>
            <div class="badge-item">🌳</div>
            <div class="badge-item">🌿</div>
            <div class="badge-item">🍃</div>
        </div>
        <h2 class="section-title">Level Up Your Green Impact</h2>
        <div class="features-grid">
            <div class="feature-card achievement-card">
                <div class="feature-icon">
                    <i class="fas fa-gamepad"></i>
                    <div class="level-badge">LVL 1</div>
                </div>
                <h3 class="feature-title">Daily Green Quests</h3>
                <p>Take on daily eco-challenges, earn experience points, and unlock exciting achievements as you grow your green journey!</p>
                <div class="progress-bar">
                    <div class="progress" style="width: 75%"></div>
                </div>
                <div class="feature-card-bg"></div>
            </div>
            <div class="feature-card achievement-card">
                <div class="feature-icon">
                    <i class="fas fa-calendar-week"></i>
                    <div class="level-badge">WEEKLY</div>
                </div>
                <h3 class="feature-title">Weekly FunLab Tasks</h3>
                <p>Get fun weekly eco-tasks with a surprise twist! Each week brings a new challenge designed to make your green journey enjoyable and rewarding.</p>
                <div class="rewards-preview">
                    <span class="reward-badge">🏆</span>
                    <span class="reward-badge">🔏</span>
                </div>
                <div class="feature-card-bg"></div>
            </div>
            <!-- Eco Team Battles removed per user request -->
            <div class="feature-card achievement-card">
                <div class="feature-icon">
                    <i class="fas fa-vest-patches"></i>
                    <div class="level-badge">NEW</div>
                </div>
                <h3 class="feature-title">EcoVest</h3>
                <p>A centralized platform to bring all eco-related organizations under one roof 🏬.</p>
                <div class="feature-card-bg"></div>
            </div>
            <div class="feature-card achievement-card">
                <div class="feature-icon">
                    <i class="fas fa-gem"></i>
                    <div class="level-badge special">EPIC</div>
                </div>
                <h3 class="feature-title">Green Rewards Shop</h3>
                <p>Convert your eco-points into real-world rewards! Plant trees, get eco-friendly products, and more!</p>
                <div class="shop-preview">
                    <div class="shop-item">🌳 100pts</div>
                    <div class="shop-item">🎁 500pts</div>
                    <div class="shop-item locked">💎 1000pts</div>
                </div>
                <div class="feature-card-bg"></div>
            </div>
            <!-- Circle card placed inside grid; GSAP will animate it into view -->
            <div class="circle-card" aria-hidden="true">
                <div class="circle-icon"><i class="fas fa-comments"></i></div>
                <h3 class="circle-title">User Group Chat</h3>
                <p class="circle-desc">Connect with fellow eco-warriors, share your progress, and join short discussions to stay motivated on your green journey.</p>
            </div>
        </div>
    </section>

    <!-- Mission Section with 3D Effect -->
    <section id="mission" class="mission">
        <div class="mission-content">
            <h2 class="section-title">Join Our Mission</h2>
            <p class="mission-text">
                At ReLeaf, we believe that small actions lead to big changes. Our mission is to make sustainable living accessible, 
                enjoyable, and rewarding for everyone. By gamifying eco-friendly habits, we're building a community of conscious 
                individuals working together for a greener planet.
            </p>
            <div class="mission-cta">
                <a href="/register" class="cta-button cta-primary">
                    <i class="fas fa-arrow-right"></i>
                    Get Started Now
                </a>
            </div>
        </div>
    </section>

    <!-- Impact Section -->
    <section id="stats" class="mission">
        <div class="mission-content">
            <h2 class="section-title">Impact</h2>
            <p class="mission-text">Drag the bar to simulate completing tasks and see the estimated CO₂ reduction as tasks are completed.</p>

            <div class="impact-interactive" style="max-width:900px;margin:2rem auto;text-align:left;">
                <div id="task-bar" style="height:36px;background:#e6f4ea;border-radius:999px;position:relative;user-select:none;">
                    <div id="task-fill" style="height:100%;width:0%;background:linear-gradient(90deg,var(--primary),var(--primary-dark));border-radius:999px;transition:width .1s linear;"></div>
                    <div id="task-handle" style="position:absolute;top:50%;left:0;transform:translate(-50%,-50%);width:28px;height:28px;border-radius:50%;background:#fff;border:3px solid #dff6e8;box-shadow:0 6px 18px rgba(33,154,82,0.12);touch-action:none;">
                    </div>
                </div>
                <div style="display:flex;justify-content:space-between;margin-top:0.75rem;font-weight:600;">
                    <div><span id="tasks-completed">0</span> / 72 tasks</div>
                    <div><span id="co2-value">0</span> kg CO₂ reduced</div>
                </div>
                <div class="impact-milestones" style="margin-top:0.5rem;display:flex;gap:1rem;align-items:center;justify-content:center;">
                    <span class="milestone"><i class="fas fa-seedling"></i> 10</span>
                    <span class="milestone"><i class="fas fa-tree"></i> 30</span>
                    <span class="milestone"><i class="fas fa-globe"></i> 72</span>
                </div>
                <div style="text-align:center;margin-top:0.75rem;"><button id="share-impact" class="cta-button cta-secondary">Share Your Impact</button></div>
                <small class="text-center" style="display:block;margin-top:0.5rem;color:#556b5e;">Drag or swipe the handle to reveal progress. Each task shows the incremental CO₂ benefit.</small>
            </div>
        </div>
    </section>

    <!-- GSAP + ScrollTrigger for smooth scroll animations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollToPlugin.min.js"></script>
    <script src="/js/landing.js"></script>
    
    <!-- Footer -->
    <footer style="background:#f3faf3;padding:2rem 4%;margin-top:2rem;">
        <div style="max-width:1100px;margin:0 auto;display:flex;justify-content:space-between;gap:1rem;flex-wrap:wrap;align-items:center;">
            <div class="footer-links">
                <a href="#features">Features</a> • <a href="#mission">Mission</a> • <a href="#stats">Impact</a> • <a href="#contact">Contact</a>
            </div>
            <div class="social-icons">
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a>
            </div>
        </div>
        <div style="max-width:1100px;margin:1rem auto 0;text-align:center;color:#6b795f;">© 2025 ReLeaf. All rights reserved.</div>
    </footer>
</body>
</html>
