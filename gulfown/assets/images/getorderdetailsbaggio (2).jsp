<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baggio?zeroDateTimeBehavior=convertToNull", "root", "");
        Statement stmt = con.createStatement();
        Statement stmt1 = con.createStatement();
        String query = "SELECT * FROM `order`";
        ResultSet rset = stmt.executeQuery(query);
        JsonArray jarr = new JsonArray();
        System.out.println(rset);

        while (rset.next()) {
            JsonObject j = new JsonObject();
            String id = rset.getString("id");
            String username = rset.getString("username");
            String amount = rset.getString("amount");

            String paymentmethod = rset.getString("paymentmethod");
            String date = rset.getString("date");

            j.addProperty("id", id);
            j.addProperty("username", username);

            j.addProperty("amount", amount);
            j.addProperty("paymentmethod", paymentmethod);
            j.addProperty("date", date);

            JsonArray producArray = new JsonArray();

            query = "SELECT * FROM `order_details` where orderid=" + id + "";
            ResultSet rset1 = stmt1.executeQuery(query);
            while (rset1.next()) {
                JsonObject j1 = new JsonObject();
                j1.addProperty("id", rset1.getString("id"));
                j1.addProperty("orderid", rset1.getString("orderid"));

                j1.addProperty("productid", rset1.getString("productid"));
                j1.addProperty("quantity", rset1.getString("quantity"));

                producArray.add(j1);

            }
            j.add("products", producArray);
            jarr.add(j);
        }
        System.out.println("Array=" + jarr);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        response.getWriter().write(jarr.toString());

    } catch (Exception e) {
        e.printStackTrace();
    }


%>
