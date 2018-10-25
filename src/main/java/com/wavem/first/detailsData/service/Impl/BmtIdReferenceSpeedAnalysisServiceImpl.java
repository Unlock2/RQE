package com.wavem.first.detailsData.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
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
	public Map<String, Object> getBmtIdListDetail(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		// table data 
		List<Map<String, Object>> analysisList = bmtIdReferenceSpeedAnalysisDao.getAnalysisList(map);
		// userList ( group by bmtid, userid user 구분을 위한 group by )  
		List<Map<String, Object>> userList = bmtIdReferenceSpeedAnalysisDao.getUserList(map);
		
		// gpsList
		List<List<Map<String, Object>>> speedDataList = new ArrayList<List<Map<String, Object>>>();
		for(int i = 0; i < userList.size(); i++) {
			speedDataList.add(bmtIdReferenceSpeedAnalysisDao.getSpeedList(userList.get(i)));
		}
		
		resultMap.put("analysisList", analysisList);
		resultMap.put("userList", userList);
		resultMap.put("speedDataList", speedDataList);
		
		return resultMap;
	}

}
