package com.kh.letEatGo.accountBook.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.accountBook.model.service.AccountBookService;
import com.kh.letEatGo.accountBook.model.vo.Account;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;
import com.kh.letEatGo.common.page.PageFactory;
import com.kh.letEatGo.partner.model.service.PartnerService;
import com.kh.letEatGo.partner.model.service.PartnerServiceImpl;
import com.kh.letEatGo.partner.model.vo.Partner;

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
			
			int avgIncome = 0 , avgOutcome = 0 , avgRevenue = 0; //평균 수익 , 평균 지출 , 평균 순수익
			
			for(AccountBook ab : alllist) {
				//리스트에 각 데이터별 추가
				incomeList.add(ab.getAccount_Income());
				outcomeList.add(ab.getAccount_Outcome());
				revenueList.add(ab.getAccount_Revenue());
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
	public ModelAndView insertAccoountBook(String account_Date, String account_LocCode, String account_Type, String account_Clause,
			String account_Item, String account_Summary, int account_Outcome, int account_Income, int account_Balance, int partner_No) {
		ModelAndView mv = new ModelAndView();
		AccountBook ab = new AccountBook();
		ab.setAccount_Date(account_Date);
		ab.setAccount_Type(account_Type);
		ab.setAccount_Clause(account_Clause);
		ab.setAccount_Item(account_Item);
		ab.setAccount_Summary(account_Summary);
		ab.setAccount_Income(account_Income);
		ab.setAccount_Outcome(account_Outcome);
		ab.setAccount_Balance(account_Balance);
		ab.setPartner_No(partner_No);
		int result = service.insertAccountBook(ab);
		System.out.println(result);
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
			String account_Item, String account_Summary, int account_Outcome, int account_Income, int account_Balance) {
		ModelAndView mv = new ModelAndView();
		AccountBook ab = new AccountBook();
		ab.setAccount_No(account_No);
		ab.setAccount_Date(account_Date);
		ab.setAccount_Type(account_Type);
		ab.setAccount_Clause(account_Clause);
		ab.setAccount_Item(account_Item);
		ab.setAccount_Summary(account_Summary);
		ab.setAccount_Income(account_Income);
		ab.setAccount_Outcome(account_Outcome);
		ab.setAccount_Balance(account_Balance);
		
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
		
		account.setAccount_Balance(1000000);

		System.out.println(account);
		
		int result = service.insertAccount(account);
		
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "계좌등록이 성공했습니다.";
			loc = "/accountBook/accountBookView?partner_No="+account.getPartner_No();
			System.out.println(loc);
		}else {
			msg = "계좌등록이 실패했습니다.";
			loc = "/";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}





}
