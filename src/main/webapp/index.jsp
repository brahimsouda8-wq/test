<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Gestion des Médicaments</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                padding: 20px;
            }

            h1 {
                color: #333;
                margin-bottom: 20px;
            }

            nav {
                margin: 20px 0;
            }

            nav a {
                display: inline-block;
                padding: 10px 20px;
                margin: 5px;
                background: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            nav a:hover {
                background: #45a049;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table,
            th,
            td {
                border: 1px solid #ddd;
                padding: 10px;
            }

            th {
                background: #f2f2f2;
            }

            .form-group {
                margin: 15px 0;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
            }

            button {
                padding: 10px 20px;
                background: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background: #45a049;
            }

            .alert {
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
            }

            .success {
                background: #d4edda;
                color: #155724;
            }

            .error {
                background: #f8d7da;
                color: #721c24;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>🏥 Gestion des Médicaments</h1>

            <nav>
                <a href="index.jsp">Accueil</a>
                <a href="medicament?action=ajouter">➕ Ajouter</a>
                <a href="medicament?action=liste">📋 Liste</a>
            </nav>

            <h2>Bienvenue dans le système de gestion des médicaments</h2>
            <p>Sélectionnez une option dans le menu ci-dessus pour commencer.</p>
        </div>
    </body>

    </html>