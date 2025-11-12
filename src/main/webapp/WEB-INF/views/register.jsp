<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ReLeaf</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <style>
        body {
            background: url('/images/background-landscape.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
        }
        .register-main {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            padding: 2rem 1rem;
        }
        .register-main::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('/images/background-landscape.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            opacity: 0.7;
        }
        .register-card-modern {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px 0 rgba(46, 82, 61, 0.15);
            padding: 3rem 2.5rem;
            max-width: 500px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 2;
            opacity: 0;
            transform: translateY(20px);
        }
        .register-logo-modern img {
            height: 80px;
            margin-bottom: 1.5rem;
        }
        .register-title-modern {
            font-size: 2rem;
            font-weight: 700;
            color: #2d7a48;
            margin-bottom: 0.5rem;
        }
        .register-subtitle-modern {
            color: #388e3c;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }
        .register-form-modern {
            margin-top: 1.5rem;
        }
        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
            position: relative;
        }
        .form-label {
            color: #2d7a48;
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: block;
            transition: all 0.3s ease;
        }
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 1.5px solid #b2dfdb;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8faf8;
        }
        .form-input:focus {
            outline: none;
            border-color: #2d7a48;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(45, 122, 72, 0.1);
        }
        .form-group i {
            position: absolute;
            left: 1rem;
            top: 2.3rem;
            color: #2d7a48;
            opacity: 0.7;
        }
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 2.3rem;
            color: #2d7a48;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.3s ease;
        }
        .password-toggle:hover {
            opacity: 1;
        }
        .btn-primary {
            width: 100%;
            background: #2d7a48;
            color: #fff;
            padding: 0.9rem;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            margin-top: 0.5rem;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        .btn-primary:hover {
            background: #358856;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(45, 122, 72, 0.2);
        }
        .btn-primary:active {
            transform: translateY(0);
        }
        .register-footer-modern {
            margin-top: 2rem;
            color: #4a5568;
        }
        .register-footer-modern a {
            color: #2d7a48;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .register-footer-modern a:hover {
            color: #358856;
            text-decoration: underline;
        }
        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-weight: 500;
        }
        .alert-error {
            background: #fee2e2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }
        .alert-success {
            background: #dcfce7;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }
        .strength-meter {
            height: 4px;
            background: #e5e7eb;
            border-radius: 2px;
            margin-top: 0.5rem;
            overflow: hidden;
        }
        .strength-meter div {
            height: 100%;
            width: 0;
            transition: all 0.3s ease;
        }
        .password-hints {
            font-size: 0.85rem;
            color: #6b7280;
            margin-top: 0.5rem;
            display: none;
        }
        .password-hints.show {
            display: block;
        }
        @media (max-width: 600px) {
            .register-card-modern {
                padding: 2rem 1.5rem;
            }
        }
    </style>
    <style>
        :root {
            --primary-green: #2d7a48;
            --primary-light: #4CAF50;
            --accent-mint: #98e2c6;
            --accent-beige: #f5e6d3;
            --forest-dark: #1b4332;
            --leaf-green: #40916c;
            --gradient-start: #2d7a48;
            --gradient-end: #66bb6a;
            --gradient-accent: linear-gradient(135deg, #98e2c6, #66bb6a);
            --shadow-color: rgba(46, 82, 61, 0.15);
            --glass-bg: rgba(255, 255, 255, 0.95);
            --glass-border: rgba(255, 255, 255, 0.2);
            --success-green: #059669;
            --error-red: #dc2626;
            --warning-yellow: #eab308;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(-45deg, #2d7a48, #40916c, #4CAF50, #98e2c6);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            font-family: 'Inter', sans-serif;
            color: var(--forest-dark);
            overflow-x: hidden;
        }

        .register-main {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
        }

        .register-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            padding: 3rem;
            width: 100%;
            max-width: 500px;
            position: relative;
            overflow: hidden;
            box-shadow: 
                0 8px 32px var(--shadow-color),
                0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .register-card:hover {
            transform: translateY(-5px);
        }

        .logo-section {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-section img {
            height: 80px;
            margin-bottom: 1rem;
            filter: drop-shadow(0 4px 8px rgba(0,0,0,0.1));
        }

        .register-title {
            font-size: 2.5rem;
            font-weight: 800;
            background: var(--gradient-accent);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin: 0 0 0.5rem;
        }

        .register-subtitle {
            color: var(--forest-dark);
            opacity: 0.8;
            font-size: 1.1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            font-weight: 600;
            color: var(--forest-dark);
            margin-bottom: 0.5rem;
            display: block;
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-green);
            opacity: 0.7;
            transition: all 0.3s ease;
        }

        .form-input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid rgba(152, 226, 198, 0.3);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            color: var(--forest-dark);
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary-light);
            background: white;
            box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.1);
        }

        .form-input:focus + .input-icon {
            transform: translateY(-50%) scale(1.1);
            opacity: 1;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-green);
            opacity: 0.7;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .password-toggle:hover {
            opacity: 1;
        }

        .strength-meter {
            height: 6px;
            background: rgba(203, 213, 225, 0.3);
            border-radius: 3px;
            margin-top: 0.5rem;
            overflow: hidden;
            position: relative;
        }

        .strength-meter::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 0;
            border-radius: 3px;
            transition: all 0.3s ease;
        }

        .btn-register {
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 12px;
            background: var(--gradient-accent);
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-register::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                90deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .btn-register:hover::before {
            left: 100%;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(46, 82, 61, 0.2);
        }

        .register-footer {
            text-align: center;
            margin-top: 2rem;
            color: var(--forest-dark);
        }

        .register-footer a {
            color: var(--primary-green);
            text-decoration: none;
            font-weight: 600;
            position: relative;
        }

        .register-footer a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--gradient-accent);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        .register-footer a:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        .eco-badges {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
        }

        @keyframes float-badge {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(20px, -20px) rotate(10deg); }
        }

        .alert {
            padding: 1rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .alert i {
            font-size: 1.25rem;
        }

        .alert-error {
            background: #fee2e2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .alert-success {
            background: #dcfce7;
            color: #16a34a;
            border: 1px solid #bbf7d0;
        }

        @media (max-width: 640px) {
            .register-card {
                padding: 2rem;
                margin: 1rem;
            }

            .register-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body class="preload">
    <div class="register-main">
        <div class="register-card">
            <div class="eco-badges"></div>
            
            <div class="logo-section">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="ReLeaf Logo" class="logo-img" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/static/images/logo.png';">
                <h1 class="register-title">Join Releaf</h1>
                <p class="register-subtitle">Create your eco-friendly account today</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i>
                    ${error}
                </div>
            </c:if>

            <form method="post" id="registerForm">
                <div class="form-group">
                    <label class="form-label" for="firstname">First Name</label>
                    <div class="input-group">
                        <input type="text" class="form-input" id="firstname" name="firstname" required>
                        <i class="fas fa-user input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="lastname">Last Name</label>
                    <div class="input-group">
                        <input type="text" class="form-input" id="lastname" name="lastname" required>
                        <i class="fas fa-user input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="email">Email Address</label>
                    <div class="input-group">
                        <input type="email" class="form-input" id="email" name="email" required>
                        <i class="fas fa-envelope input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-input" id="password" name="password" required>
                        <i class="fas fa-lock input-icon"></i>
                        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                    </div>
                    <div class="strength-meter" id="passwordStrength"></div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                    <div class="input-group">
                        <input type="password" class="form-input" id="confirmPassword" name="confirmPassword" required>
                        <i class="fas fa-lock input-icon"></i>
                        <i class="fas fa-eye password-toggle" id="toggleConfirmPassword"></i>
                    </div>
                </div>

                <button type="submit" class="btn-register">
                    <span>Create Account</span>
                </button>
            </form>

            <div class="register-footer">
                <p>Already have an account? <a href="/">Sign in</a></p>
            </div>
        </div>
    </div>
    
    <script>
        // Remove preload class after page load
        window.addEventListener('load', () => {
            document.body.classList.remove('preload');
            // Animate card entrance
            gsap.to('.register-card-modern', {
                opacity: 1,
                y: 0,
                duration: 0.8,
                ease: 'power3.out'
            });
        });

        // Password visibility toggle
        document.querySelectorAll('.password-toggle').forEach(toggle => {
            toggle.addEventListener('click', function() {
                const input = this.previousElementSibling;
                if (input.type === 'password') {
                    input.type = 'text';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                } else {
                    input.type = 'password';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                }
            });
        });

        // Password strength checker
        const password = document.getElementById('password');
        const strengthIndicator = document.getElementById('strengthIndicator');
        const passwordHints = document.getElementById('passwordHints');
        const hints = {
            length: document.getElementById('lengthHint'),
            upper: document.getElementById('upperHint'),
            lower: document.getElementById('lowerHint'),
            number: document.getElementById('numberHint'),
            special: document.getElementById('specialHint')
        };

        password.addEventListener('focus', () => {
            passwordHints.classList.add('show');
        });

        password.addEventListener('input', () => {
            const value = password.value;
            let strength = 0;
            
            // Check length
            if (value.length >= 8) {
                strength += 20;
                hints.length.innerHTML = '✓ At least 8 characters';
                hints.length.style.color = '#16a34a';
            } else {
                hints.length.innerHTML = '✗ At least 8 characters';
                hints.length.style.color = '#dc2626';
            }
            
            // Check uppercase
            if (/[A-Z]/.test(value)) {
                strength += 20;
                hints.upper.innerHTML = '✓ One uppercase letter';
                hints.upper.style.color = '#16a34a';
            } else {
                hints.upper.innerHTML = '✗ One uppercase letter';
                hints.upper.style.color = '#dc2626';
            }
            
            // Check lowercase
            if (/[a-z]/.test(value)) {
                strength += 20;
                hints.lower.innerHTML = '✓ One lowercase letter';
                hints.lower.style.color = '#16a34a';
            } else {
                hints.lower.innerHTML = '✗ One lowercase letter';
                hints.lower.style.color = '#dc2626';
            }
            
            // Check numbers
            if (/[0-9]/.test(value)) {
                strength += 20;
                hints.number.innerHTML = '✓ One number';
                hints.number.style.color = '#16a34a';
            } else {
                hints.number.innerHTML = '✗ One number';
                hints.number.style.color = '#dc2626';
            }
            
            // Check special characters
            if (/[^A-Za-z0-9]/.test(value)) {
                strength += 20;
                hints.special.innerHTML = '✓ One special character';
                hints.special.style.color = '#16a34a';
            } else {
                hints.special.innerHTML = '✗ One special character';
                hints.special.style.color = '#dc2626';
            }

            // Update strength indicator
            strengthIndicator.style.width = `${strength}%`;
            if (strength <= 40) {
                strengthIndicator.style.background = '#dc2626';
            } else if (strength <= 80) {
                strengthIndicator.style.background = '#eab308';
            } else {
                strengthIndicator.style.background = '#16a34a';
            }
        });

        // Form validation
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
        });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Remove preload class to enable transitions
            document.body.classList.remove('preload');

            // Initialize GSAP animations
            gsap.from('.register-card', {
                duration: 1,
                y: 50,
                opacity: 0,
                ease: 'power3.out'
            });

            gsap.from('.logo-section > *', {
                duration: 0.8,
                y: 30,
                opacity: 0,
                stagger: 0.2,
                ease: 'back.out(1.7)'
            });

            // Create floating eco badges
            const badges = [
                { icon: '🌱', size: '40px', delay: 0 },
                { icon: '🌿', size: '30px', delay: 2 },
                { icon: '🍃', size: '35px', delay: 1 },
                { icon: '🌳', size: '45px', delay: 3 }
            ];

            const ecoBadges = document.querySelector('.eco-badges');
            badges.forEach(badge => {
                const span = document.createElement('span');
                span.style.cssText = `
                    position: absolute;
                    font-size: ${badge.size};
                    opacity: 0.1;
                    animation: float-badge 6s ease-in-out ${badge.delay}s infinite;
                `;
                span.textContent = badge.icon;
                span.style.left = Math.random() * 80 + 10 + '%';
                span.style.top = Math.random() * 80 + 10 + '%';
                ecoBadges.appendChild(span);
            });

            // Password visibility toggle
            const togglePassword = document.getElementById('togglePassword');
            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirmPassword');

            togglePassword.addEventListener('click', () => {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                togglePassword.classList.toggle('fa-eye');
                togglePassword.classList.toggle('fa-eye-slash');
            });

            toggleConfirmPassword.addEventListener('click', () => {
                const type = confirmPasswordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPasswordInput.setAttribute('type', type);
                toggleConfirmPassword.classList.toggle('fa-eye');
                toggleConfirmPassword.classList.toggle('fa-eye-slash');
            });

            // Password strength meter
            const strengthMeter = document.getElementById('passwordStrength');
            
            passwordInput.addEventListener('input', () => {
                const password = passwordInput.value;
                const strength = calculatePasswordStrength(password);
                updateStrengthMeter(strength);
            });

            function calculatePasswordStrength(password) {
                let strength = 0;
                
                if (password.length >= 8) strength += 25;
                if (/[A-Z]/.test(password)) strength += 25;
                if (/[a-z]/.test(password)) strength += 25;
                if (/[0-9]/.test(password)) strength += 12.5;
                if (/[^A-Za-z0-9]/.test(password)) strength += 12.5;

                return strength;
            }

            function updateStrengthMeter(strength) {
                let color;
                if (strength <= 25) color = 'var(--error-red)';
                else if (strength <= 50) color = 'var(--warning-yellow)';
                else if (strength <= 75) color = 'var(--leaf-green)';
                else color = 'var(--success-green)';

                strengthMeter.style.cssText = `
                    background: rgba(203, 213, 225, 0.3);
                    position: relative;
                `;

                strengthMeter.innerHTML = '<div class="strength-fill"></div>';
                const fill = strengthMeter.querySelector('.strength-fill');
                fill.style.cssText = `
                    position: absolute;
                    top: 0;
                    left: 0;
                    height: 100%;
                    width: ${strength}%;
                    background-color: ${color};
                    transition: all 0.3s ease;
                    border-radius: 3px;
                `;
            }

            // Form validation
            const registerForm = document.getElementById('registerForm');
            
            registerForm.addEventListener('submit', (e) => {
                if (passwordInput.value !== confirmPasswordInput.value) {
                    e.preventDefault();
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'alert alert-error';
                    errorDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i> Passwords do not match';
                    registerForm.insertBefore(errorDiv, registerForm.firstChild);
                    
                    gsap.from(errorDiv, {
                        height: 0,
                        opacity: 0,
                        padding: 0,
                        margin: 0,
                        duration: 0.3,
                        ease: 'power2.out'
                    });

                    setTimeout(() => {
                        gsap.to(errorDiv, {
                            height: 0,
                            opacity: 0,
                            padding: 0,
                            margin: 0,
                            duration: 0.3,
                            ease: 'power2.in',
                            onComplete: () => errorDiv.remove()
                        });
                    }, 3000);
                }
            });

            // Input focus effects
            const inputs = document.querySelectorAll('.form-input');
            
            inputs.forEach(input => {
                input.addEventListener('focus', () => {
                    const icon = input.nextElementSibling;
                    gsap.to(icon, {
                        scale: 1.1,
                        duration: 0.3,
                        ease: 'back.out(1.7)'
                    });
                });

                input.addEventListener('blur', () => {
                    const icon = input.nextElementSibling;
                    gsap.to(icon, {
                        scale: 1,
                        duration: 0.3,
                        ease: 'power2.out'
                    });
                });
            });
        });
    </script>
</body>
</html>

