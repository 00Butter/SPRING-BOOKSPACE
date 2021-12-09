package spring.mvc.bookspace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.ReviewDTO;
import spring.mvc.bookspace.dto.page.TablePageDTO;
import spring.mvc.bookspace.repository.ReviewRepository;

@Controller
@RequestMapping("review/")
public class reviewController {

	private String basePath = "/WEB-INF/views/book/review/";
	@Autowired
	private ReviewRepository repository;
	@Autowired
	private TablePageDTO page;

	@RequestMapping("recommend")
	@ResponseBody
	public String recommendUp(HttpServletRequest request, HttpServletResponse resp) {
		Integer num = Integer.parseInt(request.getParameter("num"));
		int res = repository.recommendUpdate(num);
		resp.setCharacterEncoding("UTF-8");

		return res + "";
	}

	@RequestMapping("complain")
	@ResponseBody
	public String complainUp(HttpServletRequest request) {
		Integer num = Integer.parseInt(request.getParameter("num"));
		ReviewDTO dto = new ReviewDTO();
		dto.setNum(num);
		dto = repository.revSelectNum(dto);
		int res = repository.complainUpdate(num, dto.getId());

		return res + "";
	}

	@RequestMapping(value = "reviewList")
	public ModelAndView reviewList( // 수정
			ModelMap map, HttpServletRequest request, @RequestParam(value = "page", required = false) String pagercv) {
		String id = (String) request.getSession().getAttribute("login");

		ReviewDTO rcvRDto = new ReviewDTO();
		rcvRDto.setId(id);
		ArrayList<Object> listc = (ArrayList<Object>) repository.revSelectList(rcvRDto);
		page.setRecordDegree(5);
		
		int nowPage = 1;
		if (pagercv != null) {
			page.setList(listc);
			nowPage = Integer.parseInt(pagercv);
			page.setNowPage(nowPage);
		} else {
			page.setList(listc);
			page.setNowPage(nowPage);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("listc", listc);
		mav.addObject("page", page);

		map.addAttribute("main", basePath + "reviewList.jsp");
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "revDelete")
	public String revDelete(HttpServletRequest request, @RequestParam("num") Integer num) {
		String id = (String) request.getSession().getAttribute("login");

		ReviewDTO rDto = new ReviewDTO();
		rDto.setNum(num);
		rDto.setId(id);
		rDto.setReview("-");
		rDto.setReviewDate("-"); 
		rDto.setStar(0); 
		 
		repository.revDelete(rDto);

		return "redirect:reviewList";
	}

	@RequestMapping(value = "review", method = RequestMethod.GET)
	public ModelAndView review(@RequestParam("num") Integer num) {
		ReviewDTO rcvRDto = new ReviewDTO();
		rcvRDto.setNum(num);

		ReviewDTO rDto = repository.revSelectNum(rcvRDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("rDto", rDto);
		mav.setViewName("book/review/review");

		return mav;
	}

	@RequestMapping(value = "revView", method = RequestMethod.GET)
	public ModelAndView revView(@RequestParam("num") Integer num) {
		ReviewDTO rcvRDto = new ReviewDTO();
		rcvRDto.setNum(num);

		ReviewDTO rDto = repository.revSelectNum(rcvRDto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("rDto", rDto);
		mav.setViewName("book/review/revView");

		return mav;
	}

	@RequestMapping(value = "review", method = RequestMethod.POST)
	public String insertReview(HttpServletRequest request, @RequestParam("bookname") String bookname,
			@RequestParam("star") Integer star, @RequestParam("review") String review,
			@RequestParam("num") Integer num) {
		String id = (String) request.getSession().getAttribute("login");

		ReviewDTO rDto = new ReviewDTO();
		rDto.setId(id);
		rDto.setNum(num);
		rDto.setBookname(bookname);
		rDto.setReview(review);
		rDto.setStar(star);

		repository.revUpdate(rDto);
		repository.revStarSelect(rDto);

		List<Object> listc = repository.revStarSelect(rDto);
		int count = 0;
		int totStar = 0;
		for (int i = 0; i < listc.size(); i++) {
			ReviewDTO dto = (ReviewDTO) listc.get(i);
			if (dto.getStar() != 0) {
				totStar = totStar + dto.getStar();
				count++;
			}
		}
		BookDTO bDto = new BookDTO();
		int totalstar = totStar / count;
		bDto.setBookname(bookname);
		bDto.setTotalstar(totalstar);
		repository.bookStarUpdate(bDto);
		request.setAttribute("msg", "등록 완료");
		return "book/review/review";
	}

}