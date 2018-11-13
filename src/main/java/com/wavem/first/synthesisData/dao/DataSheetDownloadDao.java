package com.wavem.first.synthesisData.dao;

import java.util.List;
import java.util.Map;

public interface DataSheetDownloadDao {
	
	List<Map<String, Object>> downloadDataSheet(Map<String, Object> input);
}
