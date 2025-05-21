package com.payments.paymentfinal.Controller;

import com.payments.paymentfinal.Model.Payment;
import com.payments.paymentfinal.Model.PaymentRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentMethod = request.getParameter("paymentMethod");
        if ("card".equals(paymentMethod)) {
            response.sendRedirect("index.jsp");
            return;
        } else if ("cod".equals(paymentMethod)) {
            response.sendRedirect("COD_Confirmation.jsp");
            return;
        }

        // Handle card payment
        String name = request.getParameter("name");
        String card = request.getParameter("cardNumber");
        String amount = request.getParameter("amount");

        Payment payment = new Payment(name, card, amount);
        PaymentRepository repository = new PaymentRepository();
        repository.savePayment(payment);

        HttpSession session = request.getSession();
        session.setAttribute("lastPayment", payment);

        request.getRequestDispatcher("/invoice.jsp").forward(request, response);
    }
}