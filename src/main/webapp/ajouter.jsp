<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Ajouter un Médicament</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #34495e;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            button {
                width: 100%;
                padding: 12px;
                background-color: #2ecc71;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                margin-top: 10px;
            }

            button:hover {
                background-color: #27ae60;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }

            .back-link:hover {
                text-decoration: underline;
            }

            .message {
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 20px;
                text-align: center;
            }

            .success {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }

            .error {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>Ajouter un Médicament</h1>

            <%-- Affichage des messages --%>
                <% String message=(String) request.getAttribute("message"); String typeMessage=(String)
                    request.getAttribute("typeMessage"); if (message !=null && !message.isEmpty()) { %>
                    <div class="message <%= typeMessage != null ? typeMessage : "" %>">
                        <%= message %>
                    </div>
                    <% } %>

                        <form action="medicament" method="post">
                            <input type="hidden" name="action" value="ajouter">

                            <div class="form-group">
                                <label for="libelle">Libellé *</label>
                                <input type="text" id="libelle" name="libelle" required
                                    placeholder="Ex: Paracetamol 500mg">
                            </div>

                            <div class="form-group">
                                <label for="prix">Prix (DH) *</label>
                                <input type="number" id="prix" name="prix" step="0.01" min="0.01" required
                                    placeholder="Ex: 5.50">
                            </div>

                            <div class="form-group">
                                <label for="quantite">Quantité en stock *</label>
                                <input type="number" id="quantite" name="quantite" min="0" required
                                    placeholder="Ex: 100">
                            </div>

                            <button type="submit">Ajouter le Médicament</button>
                        </form>

                        <a href="medicament?action=liste" class="back-link">← Retour à la liste</a>
        </div>
    </body>

    </html>