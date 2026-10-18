package com.gestion.medicaments.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gestion.medicaments.Medicament;
import com.gestion.medicaments.util.HibernateUtil;

public class MedicamentDao {

    public void save(Medicament medicament) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(medicament);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void update(Medicament medicament) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.merge(medicament);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Medicament medicament = session.get(Medicament.class, id);
            if (medicament != null) {
                session.remove(medicament);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Medicament getById(int id) {
        Transaction transaction = null;
        Medicament medicament = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            medicament = session.get(Medicament.class, id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return medicament;
    }

    public List<Medicament> getAll() {
        Transaction transaction = null;
        List<Medicament> medicaments = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            medicaments = session.createQuery("from Medicament", Medicament.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return medicaments;
    }

    public List<Medicament> search(String keyword) {
        Transaction transaction = null;
        List<Medicament> medicaments = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            medicaments = session.createQuery("from Medicament where lower(libelle) like :keyword", Medicament.class)
                    .setParameter("keyword", "%" + keyword.toLowerCase() + "%")
                    .list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return medicaments;
    }
}
