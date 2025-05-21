package com.example.event_booking_project_90.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.event_booking_project_90.model.Review;
import com.example.event_booking_project_90.util.FileHandler;

import java.io.*;
import java.util.List;


@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        FileHandler.initializeDirectory();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String selectedProfile = request.getParameter("selectedProfile");

        if (action != null && action.equals("delete")) {
            handleDelete(request);
        } else if (action != null && action.equals("edit")) {
            handleEdit(request);
        } else {
            // Normal review submission
            String username = request.getParameter("username");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            Review review = new Review(username, selectedProfile, rating, comment);
            FileHandler.saveReviewToFile(review);
        }

        // Reload reviews
        List<Review> reviews = FileHandler.loadReviewsFromFile(selectedProfile);
        request.setAttribute("reviews", reviews);
        request.setAttribute("selectedProfile", selectedProfile);
        request.getRequestDispatcher("past_reviews.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String selectedProfile = request.getParameter("selectedProfile");
        String redirectPage = request.getParameter("redirect");

        if (selectedProfile != null) {
            List<Review> reviews = FileHandler.loadReviewsFromFile(selectedProfile);
            request.setAttribute("reviews", reviews);
            request.setAttribute("selectedProfile", selectedProfile);
        }

        if (redirectPage != null) {
            request.getRequestDispatcher(redirectPage).forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void handleDelete(HttpServletRequest request) throws IOException {
        String selectedProfile = request.getParameter("selectedProfile");
        String username = request.getParameter("username");
        String comment = request.getParameter("comment");

        List<Review> reviews = FileHandler.loadReviewsFromFile(selectedProfile);
        reviews.removeIf(r -> r.getUsername().equals(username) && r.getComment().equals(comment));
        FileHandler.overwriteReviewFile(selectedProfile, reviews);
    }

    private void handleEdit(HttpServletRequest request) throws IOException {
        String selectedProfile = request.getParameter("selectedProfile");
        String originalUsername = request.getParameter("originalUsername");
        String originalComment = request.getParameter("originalComment");

        String updatedUsername = request.getParameter("username");
        int updatedRating = Integer.parseInt(request.getParameter("rating"));
        String updatedComment = request.getParameter("comment");

        List<Review> reviews = FileHandler.loadReviewsFromFile(selectedProfile);

        for (int i = 0; i < reviews.size(); i++) {
            Review r = reviews.get(i);
            if (r.getUsername().equals(originalUsername) && r.getComment().equals(originalComment)) {
                reviews.set(i, new Review(updatedUsername, selectedProfile, updatedRating, updatedComment));
                break;
            }
        }

        FileHandler.overwriteReviewFile(selectedProfile, reviews);
    }

    public static List<Review> loadReviewsFromFile(String profileName) throws IOException {
        return FileHandler.loadReviewsFromFile(profileName);
    }
}