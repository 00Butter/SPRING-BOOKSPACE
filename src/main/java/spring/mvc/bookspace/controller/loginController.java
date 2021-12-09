package spring.mvc.bookspace.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.repository.LoginRepository;
import spring.mvc.bookspace.service.MemberService;

@Controller
@RequestMapping("login/")
public class loginController {


	private String basePath = "/WEB-INF/views/member/login";

	@Autowired
	private LoginRepository repository;
	@Autowired
	private MemberService service;


	@RequestMapping("check/*")
	@ResponseBody
	public Object checkWork(HttpServletRequest request){
		String msg="nono";
		String url=request.getServletPath();

		if(url.contains("id")){
			// 디비에서 아이디조회
			String id=request.getParameter("id");
			Object obj=repository.checkid(id);
			if(obj==null){
				return "ok";
			}
		}else if(url.contains("license")){
			// 디비에서 사업자번호 조회
			String license=request.getParameter("license").trim();
			Object obj=repository.checkLicense(license);
			PublisherDTO dto=(PublisherDTO) obj;
			if(dto==null){
				return "ok";
			}			
		}		
		return msg;
	}

	@RequestMapping(value="pubJoin",method=RequestMethod.POST)
	public String pubJoin(PublisherDTO dto,ModelMap map){
		int res=service.insertOne("pub", dto);
		if(res>0){
			res=service.insertOne("log", dto);
			if(res>0){
				map.addAttribute("joinmsg", "회원가입성공");
			}
		}else{
			map.addAttribute("joinmsg", "회원가입에 실패하였습니다. 다시시도해주세요");
		}
		map.addAttribute("main", basePath+"/joinComp.jsp");
		return "home";
	}

	@RequestMapping(value="pubJoin",method=RequestMethod.GET)
	public String pubJoinGo(ModelMap map) {
		map.addAttribute("main", basePath + "/pubJoin.jsp");
		return "home";
	}
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginGo(ModelMap map){
		map.addAttribute("main", basePath+"/loginForm.jsp");
		return "home";
	}
	@RequestMapping(value="logout")
	public String logoutWork(HttpServletRequest request){
		request.getSession().invalidate();

		return "redirect:/home";
	}

	@RequestMapping(value="loginForm", method=RequestMethod.POST)
	public String loginCheck(MemberDTO dto,
			HttpServletRequest request, ModelMap map){
		String type=repository.loginCheck(dto);
		if(type==null){
			map.addAttribute("msgpop", "로그인에 실패하였습니다.");

		}else{
			HttpSession session=request.getSession();
			if(type.equals("mem")){			
				session.setAttribute("login", dto.getId());
				service.insertOne("visit", null);
			}else if(type.equals("pub")){
				session.setAttribute("publog", dto.getId());
				String name=repository.selectPubName(dto.getId());
				session.setAttribute("pubname", name);
				service.insertOne("visit", null);
			}else if(type.equals("admin")){
				session.setAttribute("syslog", "관리자");
			}
			session.setMaxInactiveInterval(10000);
			map.addAttribute("result", "로그인성공");}
		map.addAttribute("main", basePath+"/loginForm.jsp");

		return "home";
	}
	

	@RequestMapping(value="clause")
	public String clause(ModelMap map){
		map.addAttribute("main", basePath+"/clause.jsp");
		return "home";
	}

	@RequestMapping(value="choiceJoin")
	public String choiceJoin(ModelMap map){
		map.addAttribute("main", basePath+"/choiceJoin.jsp");
		return "home";
	}


	@RequestMapping(value="joinComp")
	public String joinComp(ModelMap map){
		map.addAttribute("main", basePath+"/joinComp.jsp");
		return "home";
	}

	@RequestMapping(value="findidpw")
	public String findidpw(){
		return "member/login/findidpw";
	}

	@RequestMapping(value = "peoJoin", method = RequestMethod.GET)
	public String peojoin(ModelMap map) {
		map.addAttribute("main", basePath + "/peoJoin.jsp");
		return "home";
	}

	@RequestMapping(value = "peoJoin", method = RequestMethod.POST)
	public String peoJoin(ModelMap map, MemberDTO dto) {
		dto.setGrade("책장");
		int res = service.insertOne("mem", dto);
		if(res>0){
			res=service.insertOne("logmem", dto);
			if(res>0){
				map.addAttribute("joinmsg", "회원가입성공");
				service.insertOne("joindata", dto.getGender().equals("man")?"남":"여");
			}
		}else{
			map.addAttribute("joinmsg", "회원가입에 실패하였습니다. 다시시도해주세요");
			return "";
		}
		map.addAttribute("main", basePath+"/joinComp.jsp");
		return "home";
	}

	@RequestMapping(value = "idck")
	@ResponseBody
	public String idck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String res = (String) repository.checkid(id);
		return res;
	}
}
