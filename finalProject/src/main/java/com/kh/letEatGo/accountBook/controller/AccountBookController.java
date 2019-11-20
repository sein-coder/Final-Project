package com.kh.letEatGo.accountBook.controller;

import static com.kh.letEatGo.common.ml.Linear_Regression.predict;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.accountBook.model.service.AccountBookService;
import com.kh.letEatGo.accountBook.model.vo.Account;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;
import com.kh.letEatGo.common.page.PageFactory;
@Controller
public class AccountBookController {
	
	@Autowired
	private AccountBookService service;
	
	@RequestMapping("/accountBook/accountBookView")
	public ModelAndView accountBookView(int partner_No, @RequestParam(value = "cPage", required = false, defaultValue = "1")int cPage) {		
		ModelAndView mv = new ModelAndView();
		
		Account account = service.selectAccount(partner_No);
		
		if(account!=null) {
		
		int numPerPage = 5;
		int totalData = service.selectAccountBookCount(partner_No);		
		List<AccountBook> list = service.selectAccountBookList(partner_No,cPage, numPerPage);
		
		List<AccountBook> alllist = service.selectAllAccountBookList(partner_No);

		if(alllist.size()!=0) {
			// 최대/최소/평균 수익,지출,순수익 구하기
			List incomeList = new ArrayList();
			List outcomeList = new ArrayList();
			List revenueList = new ArrayList();
			List<String> dateList = new ArrayList();
			List pincomeList = new ArrayList();
			
			int avgIncome = 0 , avgOutcome = 0 , avgRevenue = 0; //평균 수익 , 평균 지출 , 평균 순수익
			
			for(AccountBook ab : alllist) {
				//리스트에 각 데이터별 추가
				incomeList.add(ab.getAccount_Income());
				outcomeList.add(ab.getAccount_Outcome());
				revenueList.add(ab.getAccount_Revenue());
				pincomeList.add(ab.getAccount_Predict());
				dateList.add(ab.getAccount_Date());
				
				//평균값 계산
				avgIncome += ab.getAccount_Income();
				avgOutcome += ab.getAccount_Outcome();
				avgRevenue += ab.getAccount_Revenue();
				
			}
			
			//각 갯수만큼 평균값 나누기
			avgIncome /= incomeList.size();
			avgOutcome /= outcomeList.size();
			avgRevenue /= revenueList.size();
			
			//평균값
			mv.addObject("avgIncome",avgIncome);
			mv.addObject("avgOutcome",avgOutcome);
			mv.addObject("avgRevenue",avgRevenue);
			//최댓값
			mv.addObject("maxIncome",Collections.max(incomeList));
			mv.addObject("maxOutcome",Collections.max(outcomeList));
			mv.addObject("maxRevenue",Collections.max(revenueList));
			//최솟값
			mv.addObject("minIncome",Collections.min(incomeList));
			mv.addObject("minOutcome",Collections.min(outcomeList));
			mv.addObject("minRevenue",Collections.min(revenueList));
			
			//그래프용 리스트 데이터 보내기
			mv.addObject("incomeList",incomeList);
			mv.addObject("outcomeList",outcomeList);
			mv.addObject("revenueList",revenueList);
			mv.addObject("pincomeList",pincomeList);
			mv.addObject("dateList",dateList);
		}
		
		mv.addObject("account",account);
		mv.addObject("partner_No",partner_No);
		mv.addObject("list",list);
		mv.addObject("totalCount",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerPage,"/accountBook/accountBookView?partner_No=1234"));
		mv.setViewName("accountBook/accountBookView");
		
		}
		
		else {
			mv.addObject("account",account);
			mv.addObject("partner_No",partner_No);
			mv.setViewName("accountBook/accountBookView");
		}
		
