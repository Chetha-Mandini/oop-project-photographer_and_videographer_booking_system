<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Photographer – PhotoPro</title>


    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    >
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            rel="stylesheet"
    >


    <style>
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
            --primary-red: #686565;
            --nav-ash:       #2f2f2f;
            --dark-bg:       #000000;
            --card-bg: #ffffff;
            --white:         #ffffff;
            --light-gray:    #e6e6e6;
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

        /* form card */
        .form-card {
            background-color: var(--card-bg);
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.5);
        }

        /* ash header */
        .form-header {
            background-color: var(--primary-red);
            color: var(--white);
            border-radius: 10px 10px 0 0 !important;
        }

        /* inputs */
        .form-control,
        .form-select {
            background-color: #222;
            color: var(--white);
            border-color: var(--light-gray);
        }
        .form-control::placeholder {
            color: var(--light-gray);
        }
        .form-control:focus,
        .form-select:focus {
            border-color: var(--primary-red);
            box-shadow: 0 0 0 0.25rem rgba(255, 0, 23, 0.56);
            background-color: #222;
            color: var(--white);
        }

        /* buttons */
        .btn-submit {
            background-color: var(--primary-red);
            border-color: var(--primary-red);
            color: var(--white);
        }
        .btn-outline-light {
            border-color: var(--white);
            color: var(--white);
        }
        .btn-outline-light:hover {
            background-color: var(--white);
            color: var(--dark-bg);
        }

        /* footer */
        footer {
            background-color: var(--nav-ash);
        }
        footer p {
            margin: 0;
            color: var(--light-gray);
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
                    <a class="nav-link" href="listPhotographers">Photographers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add-photographer.jsp">Add New</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ADD PHOTOGRAPHER FORM -->
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card form-card">
                <div class="card-header form-header py-3">
                    <h4 class="mb-0">
                        <i class="fas fa-user-plus me-2"></i>Add New Photographer
                    </h4>
                </div>
                <div class="card-body p-4">
                    <form action="addPhotographer" method="post">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Full Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="name"
                                            name="name"
                                            placeholder="e.g. Jane Doe"
                                            required
                                    >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="specialty" class="form-label">Specialty</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-camera"></i></span>
                                    <select
                                            class="form-select"
                                            id="specialty"
                                            name="specialty"
                                            required
                                    >
                                        <option value="">Select Specialty</option>
                                        <option value="Photographer">Photographer</option>
                                        <option value="Videographer">Videographer</option>
                                        <option value="Both">Both</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input
                                            type="email"
                                            class="form-control"
                                            id="email"
                                            name="email"
                                            placeholder="you@example.com"
                                            required
                                    >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input
                                            type="tel"
                                            class="form-control"
                                            id="phone"
                                            name="phone"
                                            placeholder="+1 555-123-4567"
                                            required
                                    >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="rating" class="form-label">Rating (1–5)</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-star"></i></span>
                                    <input
                                            type="number"
                                            class="form-control"
                                            id="rating"
                                            name="rating"
                                            min="1"
                                            max="5"
                                            step="0.1"
                                            required
                                    >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="hourlyRate" class="form-label">Hourly Rate ($)</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                    <input
                                            type="number"
                                            class="form-control"
                                            id="hourlyRate"
                                            name="hourlyRate"
                                            min="0"
                                            step="0.01"
                                            required
                                    >
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="experience" class="form-label">Experience</label>
                                <textarea
                                        class="form-control"
                                        id="experience"
                                        name="experience"
                                        rows="3"
                                        placeholder="Describe your experience…"
                                        required
                                ></textarea>
                            </div>
                            <div class="col-12">
                                <div class="d-flex justify-content-end gap-2 mt-4">
                                    <a
                                            href="listPhotographers"
                                            class="btn btn-outline-light px-4"
                                    >
                                        <i class="fas fa-times me-1"></i>Cancel
                                    </a>
                                    <button
                                            type="submit"
                                            class="btn btn-submit px-4"
                                    >
                                        <i class="fas fa-save me-1"></i>Save Photographer
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

<!-- FOOTER -->
<footer class="text-center py-4">
    <div class="container">
        <p>&copy;2025 PhotoPro. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS Bundle -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
></script>
</body>
</html>
