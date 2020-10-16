package com.file.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.extension.model.FileDto;

@Component
public class FileUtils {
	
	public FileDto insertFileInfo(MultipartFile multipartFile) throws Exception {
		String filePath = "D:\\item\\";
		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String storedFileName = getRandomString() + originalFileExtension;
		
		File file = new File(filePath + storedFileName);
		multipartFile.transferTo(file);
		FileDto dto = new FileDto();
		dto.setFile_name(originalFileName);
		dto.setFile_path(file.getPath());
		dto.setFilesize(multipartFile.getSize());
		dto.setStored_file_name(storedFileName);
		return dto;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