		return mv;
	}
	
	@RequestMapping("/accountBook/insertAccountBook.do")
	public ModelAndView insertAccoountBook(String account_Date, String account_Type, String account_Clause,
			String account_Item, String account_Summary, int account_Outcome, int account_Income, int partner_No,
			@RequestParam(value = "temperature", required = false, defaultValue = "0")double temperature, 
			@RequestParam(value = "precipitation", required = false, defaultValue = "0")double precipitation,
			HttpServletRequest req) {

		//예측용 데이터 전처리 과정(각각 요일, 온도, 강수량)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(account_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int day = cal.get(Calendar.DAY_OF_WEEK);
		if(day == 1) {
			day = 7;
		}else {
			day -=1;
		}

		double predictincome = predict(req,temperature,precipitation,day);
		
		ModelAndView mv = new ModelAndView();
		AccountBook ab = new AccountBook();
		ab.setAccount_Date(account_Date);
		ab.setAccount_Type(account_Type);
		ab.setAccount_Clause(account_Clause);
		ab.setAccount_Item(account_Item);
		ab.setAccount_Summary(account_Summary);
		ab.setAccount_Income(account_Income);
		ab.setAccount_Outcome(account_Outcome);
		ab.setAccount_Predict((int)predictincome);
		ab.setPartner_No(partner_No);
		
		int result = service.insertAccountBook(ab);	
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/accountBook/deleteAccountBook.do")
	public ModelAndView deleteAccountBook(int account_No) {
		ModelAndView mv = new ModelAndView();
		int result = service.deleteAccountBook(account_No);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/accountBook/updateAccountBook.do")
	public ModelAndView updateAccountBook(int account_No, String account_Date, String account_LocCode, String account_Type, String account_Clause,
			String account_Item, String account_Summary, int account_Outcome, int account_Income,
			@RequestParam(value = "temperature", required = false, defaultValue = "0")double temperature, 
			@RequestParam(value = "precipitation", required = false, defaultValue = "0")double precipitation,
			HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView();
		
		//예측용 데이터 전처리 과정(각각 요일, 온도, 강수량)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(account_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int day = cal.get(Calendar.DAY_OF_WEEK);
		if(day == 1) {
			day = 7;
		}else {
			day -=1;
		}
		//예측
		double predictincome = predict(req,temperature,precipitation,day);
		
		AccountBook ab = new AccountBook();
		
		ab.setAccount_No(account_No);
		ab.setAccount_Date(account_Date);
		ab.setAccount_Type(account_Type);
		ab.setAccount_Clause(account_Clause);
		ab.setAccount_Item(account_Item);
		ab.setAccount_Summary(account_Summary);
		ab.setAccount_Income(account_Income);
		ab.setAccount_Outcome(account_Outcome);
		ab.setAccount_Predict((int)predictincome);
		
		int result = service.updateAccountBook(ab);
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/accountBook/checkDateData.do")
	public ModelAndView checkDateData(String account_Date, int partner_No, int account_No) {
		ModelAndView mv = new ModelAndView();
		AccountBook ab = new AccountBook();
		
		ab.setAccount_Date(account_Date);
		ab.setPartner_No(partner_No);
		ab.setAccount_No(account_No);
		
		AccountBook resultAb = service.selectAccountBook(ab);
		boolean result = resultAb!=null?false:true;
		
		if(result==false) {
			if(resultAb.getAccount_No()==ab.getAccount_No()) {
				result = true;
			}
		}
		
		mv.addObject("result",result);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/accountBook/insertAccount.do")
	public ModelAndView insertAccount(Account account) {
		ModelAndView mv = new ModelAndView();
		
		account.setAccount_Balance(10000000);
		
		int result = service.insertAccount(account);
		
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "계좌등록이 성공했습니다.";
			loc = "/accountBook/accountBookView?partner_No="+account.getPartner_No();
		}else {
			msg = "계좌등록이 실패했습니다.";
			loc = "/";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/accountBook/calculate.do")
	public ModelAndView calculate(int partner_No) {
		ModelAndView mv = new ModelAndView();

		List<Map<String,String>> calList = service.selectCalRate(partner_No); 
		
		// 날짜 분류 리스트
		List<String> caldateList = new ArrayList();
		
		for(Map<String,String> m : calList) {
			caldateList.add(m.get("ACCOUNT_DATE"));			
		}
		
		//중복 날짜데이터 삭제
		caldateList = caldateList.parallelStream().distinct().collect(Collectors.toList());

		// 현금비율 리스트, 카드비율 리스트, 계좌이체비율 리스트, 기타비율 리스트
		List<Integer> cashList = new ArrayList();
		List<Integer> cardList = new ArrayList();
		List<Integer> bankTransferList = new ArrayList();
		List<Integer> otherList = new ArrayList();
		
		for(int i=0; i<caldateList.size(); i++) {
			cashList.add(0);
			cardList.add(0);
			bankTransferList.add(0);
			otherList.add(0);
		}
		
		// 각 리스트에 맞게 분류
		for(Map<String,String> m : calList) {
			
			int index = caldateList.indexOf(m.get("ACCOUNT_DATE"));
			
			switch (m.get("ACCOUNT_TYPE")) {
			case "현금":
				cashList.set(index, Integer.parseInt(String.valueOf(m.get("RATING"))));
				break;
			case "카드":
				cardList.set(index, Integer.parseInt(String.valueOf(m.get("RATING"))));
				break;
			case "계좌이체":
				bankTransferList.set(index, Integer.parseInt(String.valueOf(m.get("RATING"))));
				break;
			case "기타":
				otherList.set(index, Integer.parseInt(String.valueOf(m.get("RATING"))));
				break;
			}
		}
		
		mv.addObject("caldateList",caldateList);
		mv.addObject("cashList",cashList);
		mv.addObject("cardList",cardList);
		mv.addObject("bankTransferList",bankTransferList);
		mv.addObject("otherList",otherList);
		
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/accountBook/cardCalculate.do")
	public ModelAndView cardCalculate(int partner_No) {
		ModelAndView mv = new ModelAndView();
		
		//월 단위 매출 합계
		int monthlyIncome = 0;
		monthlyIncome = service.selectMonthlyIncome(partner_No);
		
		double goalMonthly = 0;
		goalMonthly = service.selectGoalMonthly(partner_No);
		
		//전일 대비 매출 증감율 계산
		List<Map<String,String>> yesterday_today_incomeRate = service.selectYesterday_today_incomeRate(partner_No);
		if(yesterday_today_incomeRate!=null) {
			double yt_IncomeRate=1;
			double y_IncomeRate=1;
			double t_IncomeRate=1;
			for(Map<String,String> m : yesterday_today_incomeRate) {
				if(String.valueOf(m.get("ROWNUM")).equals("1")) {
					t_IncomeRate = Integer.parseInt(String.valueOf(m.get("SUM(ACCOUNT_INCOME)")));
				}else {
					y_IncomeRate = Integer.parseInt(String.valueOf(m.get("SUM(ACCOUNT_INCOME)")));
				}
			}
			
			yt_IncomeRate = Math.round((double)(t_IncomeRate - y_IncomeRate) / y_IncomeRate * 100);
			mv.addObject("yt_IncomeRate",yt_IncomeRate);
			mv.addObject("yt_Income",(int)t_IncomeRate-y_IncomeRate);
		}

		int sumRevenue = 0;
		sumRevenue = service.selectSumRevenue(partner_No);
		
		mv.addObject("goalMonthly",goalMonthly);
		mv.addObject("sumRevenue",sumRevenue);
		mv.addObject("monthlyIncome",monthlyIncome);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/accountBook/roundChartcalculate.do")
	public ModelAndView roundChartcalculate(int partner_No, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String,String>> roundCharList = service.selectCalRoundChart(partner_No);
		
		List<String> labelList = new ArrayList();
		List<String> countList = new ArrayList();
		
		for(Map<String,String> m : roundCharList) {
			labelList.add(String.valueOf(m.get("연령대"))+String.valueOf(m.get("성별")));
			countList.add(String.valueOf(m.get("명")));
		}
		
		res.setContentType("text/html;charset=utf-8");
		
		mv.addObject("labelList",labelList);
		mv.addObject("countList",countList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/accountBook/Balance.do")
	public ModelAndView balance(int partner_No) {
		ModelAndView mv = new ModelAndView();
		Map<String,Integer> sum = service.selectSumInOutcome(partner_No);
		
		mv.addObject("sum", sum);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
