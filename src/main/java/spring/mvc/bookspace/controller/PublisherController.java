package spring.mvc.bookspace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.AccountDTO;
import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.dto.page.PageDTO;
import spring.mvc.bookspace.repository.PublisherRepository;

@Controller
@RequestMapping("/corp")
public class PublisherController {
	private PageDTO pdto;
	@Autowired
	private PublisherRepository repository;
	
	private String basePath="/WEB-INF/views/publisher/";
	
	@RequestMapping("exitre")
	public String extireGo(HttpServletRequest request){
		HttpSession session =request.getSession();
		String id=(String) session.getAttribute("publog");
		String pw=request.getParameter("pw");
		PublisherDTO dto=new PublisherDTO();
		dto.setId(id);
		dto.setPw(pw);
		int res= repository.updateOne("pub.pubdelup", dto);
		if(res>0){
			session.invalidate();
			request.setAttribute("main", "/WEB-INF/views/member/login/exitcomp.jsp");
		}else{
		request.setAttribute("main", "/WEB-INF/views/member/login/exitrequest.jsp");
	
		}
		return "home";
	}
	@RequestMapping("exitrequest")
	public ModelAndView gogo(HttpServletRequest request){
		String id = (String) request.getSession().getAttribute("publog");

		PublisherDTO dto=(PublisherDTO) repository.selectOne("pub.selectId", id);

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("main", "/WEB-INF/views/member/login/exitrequest.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("myinfo")
	public String myInfo(ModelMap mmap,HttpSession session){
		String param=(String) session.getAttribute("publog");
		PublisherDTO dto=(PublisherDTO)repository.selectOne("pub.selectId", param);
		mmap.addAttribute("dto", dto);
		mmap.addAttribute("main", basePath+"info.jsp");
		return "home";
	}
	@RequestMapping("update")
	public String updatePub(PublisherDTO dto,ModelMap mmap){
		int res=repository.updateOne("pub.pubUpdate", dto);
		res+=repository.updateOne("pub.updateLog", dto);
		if(res>1){
			mmap.addAttribute("msgpop", "수정 완료");
		}else{
			mmap.addAttribute("msgpop", "수정 실패");	
		}
		mmap.addAttribute("main", basePath+"info.jsp");
		return "home";
	}
	
	@RequestMapping("join")
	public String joinForm(ModelMap mmap){
		mmap.addAttribute("main", basePath+"insertForm.jsp");
		return "home";
	}
	
	@RequestMapping("account")
	public String accountForm(ModelMap mmap,HttpServletRequest request){
		
		String name=(String) request.getSession().getAttribute("pubname");
		ArrayList<Object> alllist=(ArrayList<Object>) repository.selectList("pub.accountPub",name);
		ArrayList<AccountDTO> list=null;
		String chart="";
		String day=request.getParameter("day");
		ArrayList<String> years=new ArrayList<>();
		if(day!=null){
			for(Object obj:alllist){
				AccountDTO dto=(AccountDTO) obj;
				String year=dto.getRegdate().split("-")[0];
				if(!years.contains(year))years.add(year);
				if(dto.getRegdate().contains(day)){
					if(list==null) list=new ArrayList<>();
					list.add(dto);
					chart+=dto.getRegdate()+"/"+dto.getCost()+"/";
				}
			}
		}else{
			int i=0;
			int end=30;
			for(Object obj:alllist){
				AccountDTO dto=(AccountDTO) obj;
				String year=dto.getRegdate().split("-")[0];
				if(!years.contains(year))years.add(year);
				if(i<end) {
					if(list==null) list=new ArrayList<>();
					chart+=dto.getRegdate()+"/"+dto.getCost()+"/";
					list.add(dto);
				}
				i++;
			}
		}
		mmap.addAttribute("list", list);
		mmap.addAttribute("years", years);
		mmap.addAttribute("chart", chart);
		mmap.addAttribute("main", basePath+"pubaccount.jsp");
		return "home";
	}
	@RequestMapping("msg")
	public String msgForm(ModelMap mmap){
		mmap.addAttribute("main", basePath+"msgList.jsp");
		return "home";
	}
	@RequestMapping("qnaList")
	public ModelAndView qnaListGo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		pdto = new PageDTO();
		String nowPage=request.getParameter("nowPage");
		BoardDTO dto=new BoardDTO();
		dto.setId((String)request.getSession().getAttribute("pubname"));
		dto.setBoardtype("pub");
		List<BoardDTO> rep = repository.selectqna(dto);
		if (nowPage == null) {
			pdto.setNowPage(1);
		} else {
			pdto.setNowPage(Integer.parseInt(nowPage));
		}
		pdto.setCountRecord(rep.size());
		ArrayList<BoardDTO> rep2 = new ArrayList<>();
		for (int i = pdto.getStartNum() - 1; i <= pdto.getEndNum() - 1; i++) {
			rep2.add(rep.get(i));
		} 

		mav.addObject("list", rep2);
		mav.addObject("pDto", pdto);
		mav.addObject("main", basePath + "puBoard.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public Object findId(HttpServletRequest request, ModelMap map) {

		PublisherDTO dto=new PublisherDTO();
		dto.setName(request.getParameter("name"));
		dto.setLicense(request.getParameter("license"));
		if (dto.getName() != null && dto.getLicense() != null) {
			dto = (PublisherDTO)repository.selectOne("pub.findId", dto);
			if (dto == null) {
				map.addAttribute("msgpop", "찾는 아이디가 없습니다.");
			} else {
				String result = dto.getId();
				map.addAttribute("msgpop", "찾으시는 아이디 : " + result);
			}
		}
		map.addAttribute("main", "/WEB-INF/views/member/login/loginForm.jsp");
		return "home";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.POST )
	public Object findPw(HttpServletRequest request, ModelMap map) {

		PublisherDTO dto=new PublisherDTO();
		dto.setId(request.getParameter("id"));
		dto.setLicense(request.getParameter("license"));
		dto.setPhone(request.getParameter("phone"));
		
		if (dto.getId() != null && dto.getLicense() != null && dto.getPhone() != null) {
			dto = (PublisherDTO) repository.selectOne("pub.findPw", dto);
			if (dto == null) {
				map.addAttribute("msgpop", "입력하신 정보의 비밀번호가 없습니다. 다시 확인해주세요.");
			} else {
				String result = dto.getPw();
				map.addAttribute("msgpop", "찾으시는 비밀번호 : " + result);
			}
		} 
		map.addAttribute("main", "/WEB-INF/views/member/login/loginForm.jsp");
		return "home";

	}
	
	
	
	
}
