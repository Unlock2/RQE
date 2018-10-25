package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.DataSheetDao;
import com.wavem.first.synthesisData.service.DataSheetService;

@Service("DataSheetService")
public class DataSheetServiceImpl implements DataSheetService {
	private static final Logger logger = LoggerFactory.getLogger(DataSheetServiceImpl.class);
	
	@Autowired
	private DataSheetDao dataSheetDao;

	public List<Map<String, Object>> getDataSheetList(Map<String, Object> input) {
		return (List<Map<String, Object>>) dataSheetDao.getDataSheetList(input);
	}

	public Map<String, Object> getDetailDataSheet(Map<String, Object> input) {
		return dataSheetDao.getDetailDataSheet(input);
	}

//	public List<Map<String, Object>> getDownloadFile(Map<String, Object> input) {
//		System.out.println("getDownLoadFile의 값 ::: >>>>>>" + dataSheetDao.getDownloadFile(input));
//		return (List<Map<String, Object>>) dataSheetDao.getDownloadFile(input);
//	}

	
}
