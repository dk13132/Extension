package com.extension.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FileDto {
	int file_no;
	String file_name;
	String file_path;
	long filesize;
	String stored_file_name;
}
