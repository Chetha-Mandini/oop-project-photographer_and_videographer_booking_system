<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Reset Password</h3>
                    </div>
                    <div class="card-body">
                        <% if (request.getAttribute("message") != null) { %>
                            <div class="alert alert-info">
                                <%= request.getAttribute("message") %>
                            </div>
                        <% } %>
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                        <form action="forgot-password" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="tel" class="form-control" id="phone" name="phone" required>
                                <small class="form-text text-muted">Enter the phone number associated with your account</small>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="login.jsp">Back to Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
