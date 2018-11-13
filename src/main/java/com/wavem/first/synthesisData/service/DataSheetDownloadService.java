package com.wavem.first.synthesisData.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface DataSheetDownloadService {

	List<Map<String, Object>> downloadDataSheet(Map<String, Object> input);
}
