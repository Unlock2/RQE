package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.BmtIdReferenceSpeedAnalysisDao;

@Transactional
@Repository("BmtIdReferenceSpeedAnalysisDao")
public class BmtIdReferenceSpeedAnalysisDaoImpl implements BmtIdReferenceSpeedAnalysisDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getBmtIdList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("bmtIdReferenceSpeedAnalysis.getBmtIdList", map);
	}

	@Override
	public List<Map<String, Object>> getTimeList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("bmtIdReferenceSpeedAnalysis.getTimeList", map);
	}

	@Override
	public List<Map<String, Object>> getCpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("bmtIdReferenceSpeedAnalysis.getCpList", map);
	}
	
	@Override
	public List<Map<String, Object>> getGraph(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("bmtIdReferenceSpeedAnalysis.getGraph", map);
	}

}
