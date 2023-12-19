package com.tjoeun.ilsan.common.file.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.ilsan.common.file.dao.CommonFileDao;

@Service
@EnableTransactionManagement
public class CommonFileServiceImpl implements CommonFileService{

	@Autowired
	CommonFileDao commonFileDao;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Override
	@Transactional(
			readOnly=false
			,propagation = Propagation.MANDATORY
			,rollbackFor = {Exception.class}
			)
	public void upload(MultipartFile mFile) {
		File newFile = new File(fileUploadPath + file.getOriginalFilename());
		file.transferTo(newFile);
	
	}
}
