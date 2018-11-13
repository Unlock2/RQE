package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.BmtIdReferenceSpeedAnalysisDao;
import com.wavem.first.detailsData.service.BmtIdReferenceSpeedAnalysisService;

@Service("BmtIdReferenceSpeedAnalysisService")
public class BmtIdReferenceSpeedAnalysisServiceImpl implements BmtIdReferenceSpeedAnalysisService {

	@Autowired
	private BmtIdReferenceSpeedAnalysisDao bmtIdReferenceSpeedAnalysisDao;

	@Override
	public List<Map<String, Object>> getBmtIdList(Map<String, Object> map) {
		return bmtIdReferenceSpeedAnalysisDao.getBmtIdList(map);
	}

	@Override
	public List<Map<String, Object>> getTimeList(Map<String, Object> map) {
		return bmtIdReferenceSpeedAnalysisDao.getTimeList(map);
	}

	@Override
	public List<Map<String, Object>> getCpList(Map<String, Object> map) {
		return bmtIdReferenceSpeedAnalysisDao.getCpList(map);
	}
	
	@Override
	public List<Map<String, Object>> getGraph(Map<String, Object> map) {
		return bmtIdReferenceSpeedAnalysisDao.getGraph(map);
	}

}
