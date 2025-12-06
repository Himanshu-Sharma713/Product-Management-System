<%@page import="com.product.Product"%>
<%@page import="java.util.List"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Table</title>
  <style>
    table {
      border-collapse: collapse;
      margin: auto;
      width: 80%;
      background-color: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      margin-top: 20px;
    }

    th, td {
      padding: 14px 20px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background: linear-gradient(to bottom, #1abc9c, #16a085);
      color: white;
      cursor: pointer;
      user-select: none;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    tr:nth-child(even) td {
      background-color: #f9f9f9;
    }
  </style>
</head>
<body onload='makeActive("list")'>
  <jsp:useBean id="service" class="com.product.ProductService" scope="application" />

  <table id="productTable">
    <thead>
      <tr>
        <th onclick="sortTable(0)">Product Id</th>
        <th onclick="sortTable(1)">Product Name</th>
        <th onclick="sortTable(2)">Product Brand</th>
        <th onclick="sortTable(3)">Product Price</th>
      </tr>
    </thead>
    <tbody>
      
      <%
      List<Product> plist=service.getProductList();
      
      for(Product product:plist)
      { %>
         <tr>
            <td><%=product.getPid()%></td>
            <td><%=product.getName()%></td>
            <td><%=product.getBrand()%></td>
            <td><%=product.getPrice()%></td>
         </tr>
      <%}%>
    </tbody>
  </table>

  <script>
    function sortTable(columnIndex) {
      const table = document.getElementById("productTable");
      const tbody = table.tBodies[0];
      const rows = Array.from(tbody.rows);

      const isNumeric = !isNaN(rows[0].cells[columnIndex].textContent.trim());

      const sortedRows = rows.sort((a, b) => {
        const aText = a.cells[columnIndex].textContent.trim();
        const bText = b.cells[columnIndex].textContent.trim();

        return isNumeric
          ? parseFloat(aText) - parseFloat(bText)
          : aText.localeCompare(bText);
      });

      // Re-append rows in sorted order
      sortedRows.forEach(row => tbody.appendChild(row));
    }
  </script>
</body>
</html>
