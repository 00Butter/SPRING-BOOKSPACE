package spring.mvc.bookspace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.AccountDTO;
import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.CartDTO;
import spring.mvc.bookspace.dto.CashDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PaymentDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.dto.ReviewDTO;
import spring.mvc.bookspace.dto.page.TablePageDTO;
import spring.mvc.bookspace.repository.PayRepository;

@Controller
@RequestMapping("/pay")
public class PayContorller {
	@Autowired
	private TablePageDTO page;
	private String basePath = "/WEB-INF/views/book/payment/";

	@Autowired
	private PayRepository repository;

	@RequestMapping(value = "bookone") // ????????
	public String myboardList(ModelMap map) {
		map.addAttribute("main", basePath + "payment.jsp");
		return "home";
	}



	@RequestMapping(value = "cash")
	public ModelAndView cashPlus(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		MemberDTO mDto = repository.selectCash(rcvMDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("mDto", mDto);
		mav.setViewName("book/payment/cash");

		return mav;
	}

	@RequestMapping(value = "cashList")
	public String paySelectList( // 수정
			ModelMap map, HttpServletRequest request, @RequestParam(value = "page", required = false) String pagercv) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);

		ArrayList<Object> listc = (ArrayList<Object>) repository.cashSelectList(mDto);

		page.setRecordDegree(10);
		int nowPage = 1;

		if (pagercv != null) {
			nowPage = Integer.parseInt(pagercv);
			page.setNowPage(nowPage);
		} else {
			page.setList(listc);
			page.setNowPage(1);
		}

		map.addAttribute("listc", listc);
		map.addAttribute("page", page);
		map.addAttribute("main", basePath + "cashList.jsp");

