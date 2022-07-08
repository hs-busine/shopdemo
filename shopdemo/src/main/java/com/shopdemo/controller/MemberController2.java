package com.shopdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Log4j
@Controller
public class MemberController2 {

	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join_ok")
	public void join_ok() {
		
	}
}
