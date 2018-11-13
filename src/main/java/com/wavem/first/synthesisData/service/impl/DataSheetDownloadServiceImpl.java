package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.DataSheetDownloadDao;
import com.wavem.first.synthesisData.service.DataSheetDownloadService;

@Service("DataSheetDownloadService")
public class DataSheetDownloadServiceImpl implements DataSheetDownloadService {
	private static final Logger logger = LoggerFactory.getLogger(DataSheetDownloadServiceImpl.class);
	
	@Autowired
	private DataSheetDownloadDao dataSheetDownloadDao;
	
	
	public List<Map<String, Object>> downloadDataSheet(Map<String, Object> input) {
		return dataSheetDownloadDao.downloadDataSheet(input);
	}
}
