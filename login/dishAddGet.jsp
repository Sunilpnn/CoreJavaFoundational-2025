<%@ page import = "java.util.*" %>
<%@ page import = "model.Food" %>
<%

String name = request.getParameter("dishname");
int price = Integer.parseInt(request.getParameter("price"));

 List<Food> list_Food = (List<Food>) application.getAttribute("foods");

if(list_Food == null){

    list_Food = new ArrayList<Food>(); 
}
Food food = new Food();
food.setName(name);
food.setPrice(price);

list_Food.add(food);

application.setAttribute("foods", list_Food);

response.sendRedirect("welcom.jsp");

%>