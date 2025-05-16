<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Film" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Struk Pemesanan Tiket</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #111;
        color: #eee;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }
    .struk {
        background-color: #222;
        border-radius: 10px;
        padding: 30px;
        width: 400px;
        box-shadow: 0 0 15px 2px #f00;
        text-align: center;
    }
    .struk h2 {
        color: #f00;
        margin-bottom: 20px;
        text-shadow: 0 0 8px #f00;
    }
    .detail-row {
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
        font-weight: 600;
    }
    .detail-row span.label {
        color: #f00;
    }
    .detail-row span.value {
        font-weight: normal;
        color: #eee;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        color: #f00;
        font-weight: 700;
        text-decoration: none;
        text-shadow: 0 0 5px #f00;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<%
    String nama = request.getParameter("nama");
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    int index = Integer.parseInt(request.getParameter("filmIndex"));

    List<Film> filmObjects = (List<Film>) session.getAttribute("films");
    Film selectedFilm = filmObjects.get(index);
    int total = selectedFilm.getHarga() * jumlah;
%>

<div class="struk">
    <h2>Struk Pemesanan Tiket</h2>
    <div class="detail-row">
        <span class="label">Nama Pemesan:</span>
        <span class="value"><%= nama %></span>
    </div>
    <div class="detail-row">
        <span class="label">Film yang Dipilih:</span>
        <span class="value"><%= selectedFilm.getJudul() %></span>
    </div>
    <div class="detail-row">
        <span class="label">Jam Tayang:</span>
        <span class="value"><%= jam %></span>
    </div>
    <div class="detail-row">
        <span class="label">Jumlah Tiket:</span>
        <span class="value"><%= jumlah %></span>
    </div>
    <div class="detail-row">
        <span class="label">Harga per Tiket:</span>
        <span class="value">Rp<%= selectedFilm.getHarga() %></span>
    </div>
    <div class="detail-row">
        <span class="label">Total Harga:</span>
        <span class="value">Rp<%= total %></span>
    </div>

    <a href="index.jsp">⬅️ Kembali ke Halaman Utama</a>
</div>
</body>
</html>
