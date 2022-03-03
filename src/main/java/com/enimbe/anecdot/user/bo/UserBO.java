package com.enimbe.anecdot.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enimbe.anecdot.common.EncryptUtils;
import com.enimbe.anecdot.user.dao.UserDAO;
import com.enimbe.anecdot.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int signUp(String userID, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			return 0;
		}
		
		return userDAO.insertUser(userID, encryptPassword, name, email);
	}
	
	public boolean isDuplicateId(String userID) {
		
		if(userDAO.selectCountById(userID) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User signIn(String userID, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserByIdPassword(userID, encryptPassword);
	}
	
}
