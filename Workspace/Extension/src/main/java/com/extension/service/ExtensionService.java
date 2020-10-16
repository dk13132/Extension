package com.extension.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.extension.model.ExtensionDto;
import com.extension.model.FileDto;
import com.file.util.FileUtils;

@Service
public class ExtensionService {
	@Autowired
	private FileUtils util;
	@Autowired
	private ExtensionDao dao;

	private String[] fixing = { "bat", "cmd", "com", "cpl", "exe", "scr", "js" };

	public String extensionAdd(ExtensionDto dto) {
		int err = 0;
		if (dto.getType() == 'C') {
			for (int i = 0; i < fixing.length; i++) {
				if (dto.getName().equals(fixing[i])) {
					err = 1;
					break;
				}
			}

			List<ExtensionDto> list = dao.extensionSelect();

			if (err == 0) {
				for (int i = 0; i < list.size(); i++) {
					if (dto.getName().equals(list.get(i).getName())) {
						err = 2;
						break;
					}
				}
			}

			if (err == 1) {
				return "fixingErr";
			} else if (err == 2) {
				return "err";
			} else {
				dao.extensionAdd(dto);
				return "addSuccess";
			}
		}

		dao.extensionAdd(dto);
		return "success";
	}

	public String extensionDelete(ExtensionDto dto) {
		String name = dto.getName();
		dao.extensionDelete(name);
		return "success";
	}

	public List<ExtensionDto> extensionSelect() {
		return dao.extensionSelect();
	}

	public int customCount() {
		return dao.customCount();
	}

	public int fileAdd(MultipartHttpServletRequest request) {
		MultipartFile multipartFile = request.getFile("file");
		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		List<ExtensionDto> list = dao.extensionSelect();
		int err = 0;

		for (int i = 0; i < list.size(); i++) {
			if (originalFileExtension.equals("."+list.get(i).getName())) {
				err = 1;
				break;
			}
		}
		if (err == 0) {
			try {
				FileDto dto = util.insertFileInfo(multipartFile);
				return dao.fileAdd(dto);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		} 
		
		return 2;
	}
}
