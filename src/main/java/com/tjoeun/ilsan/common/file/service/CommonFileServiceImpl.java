package com.tjoeun.ilsan.common.file.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	public void upload(Map map, MultipartFile mFile) throws Exception {
		String o_filename = mFile.getOriginalFilename();
		String n_filename = UUID.randomUUID().toString()+"-"+o_filename;
		File newFile = new File(fileUploadPath+n_filename);
		try {
			mFile.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
		map.put("o_filename",o_filename);
		map.put("n_filename",n_filename);
		map.put("f_seq", map.get("seq"));
		int result = commonFileDao.insert(map);
		if(1 != result) {
			throw new Exception();
		}
	}

	@Override
	public List<Map> getFileList(Map map) {		
		return commonFileDao.select(map);
	}
	
}
