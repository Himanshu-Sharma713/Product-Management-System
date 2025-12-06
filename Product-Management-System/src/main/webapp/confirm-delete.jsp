<%@page import="com.product.Product"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Confirm Delete</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
   
    .confirm-box {
      width: 500px;
      margin: auto;
      margin-top: 50px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .confirm-header {
      background: linear-gradient(to right, #d32f2f, #f44336);
      color: white;
      font-size: 22px;
      text-align: center;
      padding: 8px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 12px 20px;
      text-align: left;
    }

    tr:nth-child(even) {
      background-color: #fafafa;
    }

    .actions {
      text-align: right;
      padding: 20px;
    }

    .btn {
      padding: 10px 18px;
      font-size: 15px;
      border: none;
      border-radius: 6px;
      margin-left: 10px;
      cursor: pointer;
      transition: 0.3s;
    }

    .btn-yes {
      background-color: #d32f2f;
      color: white;
    }

    .btn-yes:hover {
      background-color: #b71c1c;
    }

    .btn-no {
      background-color: #e0e0e0;
      color: #333;
    }

    .btn-no:hover {
      background-color: #ccc;
    }
  </style>
</head>
<body onload='makeActive("delete")'>
<jsp:useBean id="service" class="com.product.ProductService" scope="application" />
<%
  int pid = Integer.parseInt(request.getParameter("pid"));
  Product product=service.getProductRecord(pid);
  if (product!=null) {
%>
  <%@ include file="menu.jsp" %>
  <form action="delete-record.jsp" method="get">
    <div class="confirm-box">
      <div class="confirm-header">
        <i class="fas fa-trash-alt"></i> Confirm Deletion
      </div>
      <table>
        <tr>
          <th>Product ID</th>
          <td><%=pid %><input type="hidden" value="<%=pid%>" name="pid"></td>
        </tr>
        <tr>
          <th>Product Name</th>
          <td><%= product.getName() %></td>
        </tr>
        <tr>
          <th>Product Brand</th>
          <td><%= product.getBrand() %></td>
        </tr>
        <tr>
          <th>Product Price</th>
          <td>&#8377;<%= product.getPrice() %></td>
        </tr>
      </table>
      <div class="actions">
        <span>Are you sure you want to delete?</span>
        <button type="submit" class="btn btn-yes">Yes</button>
        <input type="button" class="btn btn-no" onclick="history.back()" value="No">
      </div>
    </div>
  </form>
<%
  } else {
%>
  <jsp:include page="delete-form.jsp" />
  <div style="width:500px; margin:auto; text-align:center; color:red; font-weight:bold; padding-top:20px;">
    ❌ Product record with ID <%= pid %> not found.
  </div>
<%
  }
%>
</body>
</html>
