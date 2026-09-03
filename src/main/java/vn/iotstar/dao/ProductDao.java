package vn.iotstar.dao;

import vn.iotstar.entity.Product;
import java.util.List;

public interface ProductDao {
    List<Product> findAll();
    Product findById(int id);
    void insert(Product product);
    void update(Product product);
    void delete(int id);
    List<Product> findTop10Newest();
    List<Product> findAllPaginated(int offset, int limit);
    int countAll();
}