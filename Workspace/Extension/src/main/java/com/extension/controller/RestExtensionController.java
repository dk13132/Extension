package com.extension.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.extension.model.ExtensionDto;
import com.extension.service.ExtensionService;

@RestController
public class RestExtensionController {
	@Autowired
	private ExtensionService service;

	@PostMapping("/extensionAdd/{name}/{type}")
	public String extensionInsert(ExtensionDto dto) {
		return service.extensionAdd(dto);
	}
	
	@PostMapping("/extensionDelete/{name}")
	public String extensionDelete(ExtensionDto dto) {
		return service.extensionDelete(dto);
	}
	
	@PostMapping("/extensionSelect")
	public List<ExtensionDto> extensionSelect() {
		return service.extensionSelect();
	}
	
	@PostMapping("/count")
	public int customCount() {
		return service.customCount();
	}
}
