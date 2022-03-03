package com.enimbe.anecdot.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.enimbe.anecdot.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("userID") String userID,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	public int selectCountById(@Param("userID") String userID);
	
	public User selectUserByIdPassword(
			@Param("userID") String userID,
			@Param("password") String password);
}
