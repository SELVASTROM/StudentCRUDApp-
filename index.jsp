<%@ page import="java.sql.*" %>
<%@ page import="com.example.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student CRUD</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <style>
    :root {
      --glass: rgba(255, 255, 255, 0.1);
      --backdrop: blur(10px);
      --color-light: #fff;
      --color-dark: #121212;
      --accent: #00bcd4;
    }

    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(-45deg, #1a2a6c, #b21f1f, #fdbb2d, #00bcd4);
      background-size: 400% 400%;
      animation: gradientBG 15s ease infinite;
      color: var(--color-light);
      transition: background 0.3s, color 0.3s;
    }

    body.dark-theme {
      background: #121212;
      color: #e0e0e0;
    }

    body.dark-theme .container {
      background: rgba(255, 255, 255, 0.05);
    }

    body.dark-theme input,
    body.dark-theme select,
    body.dark-theme .student,
    body.dark-theme .glass-btn {
      background: rgba(255, 255, 255, 0.15);
      color: #fff;
    }

    .container {
      max-width: 900px;
      margin: 40px auto;
      background: var(--glass);
      padding: 20px;
      border-radius: 20px;
      backdrop-filter: var(--backdrop);
      box-shadow: 0 4px 20px rgba(0,0,0,0.4);
    }

    input, button, select {
      padding: 10px;
      margin: 5px 0;
      border: none;
      border-radius: 10px;
      outline: none;
    }

    input[type="submit"], button {
      background: rgba(255,255,255,0.2);
      color: white;
      cursor: pointer;
      transition: background 0.3s;
    }

    input[type="submit"]:hover, button:hover {
      background: rgba(255,255,255,0.3);
    }

    .glass-btn {
      border: 1px solid rgba(255,255,255,0.3);
      background: rgba(255,255,255,0.1);
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
    }

    .search-sort {
      display: flex;
      justify-content: space-between;
      gap: 10px;
      margin-bottom: 20px;
    }

    .student {
      background: rgba(255,255,255,0.05);
      padding: 10px;
      border-radius: 10px;
      margin: 5px 0;
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
    }

    a {
      color: #00ffe0;
      text-decoration: none;
      margin: 0 5px;
    }

    a:hover {
      text-decoration: underline;
    }

    @keyframes gradientBG {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }
  </style>
</head>
<body>
<div class="container">
  <button onclick="toggleTheme()" class="glass-btn">Toggle Theme</button>
  <h2>Add Student</h2>
  <form method="post" action="AddStudentServlet" onsubmit="showToast('Student added')">
    <input type="text" name="name" placeholder="Name" required><br>
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="text" name="phone" placeholder="Phone" required><br>
    <input type="submit" value="Add Student" class="glass-btn">
  </form>

  <hr>

  <div class="search-sort">
    <input type="text" id="searchBox" placeholder="Search by name..." onkeyup="filterStudents()">
    <select id="sortBy" onchange="sortStudents()">
      <option value="name">Sort by Name</option>
      <option value="email">Sort by Email</option>
    </select>
  </div>

  <div class="student-list" id="studentList">
    <% try (Connection conn = DBUtil.getConnection(); Statement stmt = conn.createStatement()) {
        ResultSet rs = stmt.executeQuery("SELECT * FROM students");
        while (rs.next()) {
          int id = rs.getInt("id");
          String name = rs.getString("name");
          String email = rs.getString("email");
          String phone = rs.getString("phone");
          String editId = request.getParameter("editId");
          if (editId != null && editId.equals(String.valueOf(id))) {
    %>
    <form method="post" action="UpdateStudentServlet">
      <input type="hidden" name="id" value="<%= id %>">
      <input type="text" name="name" value="<%= name %>" required>
      <input type="email" name="email" value="<%= email %>" required>
      <input type="text" name="phone" value="<%= phone %>" required>
      <input type="submit" value="Update">
      <a href="index.jsp" class="btn">Cancel</a>
    </form>
    <% } else { %>
    <div class="student">
      <div><strong><%= name %></strong> | <%= email %> | <%= phone %></div>
      <div>
        <a href="index.jsp?editId=<%= id %>">Edit</a>
        <a href="DeleteStudentServlet?id=<%= id %>" onclick="return confirm('Are you sure?')">Delete</a>
      </div>
    </div>
    <% } } } catch (Exception e) {
      out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } %>
  </div>
</div>

<div class="toast" id="toast" style="position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%); background: rgba(0,0,0,0.7); color: white; padding: 10px 20px; border-radius: 10px; display: none;">Toast</div>

<script>
function showToast(msg) {
  const toast = document.getElementById("toast");
  toast.textContent = msg;
  toast.style.display = "block";
  setTimeout(() => toast.style.display = "none", 3000);
}

function toggleTheme() {
  document.body.classList.toggle("dark-theme");
}

function filterStudents() {
  const input = document.getElementById('searchBox').value.toLowerCase();
  const list = document.querySelectorAll('.student');
  list.forEach(p => {
    const text = p.textContent.toLowerCase();
    p.style.display = text.includes(input) ? '' : 'none';
  });
}

function sortStudents() {
  const list = document.getElementById('studentList');
  const students = Array.from(list.children).filter(e => e.classList.contains('student'));
  const sortBy = document.getElementById('sortBy').value;
  students.sort((a, b) => {
    const valA = a.textContent.toLowerCase();
    const valB = b.textContent.toLowerCase();
    if (sortBy === 'name') return valA.localeCompare(valB);
    else return valA.split('|')[1].localeCompare(valB.split('|')[1]);
  });
  students.forEach(s => list.appendChild(s));
}
</script>
</body>
</html>
