package com.wavem.first.synthesisData.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.synthesisData.service.DataSheetDownloadService;

@Controller("DataSheetDownloadController")
public class DataSheetDownloadController {

	@Resource(name = "DataSheetDownloadService")
	private DataSheetDownloadService dataSheetDownloadService;
	
	@ResponseBody
	@RequestMapping(value= "/synthesisData/downloadDataSheet", method = RequestMethod.POST)
	public ModelAndView downloadDataSheet(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("start_date", startDate);
		input.put("end_date", endDate);
		input.put("userid", userid);
		List<Map<String, Object>> out = dataSheetDownloadService.downloadDataSheet(input);
		System.out.println("다운로드 데이터 확인!!!! ::: >>>>> " + out);
		mav.addObject("downloadDataSheet", out);
		return mav;
		
	}
	
}
