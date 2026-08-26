package vn.iotstar.service.impl;

import java.util.List;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
    public CategoryDao cateDao = new CategoryDaoImpl();

    @Override
    public void insert(Category category) {
        try {
            Category cate = cateDao.findByCategoryname(category.getCategoryname());
            if (cate == null) {
                cateDao.insert(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int count() {
        return cateDao.count();
    }

    @Override
    public List<Category> findAll(int page, int pagesize) {
        return cateDao.findAll(page, pagesize);
    }

    @Override
    public List<Category> searchByName(String catname) {
        return cateDao.searchByName(catname);
    }

    @Override
    public List<Category> findAll() {
        return cateDao.findAll();
    }

    @Override
    public Category findById(int cateid) {
        return cateDao.findById(cateid);
    }

    @Override
    public void delete(int cateid) throws Exception {
        cateDao.delete(cateid);
    }

    @Override
    public void update(Category category) {
        Category cate = cateDao.findById(category.getCategoryid());
        if (cate != null) {
            cateDao.update(category);
        }
    }

    @Override
    public Category findByCategoryname(String name) {
        try {
            return cateDao.findByCategoryname(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}