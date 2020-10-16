package com.extension.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.extension.model.ExtensionDto;
import com.extension.model.FileDto;

@Repository
public class ExtensionDao {
	@Autowired
	private SqlSession session;
	
	public void extensionAdd(ExtensionDto dto) {
		session.insert("extension.extensionAdd", dto);
	}
	
	public void extensionDelete(String name) {
		session.delete("extension.extensionDelete", name);
	}
	
	public List<ExtensionDto> extensionSelect() {
		return session.selectList("extension.extensionSelect");
	}
	
	public int customCount() {
		return session.selectOne("extension.customCount");
	}
	
	public int fileAdd(FileDto dto) {
		return session.insert("extension.fileAdd", dto);
	}
}
