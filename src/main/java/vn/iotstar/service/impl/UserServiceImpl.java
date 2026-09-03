package vn.iotstar.service.impl;

import java.util.Date;
import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.service.UserService;

public class UserServiceImpl implements UserService {

    private final UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }

    @Override
    public boolean registerWithOtp(String username, String password, String email, String fullname, String phone, String otp) {
        if (checkExistUsername(username) || checkExistEmail(email)) {
            return false;
        }

        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setFullName(fullname);
        user.setPhone(phone);
        user.setAvatar("default-avatar.png");
        user.setRoleid(5);
        user.setCreatedDate(new Date());
        user.setEnable(false);
        user.setOtp(otp);

        try {
            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean activateUser(String username) {
        try {
            User user = userDao.get(username);
            if (user != null) {
                user.setEnable(true);
                user.setOtp(null);
                userDao.update(user);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateOtpByEmail(String email, String otp) {
        User user = userDao.getByEmail(email);
        if (user != null) {
            user.setOtp(otp);
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public boolean resetPasswordByEmail(String email, String newPassword) {
        User user = userDao.getByEmail(email);
        if (user != null) {
            user.setPassword(newPassword);
            user.setOtp(null);
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public User getByEmail(String email) {
        return userDao.getByEmail(email);
    }
}