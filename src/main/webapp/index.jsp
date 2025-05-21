<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhotoPro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
            url('images/wallpaper.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            color: #fff;
            display: flex;
            align-items: center;
        }
        .nav-link.active {
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-camera me-2"></i>PhotoPro
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="listPhotographers">Photographers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-photographer.jsp">Add New</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section with Background Photo -->
<section class="hero-section">
    <div class="container text-center">
        <h1 class="display-4">Welcome to PhotoPro</h1>
        <p class="lead">Manage and showcase our photographers in one place.</p>
        <a href="listPhotographers" class="btn btn-lg btn-light mt-3">
            View All Photographers
        </a>
        <br>
        <a href="add-photographer.jsp" class="btn btn-lg btn-light mt-3">
            <i class="fas fa-plus me-1"></i> Add New Photographer
        </a>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-4 mt-auto">
    <div class="container text-center">
        <p class="mb-0">&copy;2025 PhotoPro. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
