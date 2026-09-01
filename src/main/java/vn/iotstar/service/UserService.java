package vn.iotstar.service;

import vn.iotstar.entity.User;

public interface UserService {
    User login(String username, String password);
    User get(String username);
    User getByEmail(String email);
    boolean register(String username, String password, String email, String fullname, String phone);
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    boolean registerWithOtp(String username, String password, String email, String fullname, String phone, String otp);
    boolean activateUser(String username);
    public boolean updateOtpByEmail(String email, String otp);
    public boolean resetPasswordByEmail(String email, String newPassword);
}