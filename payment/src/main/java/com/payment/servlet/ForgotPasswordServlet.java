package com.payment.servlet;

import com.payment.dao.UserDAO;
import com.payment.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPhone().equals(phone)) {
            // Generate a temporary password
            String tempPassword = UUID.randomUUID().toString().substring(0, 8);
            user.setPassword(tempPassword);
            userDAO.updateUser(user);

            // In a real application, you would send this via email/SMS
            // For this example, we'll just show it on the page
            request.setAttribute("message", "Your temporary password is: " + tempPassword + 
                               "\nPlease login and change your password immediately.");
        } else {
            request.setAttribute("error", "No account found with the provided email and phone number");
        }

        request.getRequestDispatcher("/forgot-password.jsp").forward(request, response);
    }
}
