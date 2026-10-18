package com.gestion.medicaments.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.gestion.medicaments.Medicament;
import com.gestion.medicaments.dao.MedicamentDao;

@WebServlet("/medicament")
public class MedicamentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MedicamentDao medicamentDao;

    @Override
    public void init() throws ServletException {
        medicamentDao = new MedicamentDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            listMedicaments(request, response);
            return;
        }

        switch (action) {
            case "ajouter":
                request.getRequestDispatcher("/ajouter.jsp").forward(request, response);
                break;

            case "liste":
                listMedicaments(request, response);
                break;

            case "modifier":
                showEditForm(request, response);
                break;

            case "supprimer":
                deleteMedicament(request, response);
                break;

            default:
                listMedicaments(request, response);
                break;
        }
    }

    private void listMedicaments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        try {
            List<Medicament> listMedicaments;
            if (search != null && !search.trim().isEmpty()) {
                listMedicaments = medicamentDao.search(search);
                request.setAttribute("search", search);
            } else {
                listMedicaments = medicamentDao.getAll();
            }
            request.setAttribute("medicaments", listMedicaments);
        } catch (Exception e) {
            request.setAttribute("error", "Erreur lors du chargement: " + e.getMessage());
            e.printStackTrace();
        }
        request.getRequestDispatcher("/liste.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                Medicament existingMedicament = medicamentDao.getById(id);
                if (existingMedicament != null) {
                    request.setAttribute("medicament", existingMedicament);
                    request.getRequestDispatcher("/modifier.jsp").forward(request, response);
                } else {
                    response.sendRedirect("medicament");
                }
            } catch (Exception e) {
                response.sendRedirect("medicament");
            }
        } else {
            response.sendRedirect("medicament");
        }
    }

    private void deleteMedicament(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                medicamentDao.delete(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("medicament");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            addMedicament(request, response);
        } else if ("modifier".equals(action)) {
            updateMedicament(request, response);
        }
    }

    private void addMedicament(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String libelle = request.getParameter("libelle");
        String prixStr = request.getParameter("prix");
        String quantiteStr = request.getParameter("quantite");

        String error = "";

        // Validation
        if (libelle == null || libelle.trim().isEmpty()) {
            error = "Le libellé est obligatoire";
        }

        try {
            double prix = Double.parseDouble(prixStr);
            int quantite = Integer.parseInt(quantiteStr);

            if (prix <= 0) {
                error = "Le prix doit être positif";
            }
            if (quantite < 0) {
                error = "La quantité ne peut pas être négative";
            }

            if (error.isEmpty()) {
                Medicament newMedicament = new Medicament(libelle, prix, quantite);
                medicamentDao.save(newMedicament);
                response.sendRedirect("medicament");
                return;
            }

        } catch (NumberFormatException e) {
            error = "Veuillez entrer des valeurs numériques valides";
        } catch (Exception e) {
            error = "Erreur lors de l'ajout: " + e.getMessage();
            e.printStackTrace();
        }

        // En cas d'erreur
        request.setAttribute("error", error);
        request.setAttribute("libelle", libelle);
        request.setAttribute("prix", prixStr);
        request.setAttribute("quantite", quantiteStr);
        request.getRequestDispatcher("/ajouter.jsp").forward(request, response);
    }

    private void updateMedicament(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String libelle = request.getParameter("libelle");
        String prixStr = request.getParameter("prix");
        String quantiteStr = request.getParameter("quantite");

        String error = "";

        if (libelle == null || libelle.trim().isEmpty()) {
            error = "Le libellé est obligatoire";
        }

        try {
            int id = Integer.parseInt(idStr);
            double prix = Double.parseDouble(prixStr);
            int quantite = Integer.parseInt(quantiteStr);

            if (prix <= 0) {
                error = "Le prix doit être positif";
            }
            if (quantite < 0) {
                error = "La quantité ne peut pas être négative";
            }

            if (error.isEmpty()) {
                Medicament medicament = new Medicament(id, libelle, prix, quantite);
                medicamentDao.update(medicament);
                response.sendRedirect("medicament");
                return;
            }

        } catch (NumberFormatException e) {
            error = "Veuillez entrer des valeurs valides";
        } catch (Exception e) {
            error = "Erreur lors de la modification: " + e.getMessage();
            e.printStackTrace();
        }

        // En cas d'erreur, retourner au formulaire
        request.setAttribute("error", error);
        try {
            int id = Integer.parseInt(idStr);
            double prix = Double.parseDouble(prixStr);
            int quantite = Integer.parseInt(quantiteStr);
            Medicament medicament = new Medicament(id, libelle, prix, quantite);
            request.setAttribute("medicament", medicament);
        } catch (Exception e) {
            // Ignorer
        }
        request.getRequestDispatcher("/modifier.jsp").forward(request, response);
    }
}