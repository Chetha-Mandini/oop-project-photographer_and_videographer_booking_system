<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="photographerDAO" class="photographer.nav.PhotographerManager"/>
<c:set var="photographer" value="${photographerDAO.getPhotographerById(param.id)}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Photographer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2f2f2f;
            --accent-color: #686565;
        }

        body {
            background:
                    linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('images/wallpaper2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: var(--white);
            padding-top: 70px;
            min-height: 100vh;
        }

        .navbar {
            background-color: var(--primary-color) !important;
        }

        .form-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            background-color: rgba(255,255,255,0.95);
        }

        .form-header {
            background-color: var(--accent-color);
            color: white;
            border-radius: 10px 10px 0 0 !important;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(230, 126, 34, 0.25);
        }

        .btn-submit {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        footer {
            background-color: var(--nav-ash);
            color: var(--light-gray);
            padding: 1rem 0;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-camera me-2"></i>PhotoPro
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="listPhotographers">Photographers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add-photographer.jsp">Add New</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card form-card">
                <div class="card-header form-header py-3">
                    <h4 class="mb-0"><i class="fas fa-user-edit me-2"></i>Edit Photographer</h4>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="updatePhotographer" method="post">
                        <input type="hidden" name="id" value="${photographer.id}">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" name="name"
                                           value="${photographer.name}" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="specialty" class="form-label">Specialty</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-camera"></i></span>
                                    <select class="form-select" id="specialty" name="specialty" required>
                                        <option value="Photographer" ${photographer.specialty == 'Photographer' ? 'selected' : ''}>Photographer</option>
                                        <option value="Videographer" ${photographer.specialty == 'Videographer' ? 'selected' : ''}>Videographer</option>
                                        <option value="Both" ${photographer.specialty == 'Both' ? 'selected' : ''}>Both</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" name="email"
                                           value="${photographer.email}" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="tel" class="form-control" id="phone" name="phone"
                                           value="${photographer.phone}" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="rating" class="form-label">Rating (1-5)</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-star"></i></span>
                                    <input type="number" class="form-control" id="rating" name="rating"
                                           min="1" max="5" step="0.1" value="${photographer.rating}" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="hourlyRate" class="form-label">Hourly Rate ($)</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                    <input type="number" class="form-control" id="hourlyRate" name="hourlyRate"
                                           min="0" step="0.01" value="${photographer.hourlyRate}" required>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="experience" class="form-label">Experience</label>
                                <textarea class="form-control" id="experience" name="experience"
                                          rows="3" required>${photographer.experience}</textarea>
                            </div>

                            <div class="col-12">
                                <div class="d-flex justify-content-end gap-2 mt-4">
                                    <a href="listPhotographers" class="btn btn-outline-secondary px-4">
                                        <i class="fas fa-times me-1"></i>Cancel
                                    </a>
                                    <button type="submit" class="btn btn-submit text-white px-4">
                                        <i class="fas fa-save me-1"></i>Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<footer class="text-white py-4 mt-5">
    <div class="container text-center">
        <p class="mb-0">&copy;2025 PhotoPro. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>