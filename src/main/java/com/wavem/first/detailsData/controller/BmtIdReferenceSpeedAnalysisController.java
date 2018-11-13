package com.wavem.first.detailsData.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.detailsData.service.BmtIdReferenceSpeedAnalysisService;


@Controller("BmtIdReferenceSpeedAnalysisController")
public class BmtIdReferenceSpeedAnalysisController {

	private static final Logger logger = LoggerFactory.getLogger(BmtIdReferenceSpeedAnalysisController.class);

	@Resource(name="BmtIdReferenceSpeedAnalysisService")
	private BmtIdReferenceSpeedAnalysisService bmtIdReferenceSpeedAnalysisService;
	
	@RequestMapping(value = "/detailsData/bmtIdReferenceSpeedAnalysis", method = RequestMethod.GET)
	public ModelAndView getBmtIdReferenceSpeedAnalysis(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
				if (session.getAttribute("SS_USER_ID") == null
						|| session.getAttribute("SS_CP") == null
						|| session.getAttribute("SS_CAR_INFO") == null
						|| session.getAttribute("SS_AUCODE") == null) {
					mav.setViewName("redirect:/");
				}
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_bmtIdReferenceSpeedAnalysis");
		mav.setViewName("detailsData/bmtIdReferenceSpeedAnalysis");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getBmtIdSpeedList", method = RequestMethod.POST)
	public ModelAndView getBmtIdList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();

		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", userid);
		
		List<Map<String, Object>> result = bmtIdReferenceSpeedAnalysisService.getBmtIdList(map);
		mav.addObject("list", result);
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_bmtIdReferenceSpeedAnalysis");
		System.out.println("result >>>>>>>>>>>" + result);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getTimeList", method = RequestMethod.POST)
	public ModelAndView getTimeList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		String bmtid = request.getParameter("bmtid");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("bmtid", bmtid);
		map.put("userid", userid);
		
		System.out.println("map >>>> " + map.toString());
		
		List<Map<String, Object>> result = bmtIdReferenceSpeedAnalysisService.getTimeList(map);
		mav.addObject("list", result);
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_bmtIdReferenceSpeedAnalysis");
		System.out.println("result >>>>>>>>>>>" + result);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getCpList", method = RequestMethod.POST)
	public ModelAndView getCpList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String bmtid = request.getParameter("bmtid").toString();
		String userid = session.getAttribute("SS_USER_ID").toString();
		String gpstm = request.getParameter("gpstm");
		
		map.put("bmtid", bmtid);
		map.put("userid", userid);
		map.put("gpstm", gpstm);
		
		System.out.println("map >>>>> " + map.toString());
		List<Map<String, Object>> result = bmtIdReferenceSpeedAnalysisService.getCpList(map);
		System.out.println("result >>>>> " + result.toString());
		mav.addObject("result", result);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getGraph", method = RequestMethod.POST)
	public ModelAndView getGraph(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String bmtid = request.getParameter("bmtid").toString();
		String userid = session.getAttribute("SS_USER_ID").toString();
		String gpstm = request.getParameter("gpstm");
		String cp = request.getParameter("cp");
		
		map.put("bmtid", bmtid);
		map.put("userid", userid);
		map.put("gpstm", gpstm);
		map.put("cp", cp);
		
		System.out.println("map >>>> " + map.toString());
		
		List<Map<String, Object>> result = bmtIdReferenceSpeedAnalysisService.getGraph(map);

		mav.addObject("list", result);
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_bmtIdReferenceSpeedAnalysis");
		return mav;
	}
}
