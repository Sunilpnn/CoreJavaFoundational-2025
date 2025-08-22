<%@ page import="java.util.*, model.Food" %>

<%
List<Food> foods = (List<Food>) application.getAttribute("foods");

int total = 0; // variable to hold total price

if (foods != null) {
    for (Food f : foods) {
        // Print each food
        out.println(f.getName() + " : ₹" + f.getPrice() + "<br>");

        // Add price to total
        total += f.getPrice();
    }
}

// Print total at the end
out.println("<hr>");
out.println("<b>Total Bill: ₹" + total + "</b>");
%>
