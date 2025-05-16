<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Film" %>
<%
    // Buat daftar film dan simpan ke session
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film(
        "The Matrix", "Action", 120, 40000, Arrays.asList("10:00", "13:00", "18:00"),
        "img/matrix.jpg"
    ));
    daftarFilm.add(new Film(
        "Frozen II", "Animation", 90, 35000, Arrays.asList("11:00", "14:30", "19:00"),
        "img/frozen.jpg"
    ));
    daftarFilm.add(new Film(
        "Avengers", "Superhero", 150, 45000, Arrays.asList("12:00", "16:00", "20:00"),
        "img/avengers.jpg"
    ));

    session.setAttribute("films", daftarFilm);
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Daftar Film Bioskop</title>
    <style>
        /* Reset */
        * {
            box-sizing: border-box;
            margin: 0; padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #121212;
            color: #f1f1f1;
            padding: 30px;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2.4rem;
            color: #e50914;
            text-shadow: 0 0 5px #e50914;
        }

        .film-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
            max-width: 1100px;
            margin: 0 auto 40px auto;
        }

        .film-card {
            background: #1f1f1f;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.7);
            overflow: hidden;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .film-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(229, 9, 20, 0.8);
        }

        .poster {
            width: 100%;
            height: 360px;
            object-fit: cover;
        }

        .film-info {
            padding: 15px 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .film-title {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 8px;
            color: #e50914;
        }

        .film-meta {
            font-size: 0.9rem;
            color: #ccc;
            margin-bottom: 15px;
        }

        .film-meta span {
            display: inline-block;
            margin-right: 12px;
        }

        .showtimes {
            font-size: 0.85rem;
            color: #bbb;
            margin-bottom: 12px;
        }

        .btn-pesan {
            align-self: center;
            background-color: #e50914;
            color: #fff;
            border: none;
            border-radius: 25px;
            padding: 12px 28px;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
            box-shadow: 0 0 8px #e50914;
        }

        .btn-pesan:hover {
            background-color: #b00610;
            box-shadow: 0 0 15px #b00610;
        }

        /* Responsive */
        @media screen and (max-width: 600px) {
            body {
                padding: 15px;
            }
            .film-card {
                height: auto;
            }
            .poster {
                height: 280px;
            }
        }
    </style>
</head>
<body>
    <h2>Daftar Film Bioskop</h2>

    <div class="film-grid">
        <% for (Film f : daftarFilm) { %>
        <div class="film-card">
            <img class="poster" src="<%= f.getPosterUrl() %>" alt="Poster <%= f.getJudul() %>">
            <div class="film-info">
                <div>
                    <div class="film-title"><%= f.getJudul() %></div>
                    <div class="film-meta">
                        <span>Genre: <%= f.getGenre() %></span>
                        <span>Durasi: <%= f.getDurasi() %> menit</span>
                        <span>Harga: Rp<%= f.getHarga() %></span>
                    </div>
                    <div class="showtimes">
                        Jam Tayang: <%= String.join(", ", f.getJamTayang()) %>
                    </div>
                </div>
                <a href="formPesan.jsp" class="btn-pesan">Pesan Tiket</a>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
