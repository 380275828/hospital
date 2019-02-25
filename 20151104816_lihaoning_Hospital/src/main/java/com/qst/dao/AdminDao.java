package com.qst.dao;

import com.qst.bean.Admin;

import java.util.List;

public interface AdminDao {

    Admin getAdminUser(Admin admin);

    List<Admin> getAllAdminByPage(Admin page);

    int deleteDoctor(String id);

    int addAdmin(Admin admin);

    List<Admin> getAllDoctor();
}
