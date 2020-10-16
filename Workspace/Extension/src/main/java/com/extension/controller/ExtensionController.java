package com.extension.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.extension.service.ExtensionService;

@Controller
public class ExtensionController {	
	@Autowired
	ExtensionService service;
	
	@GetMapping("/extension")
	public String form() {
		return "extensionForm";
	}
	
	@PostMapping("/fileUpload")
	public ModelAndView fileUpload(MultipartHttpServletRequest request) {
		ModelAndView mav = new ModelAndView("extensionPro");
		int index = service.fileAdd(request);
		mav.addObject("index", index);
		return mav;
	}
}
