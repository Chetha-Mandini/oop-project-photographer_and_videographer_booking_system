<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer mt-auto py-4 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <h5 class="mb-3"><i class="bi bi-camera me-2"></i>Photography Service</h5>
                <p class="text-muted mb-0">Connecting talented photographers with clients for memorable moments.</p>
            </div>
            <div class="col-md-2 mb-4 mb-md-0">
                <h6 class="mb-3">Quick Links</h6>
                <ul class="list-unstyled mb-0">
                    <li class="mb-2"><a href="about.jsp" class="text-decoration-none text-muted">About Us</a></li>
                    <li class="mb-2"><a href="contact.jsp" class="text-decoration-none text-muted">Contact</a></li>
                    <li class="mb-2"><a href="faq.jsp" class="text-decoration-none text-muted">FAQ</a></li>
                    <li class="mb-2"><a href="privacy.jsp" class="text-decoration-none text-muted">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-md-3 mb-4 mb-md-0">
                <h6 class="mb-3">For Photographers</h6>
                <ul class="list-unstyled mb-0">
                    <li class="mb-2"><a href="register.jsp?type=photographer" class="text-decoration-none text-muted">Join as Photographer</a></li>
                    <li class="mb-2"><a href="how-it-works.jsp" class="text-decoration-none text-muted">How It Works</a></li>
                    <li class="mb-2"><a href="resources.jsp" class="text-decoration-none text-muted">Resources</a></li>
                    <li class="mb-2"><a href="pricing.jsp" class="text-decoration-none text-muted">Pricing</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h6 class="mb-3">Connect With Us</h6>
                <div class="d-flex gap-3 mb-3">
                    <a href="#" class="text-muted text-decoration-none">
                        <i class="bi bi-facebook fs-5"></i>
                    </a>
                    <a href="#" class="text-muted text-decoration-none">
                        <i class="bi bi-instagram fs-5"></i>
                    </a>
                    <a href="#" class="text-muted text-decoration-none">
                        <i class="bi bi-twitter fs-5"></i>
                    </a>
                    <a href="#" class="text-muted text-decoration-none">
                        <i class="bi bi-linkedin fs-5"></i>
                    </a>
                </div>
                <p class="mb-1"><i class="bi bi-envelope-fill me-2"></i>support@photoservice.com</p>
                <p class="mb-0"><i class="bi bi-telephone-fill me-2"></i>(123) 456-7890</p>
            </div>
        </div>
        <hr class="my-4">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                <p class="mb-0 text-muted">&copy; <%= java.time.Year.now().getValue() %> Photography Service. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <img src="images/payment-methods.png" alt="Payment Methods" height="24" class="payment-methods">
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
