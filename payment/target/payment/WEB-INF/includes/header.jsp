<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.payment.model.User" %>
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-camera me-2"></i>Photography Service
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <% User user = (User) session.getAttribute("user");
                   if (user != null) { %>
                    <% if ("PHOTOGRAPHER".equals(user.getUserType())) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="photographer-dashboard.jsp">
                                <i class="bi bi-speedometer2 me-1"></i>Dashboard
                            </a>
                        </li>
                    <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="client-dashboard.jsp">
                                <i class="bi bi-speedometer2 me-1"></i>Dashboard
                            </a>
                        </li>
                    <% } %>
                    <li class="nav-item">
                        <a class="nav-link" href="bookings.jsp">
                            <i class="bi bi-calendar-check me-1"></i>Bookings
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="messages.jsp">
                            <i class="bi bi-envelope me-1"></i>Messages
                            <span class="badge rounded-pill bg-danger">2</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-1"></i>
                            <span id="navbarUsername"><%= user.getName() %></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="profile.jsp">
                                    <i class="bi bi-person me-2"></i>Profile
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="settings.jsp">
                                    <i class="bi bi-gear me-2"></i>Settings
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item text-danger" href="logout">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-primary text-white px-3" href="register.jsp">
                            Get Started
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
<div style="margin-top: 76px;"></div> <!-- Spacer for fixed navbar -->
