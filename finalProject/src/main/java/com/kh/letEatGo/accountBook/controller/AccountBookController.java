package com.kh.letEatGo.accountBook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.letEatGo.accountBook.model.service.AccountBookService;
import com.kh.letEatGo.accountBook.model.vo.AccountBook;
import com.kh.letEatGo.common.page.PageFactory;

@Controller
public class AccountBookController {
	
	@Autowired
	private AccountBookService service;
	
	@RequestMapping("/accountBook/accountBookView")
	public ModelAndView accountBookView(int partner_No, @RequestParam(value = "cPage", required = false, defaultValue = "1")int cPage) {		
		int numPerPage = 5;
		int totalData = service.selectAccountBookCount(partner_No);		
		List<AccountBook> list = service.selectAccountBookList(partner_No,cPage, numPerPage);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("totalCount",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerPage,"/accountBook/accountBookView?partner_No=1234"));
		mv.setViewName("accountBook/accountBookView");
		return mv;
	}
	
	@RequestMapping("/accountBook/insertAccountBook.do")
	public ModelAndView insertAccoountBook(String account_Date, String account_LocCode, String account_Type, String account_Clause,
			String account_Item, String account_Summary, int account_Outcome, int account_Income, int account_Balance, int partner_No) {
		ModelAndView mv = new ModelAndView();
		AccountBook ab = new AccountBook();
		ab.setAccount_Date(account_Date);
		ab.setAccount_LocCode(account_LocCode);
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
		ab.setAccount_LocCode(account_LocCode);
		ab.setAccount_Type(account_Type);
		ab.setAccount_Clause(account_Clause);
		ab.setAccount_Item(account_Item);
		ab.setAccount_Summary(account_Summary);
		ab.setAccount_Income(account_Income);
		ab.setAccount_Outcome(account_Outcome);
		ab.setAccount_Balance(account_Balance);
		
		int result = service.updateAccountBook(ab);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
