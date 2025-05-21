<div id="eventModal" style="display:none;">
    <form action="AddEventServlet" method="post">
        <label>Title:</label><input type="text" name="title" required/><br/>
        <label>Date:</label><input type="date" name="date" required/><br/>
        <label>Location:</label><input type="text" name="location" required/><br/>
        <label>Description:</label><textarea name="description"></textarea><br/>
        <input type="hidden" name="userId" value="1"/><!-- Example userId -->
        <button type="submit">Save</button>
        <button type="button" onclick="closeModal()">Cancel</button>
    </form>
</div>
