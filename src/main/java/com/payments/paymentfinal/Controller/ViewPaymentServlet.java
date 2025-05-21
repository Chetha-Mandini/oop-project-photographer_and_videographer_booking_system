package com.payments.paymentfinal.Controller;

import com.payments.paymentfinal.Model.Payment;
import com.payments.paymentfinal.Model.PaymentRepository;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.*;
import java.util.List;

@WebServlet("/viewPayments")
public class ViewPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>All Payments</title>");
        out.println("<style>");
        out.println("body {");
        out.println("    font-family: Arial, sans-serif;");
        out.println("    background: black;");
        out.println("    display: flex;");
        out.println("    justify-content: center;");
        out.println("    align-items: center;");
        out.println("    min-height: 100vh;");
        out.println("    margin: 0;");
        out.println("    padding: 20px;");
        out.println("}");
        out.println(".container {");
        out.println("    background: white;");
        out.println("    padding: 30px;");
        out.println("    border-radius: 10px;");
        out.println("    box-shadow: 0 0 15px rgba(0,0,0,0.2);");
        out.println("    max-width: 800px;");
        out.println("    width: 90%;");
        out.println("}");
        out.println("h1 {");
        out.println("    color: #333;");
        out.println("    margin-bottom: 20px;");
        out.println("    text-align: center;");
        out.println("}");
        out.println("table {");
        out.println("    width: 100%;");
        out.println("    border-collapse: collapse;");
        out.println("    margin-top: 20px;");
        out.println("}");
        out.println("th, td {");
        out.println("    padding: 12px;");
        out.println("    text-align: left;");
        out.println("    border-bottom: 1px solid #ddd;");
        out.println("}");
        out.println("th {");
        out.println("    background-color: #f2f2f2;");
        out.println("    color: #333;");
        out.println("}");
        out.println("tr:hover {");
        out.println("    background-color: #f5f5f5;");
        out.println("}");
        out.println("button {");
        out.println("    background-color: #ff4444;");
        out.println("    color: white;");
        out.println("    border: none;");
        out.println("    padding: 8px 12px;");
        out.println("    border-radius: 5px;");
        out.println("    cursor: pointer;");
        out.println("}");
        out.println("button:hover {");
        out.println("    background-color: #cc0000;");
        out.println("}");
        out.println(".update-button {");
        out.println("    background-color: #4CAF50;");
        out.println("    margin-right: 10px;");
        out.println("}");
        out.println(".update-button:hover {");
        out.println("    background-color: #45a049;");
        out.println("}");
        out.println("form {");
        out.println("    margin-bottom: 20px;");
        out.println("}");
        out.println("label {");
        out.println("    display: block;");
        out.println("    margin-bottom: 5px;");
        out.println("    color: #333;");
        out.println("}");
        out.println("input[type='text'], input[type='number'] {");
        out.println("    width: 100%;");
        out.println("    padding: 8px;");
        out.println("    margin-bottom: 10px;");
        out.println("    border: 1px solid #ddd;");
        out.println("    border-radius: 5px;");
        out.println("}");
        out.println("input[type='submit'] {");
        out.println("    background-color: #4CAF50;");
        out.println("    color: white;");
        out.println("    padding: 10px 20px;");
        out.println("    border: none;");
        out.println("    border-radius: 5px;");
        out.println("    cursor: pointer;");
        out.println("}");
        out.println("input[type='submit']:hover {");
        out.println("    background-color: #45a049;");
        out.println("}");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");

        String updateIndexStr = request.getParameter("updateIndex");
        if (updateIndexStr != null) {
            try {
                int updateIndex = Integer.parseInt(updateIndexStr);
                PaymentRepository repository = new PaymentRepository();
                List<Payment> payments = repository.getAllPayments();

                if (updateIndex >= 0 && updateIndex < payments.size()) {
                    Payment payment = payments.get(updateIndex);
                    out.println("<h1>Update Payment</h1>");
                    out.println("<form action='viewPayments' method='post'>");
                    out.println("<input type='hidden' name='updateIndex' value='" + updateIndex + "'>");
                    out.println("<label for='name'>Name:</label>");
                    out.println("<input type='text' id='name' name='name' value='" + payment.getName() + "' required>");
                    out.println("<label for='cardNumber'>Card Number:</label>");
                    out.println("<input type='text' id='cardNumber' name='cardNumber' value='" + payment.getMaskedCardNumber() + "' required>");
                    out.println("<label for='amount'>Amount:</label>");
                    out.println("<input type='number' id='amount' name='amount' step='0.01' value='" + (payment.getAmount() != null ? payment.getAmount() : "") + "' required>");
                    out.println("<input type='submit' value='Update Payment'>");
                    out.println("</form>");
                    out.println("<a href='viewPayments'>Back to Payments</a>");
                } else {
                    out.println("<h1>Error</h1>");
                    out.println("<p>Invalid payment index.</p>");
                    out.println("<a href='viewPayments'>Back to Payments</a>");
                }
            } catch (NumberFormatException e) {
                out.println("<h1>Error</h1>");
                out.println("<p>Invalid payment index.</p>");
                out.println("<a href='viewPayments'>Back to Payments</a>");
            }
        } else {
            out.println("<h1>All Payments</h1>");
            out.println("<table>");
            out.println("<tr><th>Name</th><th>Card</th><th>Amount</th><th>Action</th></tr>");

            PaymentRepository repository = new PaymentRepository();
            List<Payment> payments = repository.getAllPayments();

            if (payments.isEmpty()) {
                out.println("<tr><td colspan='4'>No payment records found.</td></tr>");
            } else {
                for (int i = 0; i < payments.size(); i++) {
                    Payment payment = payments.get(i);
                    out.println("<tr>");
                    out.println("<td>" + payment.getName() + "</td>");
                    out.println("<td>" + payment.getMaskedCardNumber() + "</td>");
                    out.println("<td>" + (payment.getAmount() != null ? payment.getAmount() : "null") + "</td>");
                    out.println("<td>");
                    out.println("<a href='viewPayments?updateIndex=" + i + "'><button class='update-button'>Update</button></a>");
                    out.println("<form action='viewPayments' method='post' style='display: inline; margin: 0;'>");
                    out.println("<input type='hidden' name='deleteIndex' value='" + i + "'>");
                    out.println("<button type='submit' onclick='return confirm(\"Are you sure you want to delete this payment?\");'>Delete</button>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            }

            out.println("</table>");
        }

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String deleteIndexStr = request.getParameter("deleteIndex");
        String updateIndexStr = request.getParameter("updateIndex");

        if (deleteIndexStr != null) {
            try {
                int deleteIndex = Integer.parseInt(deleteIndexStr);
                PaymentRepository repository = new PaymentRepository();
                List<Payment> payments = repository.getAllPayments();

                if (deleteIndex >= 0 && deleteIndex < payments.size()) {
                    payments.remove(deleteIndex);
                    repository.rewritePayments(payments);
                }
            } catch (NumberFormatException e) {
                // Invalid index, do nothing
            }
        } else if (updateIndexStr != null) {
            try {
                int updateIndex = Integer.parseInt(updateIndexStr);
                PaymentRepository repository = new PaymentRepository();
                List<Payment> payments = repository.getAllPayments();

                if (updateIndex >= 0 && updateIndex < payments.size()) {
                    String name = request.getParameter("name");
                    String cardNumber = request.getParameter("cardNumber");
                    String amount = request.getParameter("amount");

                    Payment updatedPayment = new Payment(name, cardNumber, amount);
                    payments.set(updateIndex, updatedPayment);
                    repository.rewritePayments(payments);
                }
            } catch (NumberFormatException e) {
                // Invalid index, do nothing
            }
        }

        response.sendRedirect("viewPayments");
    }
}