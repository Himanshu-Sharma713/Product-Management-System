<%@page import="com.product.Product"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Confirmation</title>
  <style>
    .confirmation-container {
      max-width: 600px;
      margin: 80px auto;
      padding: 40px;
      background: cyan;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      text-align: center;
      font-family: 'Segoe UI', sans-serif;
    }

    .confirmation-container h2 {
      color: #2e7d32;
      margin-bottom: 10px;
    }

    .confirmation-container p {
      color: #555;
      font-size: 16px;
    }

    .btn-group {
      margin-top: 25px;
    }

    .btn {
      padding: 10px 20px;
      font-size: 15px;
      margin: 0 8px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.3s ease;
    }

    .btn-home {
      background-color: #4CAF50;
      color: white;
    }

    .btn-home:hover {
      background-color: #388e3c;
    }

    .btn-back {
      background-color: #e0e0e0;
      color: #333;
    }

    .btn-back:hover {
      background-color: #ccc;
    }
  </style>
</head>
<body onload='makeActive("edit")'>
<jsp:useBean id="service" class="com.product.ProductService" scope="application" />
<%
  service.updateProductRecord(request); 
%>
  <div class="confirmation-container">
    <h2>&#x2705; Product Updated Successfully</h2>
    <p>Product record  with ID <strong><%= request.getParameter("pid") %></strong> has been updated in the database.</p>
    <div class="btn-group">
      <button class="btn btn-home" onclick="location.href='index.jsp'">Home</button>
      <button class="btn btn-back" onclick="history.back()">Back</button>
    </div>
  </div>
</body>
</html>
