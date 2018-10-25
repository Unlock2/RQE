package com.wavem.first.synthesisData.service;

import java.util.List;
import java.util.Map;

public interface DataSheetService {

	List<Map<String, Object>> getDataSheetList(Map<String, Object> input);

	Map<String, Object> getDetailDataSheet(Map<String, Object> input);

//	List<Map<String, Object>> getDownloadFile(Map<String, Object> input);
}