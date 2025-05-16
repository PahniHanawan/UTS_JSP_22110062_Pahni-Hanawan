<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Film" %>

<%
    List<Film> films = (List<Film>) session.getAttribute("films");
    if (films == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Form Pemesanan Tiket</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #121212;
            color: #eee;
            padding: 30px;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            color: #e50914;
            margin-bottom: 30px;
            font-size: 2.2rem;
            text-shadow: 0 0 6px #e50914;
        }

        form {
            max-width: 450px;
            background: #1f1f1f;
            margin: 0 auto;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(229, 9, 20, 0.7);
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 8px;
            font-weight: 600;
            color: #ccc;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px 15px;
            border-radius: 8px;
            border: none;
            background: #333;
            color: #eee;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="number"]:focus, select:focus {
            outline: none;
            background-color: #444;
        }

        button {
            margin-top: 30px;
            width: 100%;
            background-color: #e50914;
            border: none;
            padding: 15px;
            font-size: 1.1rem;
            color: white;
            font-weight: 700;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 0 15px #e50914;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #b00610;
            box-shadow: 0 0 20px #b00610;
        }

        a.back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #e50914;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        a.back-link:hover {
            color: #ff2a3c;
            text-decoration: underline;
        }

        @media screen and (max-width: 500px) {
            body {
                padding: 15px;
            }
            form {
                padding: 20px;
            }
        }
    </style>

    <script>
        const jadwal = [
            <% for (int i = 0; i < films.size(); i++) {
                out.print("[");
                List<String> jamList = films.get(i).getJamTayang();
                for (int j = 0; j < jamList.size(); j++) {
                    out.print("\"" + jamList.get(j) + "\"");
                    if (j < jamList.size() - 1) out.print(", ");
                }
                out.print("]");
                if (i < films.size() - 1) out.print(", ");
            } %>
        ];

        function updateJam() {
            const filmIndex = document.getElementById("filmIndex").value;
            const jamDropdown = document.getElementById("jam");

            jamDropdown.innerHTML = "";

            jadwal[filmIndex].forEach(function(jam) {
                const opt = document.createElement("option");
                opt.value = jam;
                opt.innerHTML = jam;
                jamDropdown.appendChild(opt);
            });
        }

        window.onload = updateJam;
    </script>
</head>
<body>
    <h2>Form Pemesanan Tiket Bioskop</h2>
    <form action="struk.jsp" method="post" autocomplete="off">
        <label for="nama">Nama Pemesan:</label>
        <input type="text" id="nama" name="nama" placeholder="Masukkan nama lengkap" required>

        <label for="jumlah">Jumlah Tiket:</label>
        <input type="number" id="jumlah" name="jumlah" min="1" placeholder="Jumlah tiket" required>

        <label for="filmIndex">Pilih Film:</label>
        <select name="filmIndex" id="filmIndex" onchange="updateJam()">
            <% for (int i = 0; i < films.size(); i++) { %>
                <option value="<%= i %>"><%= films.get(i).getJudul() %></option>
            <% } %>
        </select>

        <label for="jam">Pilih Jam Tayang:</label>
        <select name="jam" id="jam" required></select>

        <button type="submit">Pesan Tiket</button>
    </form>

    <a href="index.jsp" class="back-link">⬅️ Kembali ke Halaman Utama</a>
</body>
</html>
