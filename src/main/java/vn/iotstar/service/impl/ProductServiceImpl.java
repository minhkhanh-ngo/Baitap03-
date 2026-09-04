package vn.iotstar.service.impl;

import vn.iotstar.dao.ProductDao;
import vn.iotstar.dao.impl.ProductDaoImpl;
import vn.iotstar.entity.Product;
import vn.iotstar.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public Product findById(int id) {
        return productDao.findById(id);
    }

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public List<Product> findTop10Newest() {
        return productDao.findTop10Newest();
    }

    @Override
    public List<Product> findAllPaginated(int offset, int limit) {
        return productDao.findAllPaginated(offset, limit);
    }

    @Override
    public int countAll() {
        return productDao.countAll();
    }

    @Override
    public List<Product> searchFilterAndSort(String keyword, Integer categoryId, String sort, int index, int pageSize) {
        return productDao.searchFilterAndSort(keyword, categoryId, sort, index, pageSize);
    }

    @Override
    public int countSearchFilter(String keyword, Integer categoryId) {
        return productDao.countSearchFilter(keyword, categoryId);
    }
}