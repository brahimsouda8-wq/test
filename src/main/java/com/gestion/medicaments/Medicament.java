package com.gestion.medicaments;

import jakarta.persistence.*;

@Entity
@Table(name = "medicaments")
public class Medicament {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "libelle", nullable = false)
    private String libelle;

    @Column(name = "prix", nullable = false)
    private double prix;

    @Column(name = "quantite", nullable = false)
    private int quantite;

    public Medicament() {
    }

    public Medicament(int id, String libelle, double prix, int quantite) {
        this.id = id;
        this.libelle = libelle;
        this.prix = prix;
        this.quantite = quantite;
    }

    public Medicament(String libelle, double prix, int quantite) {
        this.libelle = libelle;
        this.prix = prix;
        this.quantite = quantite;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    @Override
    public String toString() {
        return "Medicament [id=" + id + ", libelle=" + libelle + ", prix=" + prix + ", quantite=" + quantite + "]";
    }
}