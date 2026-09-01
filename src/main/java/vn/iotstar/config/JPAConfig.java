package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("unit-jpa");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}