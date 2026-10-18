<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.gestion.medicaments.Medicament" %>
            <% @SuppressWarnings("unchecked") List<Medicament> medicaments = (List<Medicament>)
                    request.getAttribute("medicaments");
                    String message = (String) request.getAttribute("message");
                    %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Liste des Médicaments</title>
                        <style>
                            * {
                                margin: 0;
                                padding: 0;
                                box-sizing: border-box;
                            }

                            body {
                                font-family: Arial, sans-serif;
                                padding: 20px;
                                background-color: #f9f9f9;
                            }

                            .container {
                                max-width: 1200px;
                                margin: 0 auto;
                                background: white;
                                padding: 20px;
                                border-radius: 8px;
                                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                            }

                            h1 {
                                color: #333;
                                margin-bottom: 20px;
                                text-align: center;
                            }

                            /* Navigation */
                            nav {
                                margin: 20px 0;
                                text-align: center;
                            }

                            nav a {
                                display: inline-block;
                                padding: 10px 20px;
                                margin: 5px;
                                background: #4CAF50;
                                color: white;
                                text-decoration: none;
                                border-radius: 5px;
                                font-weight: bold;
                            }

                            nav a:hover {
                                background: #45a049;
                            }

                            /* Table Styles */
                            table {
                                width: 100%;
                                border-collapse: collapse;
                                margin-top: 20px;
                            }

                            table,
                            th,
                            td {
                                border: 1px solid #ddd;
                                padding: 12px;
                                text-align: left;
                            }

                            th {
                                background-color: #f2f2f2;
                                color: #333;
                                font-weight: bold;
                            }

                            tr:nth-child(even) {
                                background-color: #f9f9f9;
                            }

                            tr:hover {
                                background-color: #f1f1f1;
                            }

                            /* Buttons */
                            .btn {
                                padding: 6px 12px;
                                color: white;
                                text-decoration: none;
                                border-radius: 4px;
                                border: none;
                                cursor: pointer;
                                font-size: 14px;
                                margin-right: 5px;
                            }

                            .edit {
                                background-color: #007bff;
                                color: white;
                            }

                            .delete {
                                background-color: #dc3545;
                            }

                            .btn:hover {
                                opacity: 0.9;
                            }

                            /* Messages */
                            .alert {
                                padding: 15px;
                                margin: 10px 0;
                                border-radius: 4px;
                                text-align: center;
                            }

                            .success {
                                background-color: #d4edda;
                                color: #155724;
                                border: 1px solid #c3e6cb;
                            }

                            .empty {
                                text-align: center;
                                padding: 40px;
                                color: #666;
                                font-style: italic;
                            }

                            /* Badges */
                            .quantity-badge {
                                display: inline-block;
                                padding: 4px 10px;
                                background-color: #e9ecef;
                                color: #495057;
                                border-radius: 12px;
                                font-weight: bold;
                                font-size: 0.9em;
                            }
                        </style>
                    </head>

                    <body>
                        <div class="container">
                            <h1>📋 Liste des Médicaments</h1>

                            <nav>
                                <a href="index.jsp">Accueil</a>
                                <a href="medicament?action=ajouter">➕ Ajouter un médicament</a>
                                <a href="medicament?action=liste">📋 Liste</a>
                            </nav>

                            <%-- Search Form --%>
                                <div style="margin: 20px 0; text-align: center;">
                                    <form action="medicament" method="get" style="display: inline-block;">
                                        <input type="hidden" name="action" value="liste">
                                        <input type="text" name="search" placeholder="Rechercher par libellé..."
                                            value="<%= request.getAttribute(" search") !=null ?
                                            request.getAttribute("search") : "" %>"
                                        style="padding: 8px; width: 300px; border-radius: 4px; border: 1px solid #ddd;">
                                        <button type="submit" class="btn" style="background-color: #17a2b8;">🔍
                                            Rechercher</button>
                                        <% if (request.getAttribute("search") !=null) { %>
                                            <a href="medicament?action=liste" class="btn"
                                                style="background-color: #6c757d;">✖️ Effacer</a>
                                            <% } %>
                                    </form>
                                </div>

                                <% if (message !=null && !message.isEmpty()) { %>
                                    <div class="alert success">
                                        <%= message %>
                                    </div>
                                    <% } %>

                                        <% String error=(String) request.getAttribute("error"); if (error !=null &&
                                            !error.isEmpty()) { %>
                                            <div class="alert error"
                                                style="background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb;">
                                                <%= error %>
                                            </div>
                                            <% } %>
                                                <% if (medicaments !=null && !medicaments.isEmpty()) { %>
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Libellé</th>
                                                                <th>Prix (DH)</th>
                                                                <th>Quantité</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% for (Medicament m : medicaments) { %>
                                                                <tr>
                                                                    <td>
                                                                        <%= m.getId() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= m.getLibelle() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= String.format("%.2f", m.getPrix()) %> DH
                                                                    </td>
                                                                    <td>
                                                                        <span class="quantity-badge">
                                                                            <%= m.getQuantite() %>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <a href="medicament?action=modifier&id=<%= m.getId() %>"
                                                                            class="btn edit">✏️ Modifier</a>
                                                                        <a href="medicament?action=supprimer&id=<%= m.getId() %>"
                                                                            class="btn delete"
                                                                            onclick="return confirm('Voulez-vous vraiment supprimer ce médicament ?')">🗑️
                                                                            Supprimer</a>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                    </table>

                                                    <div style="margin-top: 20px; text-align: right; color: #666;">
                                                        <strong>Total : <%= medicaments.size() %> médicament(s)</strong>
                                                    </div>

                                                    <% } else { %>
                                                        <div class="empty">
                                                            <h3>Aucun médicament trouvé</h3>
                                                            <p>Commencez par ajouter des médicaments à votre stock.</p>
                                                            <div style="margin-top: 20px;">
                                                                <a href="medicament?action=ajouter" class="btn"
                                                                    style="background-color: #007bff; padding: 10px 20px;">Ajouter
                                                                    maintenant</a>
                                                            </div>
                                                        </div>
                                                        <% } %>
                        </div>
                    </body>

                    </html>