		return "home";
	}

	@RequestMapping(value = "buyList")
	public String buySelectList( // 수정
			ModelMap map, HttpServletRequest request, @RequestParam(value = "page", required = false) String pagercv) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);

		ArrayList<Object> listc = (ArrayList<Object>) repository.buySelectList(mDto);

		page.setRecordDegree(5);
		int nowPage = 1;

		if (pagercv != null) {
			nowPage = Integer.parseInt(pagercv);
			page.setNowPage(nowPage);
		} else {
			page.setList(listc);
			page.setNowPage(1);
		}

		map.addAttribute("listc", listc);
		map.addAttribute("page", page);
		map.addAttribute("main", basePath + "paymentList.jsp");

		return "home";
	}

	@RequestMapping(value = "card")
	public ModelAndView cardPay(HttpServletRequest request, @RequestParam("comp") String comp,
			@RequestParam("price") Integer price) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		MemberDTO mDto = repository.selectCash(rcvMDto);
		mDto.setName(comp);
		mDto.setNum(price);

		ModelAndView mav = new ModelAndView();
		mav.addObject("mDto", mDto);
		mav.setViewName("book/payment/cashPopup/popupCard");

		return mav;
	}

	@RequestMapping(value = "phone")
	public ModelAndView phonePay(HttpServletRequest request, @RequestParam("price") Integer price) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		MemberDTO mDto = repository.selectCash(rcvMDto);
		mDto.setNum(price);

		ModelAndView mav = new ModelAndView();
		mav.addObject("mDto", mDto);
		mav.setViewName("book/payment/cashPopup/popupPhone");

		return mav;
	}

	@RequestMapping(value = "cardCash")
	public String cardCash(HttpServletRequest request, Model model, @RequestParam("plus") Integer plus,
			@RequestParam("cash") Integer cash) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setCash(plus + cash);
		MemberDTO mem = (MemberDTO) repository.selectOne("mem.selectOne", mDto);
		CashDTO cDto = new CashDTO();
		cDto.setId(id);
		cDto.setCashType("카드 결제");
		cDto.setPrice(plus);

		
		repository.cashInsert(cDto);
		if(mem.getGrade().equals("서점")){
			int bonus=(int) Math.ceil(plus*0.1);
			cDto.setCashType("보너스포인트");
			cDto.setPrice(bonus);
			repository.cashInsert(cDto);
			mDto.setCash(plus+cash+bonus);
			repository.cashUpdate(mDto);
		}else if(mem.getGrade().equals("도서관")){
			int bonus=(int) Math.ceil(plus*0.2);
			cDto.setCashType("보너스포인트");
			cDto.setPrice(bonus);
			repository.cashInsert(cDto);
			mDto.setCash(plus+cash+bonus);
			repository.cashUpdate(mDto);
		}else{
		repository.cashUpdate(mDto);
		}
		model.addAttribute("msg", "충전 완료");

		return "book/payment/cashPopup/popupCard";
	}

	@RequestMapping(value = "cardPhone")
	public String cardPhone(HttpServletRequest request, Model model, @RequestParam("plus") Integer plus,
			@RequestParam("cash") Integer cash) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setCash(plus + cash);
		MemberDTO mem = (MemberDTO) repository.selectOne("mem.selectOne", mDto);
		CashDTO cDto = new CashDTO();
		cDto.setId(id);
		cDto.setCashType("핸드폰 결제");
		cDto.setPrice(plus);
		repository.cashInsert(cDto);
		if(mem.getGrade().equals("서점")){
			int bonus=(int) Math.ceil(plus*0.1);
			cDto.setCashType("보너스포인트");
			cDto.setPrice(bonus);
			repository.cashInsert(cDto);
			mDto.setCash(plus+cash+bonus);
			repository.cashUpdate(mDto);
		}else if(mem.getGrade().equals("도서관")){
			int bonus=(int) Math.ceil(plus*0.2);
			cDto.setCashType("보너스포인트");
			cDto.setPrice(bonus);
			repository.cashInsert(cDto);
			mDto.setCash(plus+cash+bonus);
			repository.cashUpdate(mDto);
		}else{
		repository.cashUpdate(mDto);
		}
		model.addAttribute("msg", "충전 완료");

		return "book/payment/cashPopup/popupPhone";
	}

	@RequestMapping(value = "cart")
	public ModelAndView cart(ModelMap map, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		List<Object> listc = repository.cartSelectList(rcvMDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listc", listc);

		map.addAttribute("main", basePath + "cart.jsp");
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "paymentAll")
	public ModelAndView paymentAll(ModelMap map, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		MemberDTO mDto = repository.selectCash(rcvMDto);

		List<Object> listc = repository.cartSelectList(rcvMDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("listc", listc);
		mav.addObject("mDto", mDto);

		map.addAttribute("main", basePath + "payment.jsp");
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "paymentOne")
	public ModelAndView cartPaymentOne(ModelMap map, @RequestParam("num") Integer num, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);

		MemberDTO mDto = repository.selectCash(rcvMDto);

		rcvMDto.setNum(num);
		CartDTO dto = repository.cartPaymentOne(rcvMDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("mDto", mDto);

		map.addAttribute("main", basePath + "payment.jsp");
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value = "deleteOne")
	public String cartDeleteOne(@RequestParam("num") Integer num, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setNum(num);
		repository.cartDeleteOne(mDto);

		return "redirect:cart";
	}

	@RequestMapping(value = "deleteAll")
	public String cartDeleteAll(ModelMap map, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		repository.cartDeleteAll(mDto);

		return "redirect:cart";
	}

	@RequestMapping(value = "getOne")
	public String getOne(@RequestParam("bookname") String bookname, @RequestParam("cash") Integer cash,
			@RequestParam("num") Integer num, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setNum(num);
		mDto.setCash(cash);

		CartDTO cDto = new CartDTO();
		cDto.setBookname(bookname);
		BookDTO bDto = repository.getOneBookSelect(cDto);

		ReviewDTO rDto = new ReviewDTO();
		rDto.setId(id);
		rDto.setImg(bDto.getImg());
		rDto.setBookname(bDto.getBookname());
		rDto.setReview("-");
		rDto.setStar(0);
		rDto.setRecommend(0);
		rDto.setComplain(0);
		rDto.setReviewDate("-");
		repository.revInsert(rDto);

		PaymentDTO pDto = new PaymentDTO();
		pDto.setId(id);
		pDto.setImg(bDto.getImg());
		pDto.setBookname(bookname);
		pDto.setPrice(bDto.getPrice());
		pDto.setPublisher(bDto.getPublisher());

		MemberDTO mem = (MemberDTO) repository.selectOne("mem.selectOne", mDto);
		AccountDTO accdto = new AccountDTO();
		accdto.setBook(bDto);
		accdto.setGender(mem.getGender());
		repository.insertOne("pay.accOne", accdto);
		repository.paymentInsertOne(pDto);
		repository.cashUpdate(mDto);
		repository.cartDeleteOne(mDto);
		updateGreade(mem);

		return "redirect:buyList";
	}

	@RequestMapping(value = "getAll")
	public String getAll(@RequestParam("cash") Integer cash, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setCash(cash);
		MemberDTO mem = (MemberDTO) repository.selectOne("mem.selectOne", mDto);
		List<Object> bList = repository.cartSelectList(mDto);
		AccountDTO acc = new AccountDTO();
		acc.setGender(mem.getGender());
		for (int i = 0; i < bList.size(); i++) {
			CartDTO cDto = (CartDTO) bList.get(i);

			BookDTO bDto = repository.getOneBookSelect(cDto);

			ReviewDTO rDto = new ReviewDTO();
			rDto.setId(id);
			rDto.setImg(bDto.getImg());
			rDto.setBookname(bDto.getBookname());
			rDto.setReview("-");
			rDto.setStar(0);
			rDto.setRecommend(0);
			rDto.setComplain(0);
			rDto.setReviewDate("-");
			repository.revInsert(rDto);

			PaymentDTO pDto = new PaymentDTO();
			pDto.setId(id);
			pDto.setImg(bDto.getImg());
			pDto.setBookname(bDto.getBookname());
			pDto.setPrice(bDto.getPrice());
			pDto.setPublisher(bDto.getPublisher());
			acc.setBook(bDto);

			repository.paymentInsertOne(pDto);
			repository.insertOne("pay.accOne", acc);
		}
		updateGreade(mem);
		repository.cashUpdate(mDto);
		repository.cartDeleteAll(mDto);

		return "redirect:buyList";
	}

	@RequestMapping("inBag")
	@ResponseBody
	public String wod(@RequestParam("bookname") String bn, @RequestParam("pub") String pub,
			@RequestParam("id") String id, @RequestParam("price") Integer price, @RequestParam("img") String img) {
		CartDTO dto = new CartDTO();
		dto.setId(id);
		dto.setBookname(bn);
		dto.setPublisher(pub);
		dto.setPrice(price);
		dto.setImg(img);

		int res = repository.insertOne(dto);

		return String.valueOf(res);

	}

	@RequestMapping("cartCh")
	@ResponseBody
	public String check(@RequestParam("bookname") String bookname, @RequestParam("id") String id) {
		String res = "0";
		CartDTO d = new CartDTO();
		d.setBookname(bookname);
		d.setId(id);

		CartDTO dto = repository.check(d);
		if (dto != null) {
			res = "1";
		}else{
			PaymentDTO ddto=repository.checkbook(d);
			if(ddto!=null)res="1";
		}
		return res;
	}



	@RequestMapping(value = "directBuy")
	public ModelAndView directBuy(@RequestParam("bookname") String bookname, HttpServletRequest request, ModelMap map) {
		String id = (String) request.getSession().getAttribute("login");

		MemberDTO rcvMDto = new MemberDTO();
		rcvMDto.setId(id);
		MemberDTO mDto = repository.selectCash(rcvMDto);

		BookDTO dto = repository.book(bookname);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("mDto", mDto);
		map.addAttribute("main", basePath + "payment.jsp");
		map.addAttribute("direct", "ff");
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "directGet")
	public String directGet(HttpServletRequest request, ModelMap map, @RequestParam("bookname") String bookname,
			@RequestParam("cash") Integer cash) {
		String id = (String) request.getSession().getAttribute("login");

		BookDTO bDto = repository.book(bookname);

		ReviewDTO rDto = new ReviewDTO();
		rDto.setId(id);
		rDto.setImg(bDto.getImg());
		rDto.setBookname(bDto.getBookname());
		rDto.setReview("-");
		rDto.setStar(0);
		rDto.setRecommend(0);
		rDto.setComplain(0);
		rDto.setReviewDate("-");
		repository.revInsert(rDto);

		PaymentDTO pDto = new PaymentDTO();
		pDto.setId(id);
		pDto.setImg(bDto.getImg());
		pDto.setBookname(bookname);
		pDto.setPrice(bDto.getPrice());
		pDto.setPublisher(bDto.getPublisher());

		repository.paymentInsertOne(pDto);


		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setCash(cash);
		CartDTO cart=new CartDTO();
		cart.setId(mDto.getId());
		cart.setBookname(bookname);
		repository.cartDeleteOne(cart);
		MemberDTO mem = (MemberDTO) repository.selectOne("mem.selectOne", mDto);
		AccountDTO accdto = new AccountDTO();
		accdto.setBook(bDto);
		accdto.setGender(mem.getGender());

		updateGreade(mDto);
		repository.cashUpdate(mDto);
		repository.insertOne("pay.accOne", accdto);
		return "redirect:buyList";
	}


	private void updateGreade(MemberDTO mem){
		PaymentDTO pp=(PaymentDTO) repository.selectOne("pay.paycount", mem);
		if(pp.getPrice()>=600000){
			mem.setGrade("도서관");
			repository.memUpdateLebvel(mem);
		}else if(pp.getPrice()>=300000){
			mem.setGrade("서점");
			repository.memUpdateLebvel(mem);
		}
	}

}
