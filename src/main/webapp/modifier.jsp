<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@ page import="com.gestion.medicaments.Medicament" %>
        <% Medicament medicament=(Medicament) request.getAttribute("medicament"); String message=(String)
            request.getAttribute("message"); String error=(String) request.getAttribute("error"); %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Modifier le Médicament</title>
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
                        background-color: #ffc107;
                        color: #000;
                        border: none;
                        border-radius: 5px;
                        font-size: 18px;
                        cursor: pointer;
                        margin-top: 10px;
                    }

                    button:hover {
                        background-color: #e0a800;
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
                    <h1>Modifier le Médicament</h1>

                    <%-- Affichage des messages d'erreur --%>
                        <% if (error !=null && !error.isEmpty()) { %>
                            <div class="message error">
                                <%= error %>
                            </div>
                            <% } %>

                                <% if (medicament !=null) { %>
                                    <form action="medicament" method="post">
                                        <input type="hidden" name="action" value="modifier">
                                        <input type="hidden" name="id" value="<%= medicament.getId() %>">

                                        <div class="form-group">
                                            <label for="libelle">Libellé *</label>
                                            <input type="text" id="libelle" name="libelle" required
                                                value="<%= medicament.getLibelle() %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="prix">Prix (DH) *</label>
                                            <input type="number" id="prix" name="prix" step="0.01" min="0.01" required
                                                value="<%= medicament.getPrix() %>">
                                        </div>

                                        <div class="form-group">
                                            <label for="quantite">Quantité en stock *</label>
                                            <input type="number" id="quantite" name="quantite" min="0" required
                                                value="<%= medicament.getQuantite() %>">
                                        </div>

                                        <button type="submit">Enregistrer les modifications</button>
                                    </form>
                                    <% } else { %>
                                        <div class="message error">
                                            Médicament introuvable.
                                        </div>
                                        <% } %>

                                            <a href="medicament?action=liste" class="back-link">← Retour à la liste</a>
                </div>
            </body>

            </html>