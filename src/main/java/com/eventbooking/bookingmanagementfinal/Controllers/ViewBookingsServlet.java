package com.eventbooking.bookingmanagementfinal.Controllers;

import com.eventbooking.bookingmanagementfinal.Model.Booking;
import com.eventbooking.bookingmanagementfinal.Model.BookingManagement;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;//
import java.util.Queue;

@WebServlet("/viewBookings")
public class ViewBookingsServlet extends HttpServlet {
    private BookingManagement bookingManagement;

    @Override
    public void init() {
        bookingManagement = new BookingManagement(getServletContext());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Queue<Booking> bookings = bookingManagement.getAllBookings();
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
