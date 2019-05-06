package com.qst.service;

import com.qst.bean.Admin;
import com.qst.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public Admin getAdminUser(Admin arg) {
        Admin admin = adminDao.getAdminUser(arg);
        if (admin != null) {
            return admin;
        }
        return null;
    }

    public List<Admin> getAllAdminByPage(Admin page){
        return adminDao.getAllAdminByPage(page);
    }

    public int deleteDoctor(String id){
        return adminDao.deleteDoctor(id);
    }

    public int addDoctor(Admin admin){
        return adminDao.addAdmin(admin);
    }

    public List<Admin> getAllDoctor(){
        return adminDao.getAllDoctor();
    }

    public int select(String phone){
        List<Admin> res = adminDao.select(phone);
        System.out.println(res.size());
        return res.size();
    }
}
