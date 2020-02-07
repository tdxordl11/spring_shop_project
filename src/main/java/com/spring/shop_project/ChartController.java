package com.spring.shop_project;

import java.text.SimpleDateFormat;
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
	
	 @RequestMapping(value="/incomechart" , method = RequestMethod.GET)
	 public String IncomeChart() { 
		 return "incomechart";
	 }
	
	 @RequestMapping(value="/incomechart1" , method = RequestMethod.POST)
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
	 @RequestMapping(value="/incomechart2" , method = RequestMethod.GET)
	 @ResponseBody
	 public List<OrderVO> getIncomeChart(
			@RequestParam(value = "startdate", defaultValue = "2020/01/01") String startdate,
			@RequestParam(value = "enddate", defaultValue = "2020/01/10") String enddate) { 
		 //defaultValue = "2020/01/01"
//		 if(startdate == "" && enddate == "") {
//			 Calendar cal = Calendar.getInstance();
//			 Date date = new Date();
//		     SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd");
//			 //startdate = cal.add(Calendar.MONTH,-3);
//		     Date before3 = addMonth(date,-3);
//		     startdate = format1.format(before3);
//			 enddate = format1.format(date);
//	 	}
		 
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
	
	private Date addMonth(Date date, int i) {
		// TODO Auto-generated method stub
		return null;
	}

	// 월별 매출 점유율 놓은 상품 순서대로 파이 차트 get
	@RequestMapping(value="/piechart", method = RequestMethod.GET)
	public ModelAndView PieChartg(@RequestParam(value="month",required = false, defaultValue = "13월")  String month) {
		
		month = month.split("월")[0];
		
		if(month.equals("13")) { // 현재 날짜
			month = String.format("%02d", Calendar.getInstance().get(Calendar.MONTH)+1);
		} else {
			month = String.format("%02d", Integer.parseInt(month));
		}
		
		/*if(month == null) {
			int calmon = Calendar.getInstance().get(Calendar.MONTH);
			if(calmon<10) {
				month= "0"+calmon;
			}else {
				month= ""+calmon;
			}
			
			
		}*/
		int monthtotal = service.getMonthTotal(month);
		List<OrderVO> monthshare = service.getShare(month);
		
		ModelAndView nav = new ModelAndView();
		nav.addObject("monthshare", monthshare);
		nav.addObject("monthtotal", monthtotal);
		nav.setViewName("piechart");
		
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
	
	

}
