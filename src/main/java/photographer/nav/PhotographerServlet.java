package photographer.nav;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
//c
@WebServlet(name = "PhotographerServlet", urlPatterns = {
        "/listPhotographers",
        "/addPhotographer",
        "/editPhotographer",
        "/updatePhotographer",
        "/deletePhotographer",
        "/sortPhotographers"
})
public class PhotographerServlet extends HttpServlet {
    private PhotographerManager photographerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        photographerDAO = new PhotographerManager();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/addPhotographer":
                    showAddForm(request, response);
                    break;
                case "/editPhotographer":
                    showEditForm(request, response);
                    break;
                case "/deletePhotographer":
                    deletePhotographer(request, response);
                    break;
                case "/sortPhotographers":
                    sortPhotographers(request, response);
                    break;
                default:
                    listPhotographers(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/addPhotographer":
                    addPhotographer(request, response);
                    break;
                case "/updatePhotographer":
                    updatePhotographer(request, response);
                    break;
                default:
                    listPhotographers(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listPhotographers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Photographer> photographers = photographerDAO.getAllPhotographers();
        request.setAttribute("photographers", photographers);
        request.getRequestDispatcher("list-photographers.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("add-photographer.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Photographer photographer = photographerDAO.getPhotographerById(id);
        request.setAttribute("photographer", photographer);
        request.getRequestDispatcher("edit-photographer.jsp").forward(request, response);
    }

    private void addPhotographer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            Photographer photographer = new Photographer();
            photographer.setId(photographerDAO.generateNewId());
            photographer.setName(request.getParameter("name"));
            photographer.setSpecialty(request.getParameter("specialty"));
            photographer.setEmail(request.getParameter("email"));
            photographer.setPhone(request.getParameter("phone"));
            photographer.setRating(Double.parseDouble(request.getParameter("rating")));
            photographer.setHourlyRate(Double.parseDouble(request.getParameter("hourlyRate")));
            photographer.setExperience(request.getParameter("experience"));

            photographerDAO.addPhotographer(photographer);
            response.sendRedirect("listPhotographers");
        } catch (Exception e) {
            request.setAttribute("error", "Error adding photographer: " + e.getMessage());
            request.getRequestDispatcher("add-photographer.jsp").forward(request, response);
        }
    }

    private void updatePhotographer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            Photographer photographer = new Photographer();
            photographer.setId(Integer.parseInt(request.getParameter("id")));
            photographer.setName(request.getParameter("name"));
            photographer.setSpecialty(request.getParameter("specialty"));
            photographer.setEmail(request.getParameter("email"));
            photographer.setPhone(request.getParameter("phone"));
            photographer.setRating(Double.parseDouble(request.getParameter("rating")));
            photographer.setHourlyRate(Double.parseDouble(request.getParameter("hourlyRate")));
            photographer.setExperience(request.getParameter("experience"));

            photographerDAO.updatePhotographer(photographer);
            response.sendRedirect("listPhotographers");
        } catch (Exception e) {
            request.setAttribute("error", "Error updating photographer: " + e.getMessage());
            request.getRequestDispatcher("edit-photographer.jsp").forward(request, response);
        }
    }

    private void deletePhotographer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            photographerDAO.deletePhotographer(id);
            response.sendRedirect("listPhotographers");
        } catch (Exception e) {
            request.setAttribute("error", "Error deleting photographer: " + e.getMessage());
            request.getRequestDispatcher("list-photographers.jsp").forward(request, response);
        }
    }

    private void sortPhotographers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Photographer> sortedPhotographers = photographerDAO.sortPhotographersByRating();
            request.setAttribute("photographers", sortedPhotographers);
            request.setAttribute("sorted", true);
            request.getRequestDispatcher("list-photographers.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error sorting photographers: " + e.getMessage());
            request.getRequestDispatcher("list-photographers.jsp").forward(request, response);
        }
    }
}