package com.wavem.first.synthesisData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.synthesisData.dao.DataSheetDao;

@Transactional
@Repository("DataSheetDaoImpl")
public class DataSheetDaoImpl implements DataSheetDao {
	private static final Logger logger = LoggerFactory.getLogger(DataSheetDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> getDataSheetList(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("datasheet.getDataSheetList", input);
	}

	public Map<String, Object> getDetailDataSheet(Map<String, Object> input) {
		return sqlSessionTemplate.selectOne("datasheet.dataSheet_detail", input);
	}

}
