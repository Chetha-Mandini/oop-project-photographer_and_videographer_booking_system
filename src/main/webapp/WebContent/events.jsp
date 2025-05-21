<%@ page import="java.util.*,model.PhotographyEvent,util.EventFileHandler" %>
<html>
<head>
    <title>Photography Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .add-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .no-events {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
    </style>
    <script>
        function openModal() {
            document.getElementById('eventModal').style.display = 'block';
        }
        function closeModal() {
            document.getElementById('eventModal').style.display = 'none';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Photography Events Management</h1>
        <button class="add-btn" onclick="openModal()">Add Event</button>
        <jsp:include page="fragments/eventModal.jsp" />
        
        <% 
            List<PhotographyEvent> events = EventFileHandler.readEvents();
            if (events != null && !events.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
                <% for (PhotographyEvent event : events) { %>
                <tr>
                    <td><%= event.getTitle() %></td>
                    <td><%= event.getDate() %></td>
                    <td><%= event.getLocation() %></td>
                    <td><%= event.getDescription() %></td>
                    <td>
                        <form action="EditEventServlet" method="post" style="display:inline;">
                            <input type="hidden" name="eventId" value="<%= event.getId() %>"/>
                            <button type="submit">Edit</button>
                        </form>
                        <form action="DeleteEventServlet" method="post" style="display:inline;">
                            <input type="hidden" name="eventId" value="<%= event.getId() %>"/>
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } else { %>
            <div class="no-events">
                <p>No photography events found. Click "Add Event" to create a new event.</p>
            </div>
        <% } %>
    </div>
</body>
</html>