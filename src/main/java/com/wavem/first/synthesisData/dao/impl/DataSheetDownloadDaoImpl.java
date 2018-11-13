package com.wavem.first.synthesisData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.synthesisData.dao.DataSheetDownloadDao;

@Transactional
@Repository("DataSheetDownloadDaoImpl")
public class DataSheetDownloadDaoImpl implements DataSheetDownloadDao {
	private static final Logger logger = LoggerFactory.getLogger(DataSheetDownloadDaoImpl.class);
	
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> downloadDataSheet(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("datasheet.downloadDataSheet", input);
	}
}
