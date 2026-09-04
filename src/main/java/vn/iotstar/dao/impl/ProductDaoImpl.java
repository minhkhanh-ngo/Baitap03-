package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.config.JPAConfig;
import vn.iotstar.dao.ProductDao;
import vn.iotstar.entity.Product;

import java.util.List;

public class ProductDaoImpl implements ProductDao {

    @Override
    public List<Product> findAll() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM Product p ORDER BY p.productId DESC", Product.class).getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Product findById(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(Product product) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Product product) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(product);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int id) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Product product = em.find(Product.class, id);
            if (product != null) {
                em.remove(product);
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findTop10Newest() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p ORDER BY p.productId DESC", Product.class);
            query.setMaxResults(10);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> findAllPaginated(int offset, int limit) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p ORDER BY p.productId DESC", Product.class);
            query.setFirstResult(offset);
            query.setMaxResults(limit);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public int countAll() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Long count = em.createQuery("SELECT COUNT(p) FROM Product p", Long.class).getSingleResult();
            return count.intValue();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Product> searchFilterAndSort(String keyword, Integer categoryId, String sort, int index, int pageSize) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT p FROM Product p WHERE 1=1 ");

            if (keyword != null && !keyword.trim().isEmpty()) {
                jpql.append("AND p.productName LIKE :keyword ");
            }
            if (categoryId != null) {
                jpql.append("AND p.category.categoryid = :categoryId ");
            }

            if ("priceAsc".equals(sort)) {
                jpql.append("ORDER BY p.price ASC ");
            } else if ("priceDesc".equals(sort)) {
                jpql.append("ORDER BY p.price DESC ");
            } else {
                jpql.append("ORDER BY p.productId DESC ");
            }

            TypedQuery<Product> query = em.createQuery(jpql.toString(), Product.class);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.setParameter("keyword", "%" + keyword.trim() + "%");
            }
            if (categoryId != null) {
                query.setParameter("categoryId", categoryId);
            }

            query.setFirstResult((index - 1) * pageSize);
            query.setMaxResults(pageSize);

            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public int countSearchFilter(String keyword, Integer categoryId) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT COUNT(p) FROM Product p WHERE 1=1 ");

            if (keyword != null && !keyword.trim().isEmpty()) {
                jpql.append("AND p.productName LIKE :keyword ");
            }
            if (categoryId != null) {
                jpql.append("AND p.category.categoryid = :categoryId ");
            }

            TypedQuery<Long> query = em.createQuery(jpql.toString(), Long.class);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.setParameter("keyword", "%" + keyword.trim() + "%");
            }
            if (categoryId != null) {
                query.setParameter("categoryId", categoryId);
            }

            return query.getSingleResult().intValue();
        } finally {
            em.close();
        }
    }
}