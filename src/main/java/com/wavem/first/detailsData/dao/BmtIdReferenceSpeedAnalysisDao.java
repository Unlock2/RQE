package com.wavem.first.detailsData.dao;

import java.util.List;
import java.util.Map;

public interface BmtIdReferenceSpeedAnalysisDao {
	List<Map<String, Object>> getBmtIdList(Map<String, Object> map);

	List<Map<String, Object>> getTimeList(Map<String, Object> map);
	
	List<Map<String, Object>> getCpList(Map<String, Object> map);

	List<Map<String, Object>> getGraph(Map<String, Object> map);
}
