package com.spring.shop_project;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ChartController {

	@Autowired
	ChartService service;
	
	 @RequestMapping(value="/admin/incomechart" , method = RequestMethod.GET)
	 public String IncomeChart() { 
		 return "incomechart";
	 }
	
	 @RequestMapping(value="/admin/incomechart1" , method = RequestMethod.POST)
	 @ResponseBody
	 public List<OrderVO> postIncomeChart(
			@RequestParam(value = "startdate") String startdate,
			@RequestParam(value = "enddate") String enddate) { 
		 	
		 	String[] param = { startdate, enddate };

			List<OrderVO> incomeperday = service.incomechart(param);

			return incomeperday;

	}
	 
	
	 //private static String before3 = Integer.toString(cal.get(cal.MONTH)-3);
	 //private static String today = Integer.toString(cal.get(Calendar.DAY_OF_YEAR));
	 @RequestMapping(value="/admin/incomechart2" , method = RequestMethod.GET)
	 @ResponseBody
	 public List<OrderVO> getIncomeChart(
			@RequestParam(value = "startdate") String startdate,
			@RequestParam(value = "enddate") String enddate) { 
		 //defaultValue = "2020/01/01"
		 if(startdate == "" && enddate == "") {
			 Date date = new Date();
		     SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd");
		     enddate = format1.format(date);
		     
		     Date date2 = new Date(date.getYear(), date.getMonth()-3, date.getDay());
		     startdate = format1.format(date2);

			
	 	}
		 
		 	String[] param = { startdate, enddate };

			List<OrderVO> incomeperday = service.incomechart(param);

			return incomeperday;
	}
	 
	 // 날짜 검색해서 그 기간동안의 일별 매출액 그래프
	 /*
	@RequestMapping(value = "/incomechart", method = RequestMethod.POST)
	public ModelAndView IncomeChart(@RequestParam(value = "startdate") String startdate,
			@RequestParam(value = "enddate") String enddate) {
		String[] param = { startdate, enddate };

		List<OrderVO> incomeperday = service.incomechart(param);

		ModelAndView nav = new ModelAndView();
		nav.addObject("incomeperday", incomeperday);
		nav.setViewName("incomechart");

		return nav;
	} */
	

	// 월별 매출 점유율 놓은 상품 순서대로 파이 차트 get
	@RequestMapping(value="/piechart", method = RequestMethod.GET)
	public ModelAndView PieChartg(
			@RequestParam(value="month",required = false, defaultValue = "13월")  String month, 
			@RequestParam(value="year",required=false, defaultValue = "year") String year) {
		
		month = month.split("월")[0];
		
		if(month.equals("13")) { // 현재 날짜
			month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
			year = String.format("%02d", Calendar.getInstance().get(Calendar.YEAR));
		} else {
			month = String.format("%02d", Integer.parseInt(month));
			year = String.format("%02d", Integer.parseInt(year));
		}
		
		/*if(month == null) {
			int calmon = Calendar.getInstance().get(Calendar.MONTH);
			if(calmon<10) {
				month= "0"+calmon;
			}else {
				month= ""+calmon;
			}
			
			
		}*/
		String[] param3 = {month, year};
		int monthtotal = service.getMonthTotal(param3);
		ModelAndView nav = new ModelAndView();
		
		if(service.getShare(param3) == null) {
			nav.setViewName("piechartfail");
		} else {
			List<OrderVO> monthshare = service.getShare(param3);
			
			nav.addObject("monthshare", monthshare);
			nav.addObject("monthtotal", monthtotal);
			nav.setViewName("piechart");
		}
		
		return nav;
	}
	
	
	// 월별 매출 점유율 놓은 상품 순서대로 파이 차트 post
	/*
	@RequestMapping(value="/piechart", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView PieChart(@RequestParam(value="month") String month) {
		
		month = month.split("월")[0];
		int calmon = Integer.parseInt(month);
		if(calmon < 10) {
			month = month.split("월")[0];
			month = "0"+month;
		} else {
			month = month.split("월")[0];
			month = ""+month;
		}
		
		List<OrderVO> monthshare = service.getShare(month);
		
		ModelAndView nav = new ModelAndView();
		nav.addObject("monthshare", monthshare);
		nav.setViewName("piechart");
		
		return nav;
	} */
	
	
	// 전월대비 매출액 증가율
	@RequestMapping(value="/monthgrowth", method = RequestMethod.GET)
	public ModelAndView monthGrowth
	(@RequestParam (value="month", defaultValue = "13월" ) String month,
	@RequestParam (value="year", defaultValue = "year" ) String year) {
		
		month = month.split("월")[0];
		String prevmonth = "";
		if(month.equals("13")) { // 현재 날짜
			month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
			prevmonth = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH));
			year = String.format("%02d", Calendar.getInstance().get(Calendar.YEAR));
		}
		
		String[] param1 = { month, year };
		String[] param2 = { prevmonth, year};
		int monthtotal = service.getMonthTotal(param1);
		int prevmonthtotal = service.prevMonthTotal(param2);
		
		ModelAndView nav = new ModelAndView();
		nav.addObject("monthtotal", monthtotal);
		nav.addObject("prevmonthtotal", prevmonthtotal);
		nav.setViewName("monthgrowth");
		
		return nav;
	}
	
	// 전년 동기대비 매출액 증가율 미정
	@RequestMapping(value = "/yeargrowth", method = RequestMethod.GET)
	public ModelAndView yearGrowth
	(@RequestParam (value="month", defaultValue = "13월" ) String month,
	@RequestParam (value="year", defaultValue = "year" ) String year) {
		
		month = month.split("월")[0];
		String prevyear = "";
		if(month.equals("13")) { // 현재 날짜
			month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
			year = String.format("%02d", Calendar.getInstance().get(Calendar.YEAR));
			prevyear = String.format("%02d", Calendar.getInstance().get(Calendar.YEAR)-1);
		}
		
		String[] param = { month, year };
		String[] param2 = { month, prevyear};
		int monthtotal = service.getMonthTotal(param);
		int prevyearmonthtotal = service.prevYearMonthTotal(param2);
		
		ModelAndView nav = new ModelAndView();
		nav.addObject("monthtotal", monthtotal);
		nav.addObject("prevyearmonthtotal", prevyearmonthtotal);
		nav.setViewName("yeargrowth");
		
		return nav;
	}
	
	
	// 오늘 매출액 총액 보여주기 미정
	@RequestMapping(value="/todaytotalincome", method = RequestMethod.GET)
	public ModelAndView todaytotalincome() {
		
		ModelAndView nav = new ModelAndView();
		if(service.todaytotalincome() == null) {
			nav.setViewName("todaytotalfail");
		} else {
			int todaytotalincome = Integer.parseInt(service.todaytotalincome());
			 nav.addObject("todaytotalincome", todaytotalincome);
			 nav.setViewName("todaytotalincome");
		}

		 return nav;
	}
	
	// 오늘 총 판매량 보여주기 미정
	@RequestMapping(value="/todaytotalorder", method = RequestMethod.GET)
	public ModelAndView todaytotalorder() {
		
		ModelAndView nav = new ModelAndView();
		if(service.todaytotalorder() == null) {
			nav.setViewName("todaytotalfail");
		} else {
			int todaytotalorder = Integer.parseInt(service.todaytotalorder());
			nav.addObject("todaytotalorder", todaytotalorder);
			nav.setViewName("todaytotalorder");
		}
		 
		 return nav;
	}
	
	// 이번달 판매량 TOP3 상품 보여주기
	@RequestMapping(value="/monthtop3", method = RequestMethod.GET)
	public ModelAndView monthtop3(
		@RequestParam (value="month", defaultValue = "13월" ) String month,
		@RequestParam (value="year", defaultValue = "year" ) String year) {
		
		month = month.split("월")[0];
		if(month.equals("13")) { // 현재 날짜
			month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
			year = String.format("%02d", Calendar.getInstance().get(Calendar.YEAR));
		}
		
		String[] param = { month, year };
		List<OrderVO> monthtop3 = service.monthtop3(param);
		
		ModelAndView nav = new ModelAndView();
		nav.addObject("monthtop3", monthtop3);
		nav.setViewName("monthtop3");
		
		return nav;
	}
	
	
	
	
	
	
}
