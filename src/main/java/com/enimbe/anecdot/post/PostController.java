package com.enimbe.anecdot.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/anecdot/post")
public class PostController {

	@GetMapping("/create")
	public String create() {
		return "post/create";
	}
	
	@GetMapping("/home")
	public String home() {
		return "post/home";
	}
}

