package com.enimbe.anecdot.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId,
			@Param("title") String title,
			@Param("content") String content);
	
	public int insertImage(
			@Param("userId") int userId,
			@Param("postId") int postId,
			@Param("imagePath") String imagePath);
}