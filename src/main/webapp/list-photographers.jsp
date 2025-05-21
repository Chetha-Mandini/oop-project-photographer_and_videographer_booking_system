<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Our Photographers – PhotoPro</title>

    <!-- Bootstrap & FontAwesome -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    >
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            rel="stylesheet"
    >

    <style>
        /* Make page full height and use flex to push footer down */
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
            background:
                    linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('images/wallpaper2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: var(--white);
            padding-top: 70px; /* for fixed navbar */
        }
        .content {
            flex: 1;
        }

        :root {
            --primary-red:  #5e5759;
            --nav-ash:      #2f2f2f;
            --white:        #ffffff;
            --light-gray:   #e6e6e6;
            --card-bg:      #ffffff;
        }
        .navbar {
            background-color: var(--nav-ash) !important;
        }
        .nav-link {
            color: var(--light-gray) !important;
        }
        .nav-link.active {
            color: var(--white) !important;
            font-weight: bold;
        }
        .hero-section {
            background: none;
            padding: 60px 0;
            text-align: center;
        }
        .hero-section h1,
        .hero-section p {
            color: var(--white);
        }

        /* Table Styles */
        .table-container {
            background-color: rgba(0,0,0,0.6);
            padding: 1.5rem;
            border-radius: 8px;
            margin: 2rem 0;
        }
        .table thead th {
            border-bottom: 2px solid var(--primary-red);
            color: var(--white);
        }
        .table td, .table th {
            color: var(--white);
        }
        .table tbody tr:hover {
            background-color: rgba(94,87,89,0.2);
        }
        .btn-outline-light {
            border-color: var(--white);
            color: var(--white);
        }
        .btn-outline-light:hover {
            background-color: var(--white);
            color: var(--nav-ash);
        }

        footer {
            background-color: var(--nav-ash);
            color: var(--light-gray);
            padding: 1rem 0;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-camera me-2"></i>PhotoPro
        </a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="listPhotographers">Photographers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-photographer.jsp">Add New</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- CONTENT WRAPPER -->
<div class="content">
    <!-- HERO -->
    <section class="hero-section">
        <div class="container">
            <h1 class="display-4">Our Photographers</h1>
        </div>
    </section>

    <!-- PHOTOGRAPHERS TABLE -->
    <div class="container">
        <div class="table-container">
            <table class="table table-dark table-striped align-middle mb-0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Specialty</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Rating</th>
                    <th>Rate ($/hr)</th>
                    <th class="text-end">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="photographer" items="${photographers}">
                    <tr>
                        <td>${photographer.id}</td>
                        <td>${photographer.name}</td>
                        <td>${photographer.specialty}</td>
                        <td>${photographer.email}</td>
                        <td>${photographer.phone}</td>
                        <td>${photographer.rating}</td>
                        <td>${photographer.hourlyRate}</td>
                        <td class="text-end">
                            <a
                                    href="editPhotographer?id=${photographer.id}"
                                    class="btn btn-sm btn-outline-light me-1"
                            >
                                <i class="fas fa-edit"></i>
                            </a>
                            <a
                                    href="deletePhotographer?id=${photographer.id}"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="return confirm('Delete ${photographer.name}?')"
                            >
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer class="text-center">
    <div class="container">
        <p class="mb-0">&copy;2025 PhotoPro. All rights reserved.</p>
    </div>
</footer>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
></script>
</body>
</html>

