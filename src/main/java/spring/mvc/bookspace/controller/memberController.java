package spring.mvc.bookspace.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PaymentDTO;
import spring.mvc.bookspace.module.FileWorks;
import spring.mvc.bookspace.repository.MemberRepository;
import spring.mvc.bookspace.service.MemberService;

@Controller
@RequestMapping("member/")
public class memberController {

	private String basePath = "/WEB-INF/views/member/";
	@Autowired
	private FileWorks filework;
	@Autowired
	private MemberRepository repository;

	@Autowired
	private MemberService service;

	@RequestMapping(value="update")
	public String memUpdate(ModelMap map){
		map.addAttribute("main", basePath+"my/memUpdate.jsp");
		return "/home";
	}
	@RequestMapping(value="pwchange")
	public String pwchange(){
		return "member/my/pwchange";
	}




	@RequestMapping(value = "update", method = RequestMethod.GET)//회원 업데이트 하면서 추가해써요
	public ModelAndView memgetUpdate(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("login");
		MemberDTO d = new MemberDTO();
		d.setId(id);

		MemberDTO dto = repository.selectOne(d);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("main", basePath + "my/memUpdate.jsp");
		mav.setViewName("home");

		return mav;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)//회원 업데이트 하면서 추가해써요
	public String memUpdate(ModelMap map, MemberDTO dto) {

		int res = repository.updateOne(dto);

		if (res > 0)
			map.addAttribute("result", "변경완료");
		else
			map.addAttribute("result", "변경 실패");
		map.addAttribute("main", basePath + "my/memUpdate.jsp");
		return "home";
	}

	@RequestMapping(value = "exitguide")
	public String exitguide(ModelMap map) {
		map.addAttribute("main", basePath + "login/exitguide.jsp");
		return "home";
	}

	@RequestMapping(value = "exitrequest")
	public ModelAndView exitrequest(HttpServletRequest request) {

		String id = (String) request.getSession().getAttribute("login");

		MemberDTO dto = new MemberDTO();  
		dto.setId(id);

		MemberDTO dto2 = repository.selectOne(dto);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto2);
		mav.addObject("main", basePath + "login/exitrequest.jsp");
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value = "exitcomp")
	public String exitcomp(ModelMap map) {
		map.addAttribute("main", basePath + "login/exitcomp.jsp");
		return "home";
	}

	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String memdelete(ModelMap map, MemberDTO dto, HttpServletRequest request) {
		int res = service.deleteOne("mem", dto);
		if(res>0){
		request.getSession().invalidate();
		}else{
			map.addAttribute("msgpop", "탈퇴실패");
		}
		map.addAttribute("main", basePath + "login/exitcomp.jsp");
		return "home";
	}
	
	

	@RequestMapping(value = "findId", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public Object findId(HttpServletRequest request, ModelMap map) {

		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setBirth(request.getParameter("birth"));

		if (dto.getName() != null && dto.getBirth() != null) {
			dto = (MemberDTO) service.selectOne1("findOne1", dto);

			if (dto == null) {
				map.addAttribute("msgpop", "찾는 아이디가 없습니다.");
				map.addAttribute("main", basePath + "login/loginForm.jsp");
				return "home";
			} else {

				String result = dto.getId();
				map.addAttribute("msgpop", "찾으시는 아이디 : " + result);
				map.addAttribute("main", basePath + "login/loginForm.jsp");
				return "home";

			}
		} else {
			return null;
		}
	}

	@RequestMapping(value = "findPw", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public Object findPw(HttpServletRequest request, ModelMap map) {

		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setBirth(request.getParameter("birth"));
		dto.setPhone(request.getParameter("phone"));
		if (dto.getId() != null && dto.getBirth() != null && dto.getPhone() != null) {
			dto = (MemberDTO) service.selectOne2("findOne2", dto);
			if (dto == null) {
				map.addAttribute("msgpop", "입력하신 정보의 비밀번호가 없습니다. 다시 확인해주세요.");
				map.addAttribute("main", basePath + "login/loginForm.jsp");
				return "home";
			} else {
				String result = dto.getPw();
				map.addAttribute("msgpop", "찾으시는 비밀번호 : " + result);
				map.addAttribute("main", basePath + "login/loginForm.jsp");
				return "home";
			}
		} else {
			return null;
		}

	}
	
	//paymentDTO(책이름,책갈피) 만화인지아닌지 cartoon 책사이즈 (용량) 이미지배열-page
	@RequestMapping("mybook")
	public String viewList(HttpServletRequest request,ModelMap map){
		
		String id=(String) request.getSession().getAttribute("login");
		if(id!=null){
			ArrayList<BookDTO> list=(ArrayList<BookDTO>)repository.selectBookList("mem.mybookList",id);
			map.addAttribute("list", list);
			
		}
		map.addAttribute("main", basePath + "book/bookCase.jsp"); //뷰이름
		return "home";
	}
	
	@RequestMapping("caseOne")
	public String viewOne(HttpServletRequest request,ModelMap map){
		String bookname=request.getParameter("bookname");
		if(bookname!=null){
			BookDTO book=(BookDTO) repository.selectBook("mem.BookOne", bookname);
			ArrayList<Object> list=(ArrayList<Object>) repository.selectList("mem.myBook",
					(String)request.getSession().getAttribute("login"));
			PaymentDTO dto=null;
			for(Object obj:list){
				dto=(PaymentDTO) obj;
				if(dto.getBookname().equals(bookname)) break;
			}
			if(book.getMaintype().equals("만화")){
				map.addAttribute("cartoon", "dddd");
			}
			String[] page=filework.fileList(bookname);
			map.addAttribute("length", page.length);
			map.addAttribute("page", page);
			map.addAttribute("dto", dto);
			
		}
		return "member/book/bookView"; // jsp이름
		

	}
	
	  @RequestMapping(value = "bookmark")
	   @ResponseBody
	   public String d(@RequestParam("id") String id, @RequestParam("bookname")  String bookname, 
	         @RequestParam("num") String num) {
	      
	      PaymentDTO dto = new PaymentDTO();
	      dto.setId(id);
	      dto.setBookmark(num);
	      dto.setBookname(bookname);
	      
	      int res = repository.bookmark(dto);

	      return res+"";
	   }
	
}
