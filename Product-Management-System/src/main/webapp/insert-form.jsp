<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Insert Product | Product Management</title>
  <link href="CSS/menu.css" rel="stylesheet">
  <link href="CSS/form.css" rel="stylesheet"> <!-- External form styling -->
</head>
<body onload="makeActive('insert')">
  <div class="form-container">
    <h2>Insert New Product</h2>
    <form action="save-record.jsp" method="post">
      <div class="form-group">
        <label for="pid">Product ID</label>
        <input type="text" id="pid" name="pid" required>
      </div>
      <div class="form-group">
        <label for="name">Product Name</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="brand">Product Brand</label>
        <input type="text" id="brand" name="brand" required>
      </div>
      <div class="form-group">
        <label for="price">Product Price</label>
        <input type="text" id="price" name="price" required>
      </div>
      <div class="form-actions">
        <button type="submit">Save Record</button>
      </div>
    </form>
  </div>
</body>
</html>
