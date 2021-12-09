package spring.mvc.bookspace.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.OfficialDTO;
import spring.mvc.bookspace.dto.page.PageDTO;
import spring.mvc.bookspace.dto.page.TablePageDTO;
import spring.mvc.bookspace.service.BoardService;

@Controller
@RequestMapping("board/")
public class boardController {

	@Autowired
	private TablePageDTO page;
	@Autowired
	private BoardService service;

	private String basePath = "/WEB-INF/views/board/";

	@RequestMapping(value = "msgForm", method = RequestMethod.GET)
	public void msgGo(ModelMap map, @RequestParam(value = "num", required = false) String rcvnum) {
		if (rcvnum != null) {
			map.addAttribute("msgtitle", "관리자에게 답장하기");
		} else {
			map.addAttribute("msgtitle", "관리자에게 문의하기");
		}
	}

	@RequestMapping(value = "myboard")
	public String myboardList(ModelMap map) {
		map.addAttribute("main", basePath + "myboard.jsp");
		return "home";
	}

	@RequestMapping(value = "msgForm", method = RequestMethod.POST)
	public void msgInsert(BoardDTO dto, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("publog");
		dto.setId(id);
		dto.setReceive("admin");
		dto.setBoardtype("pubmsg");
		int res = service.insertBoard("msg", dto);
		if (res > 0) {
			request.setAttribute("result", "전송완료");
		} else {
			request.setAttribute("result", "전송실패");
		}

	}

	@RequestMapping(value = "QnApub")
	public void pubQnAForm(ModelMap map) {

	}

	@RequestMapping(value = "msgList")
	public String sysmsgList(ModelMap map, @RequestParam(value = "page", required = false) String pagercv,
			HttpServletRequest request) {
		HttpSession session = request.getSession();

		BoardDTO dto = new BoardDTO();
		dto.setBoardtype("pubmsg");
		dto.setId((String) session.getAttribute("publog"));
		ArrayList<Object> msglist = (ArrayList<Object>) service.selectList("msg", dto);
		if (pagercv != null) {
			page.setNowPage(Integer.parseInt(pagercv));
		} else {
			page.setList(msglist);
			page.setNowPage(1);
		}
		map.addAttribute("list", msglist);
		map.addAttribute("page", page);
		map.addAttribute("main", basePath + "msgList.jsp");
		return "home";
	}

	@RequestMapping(value = "msginfo")
	public String msgInfo(ModelMap map, @RequestParam(value = "num", required = false) String num) {
		if (num != null) {
			BoardDTO dto = null;
			for (Object obj : page.getList()) {
				dto = (BoardDTO) obj;
				if (dto.getNum() == Integer.parseInt(num)) {
					break;
				}
			}
			map.addAttribute("dto", dto);
			map.addAttribute("msgtitle", "메시지 내용");
			return "board/msgForm";
		}
		map.addAttribute("error", "잘못된접근");
		return "board/msgForm";
	}

	@RequestMapping(value = "claim")
	@ResponseBody
	public String claim(@RequestParam("title") String title, @RequestParam("textarea") String area,
			@RequestParam("bookname") String bookname, @RequestParam("pub") String pub, @RequestParam("id") String id) {

		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(area);
		dto.setBookname(bookname);
		dto.setReceive(pub);
		dto.setId(id);
		dto.setBoardtype("pub");
		dto.setGroupnum(0);
		dto.setReplynum(0);
		int res = service.insertBoard("board.claim", dto);
		int num = (Integer) service.selectBoard("board.getn", dto);
		dto.setNum(num);
		service.updateBoard("board.numup", dto);
		return String.valueOf(res);

	}

	@RequestMapping(value = "reply")
	public String yap(@RequestParam("title") String title, @RequestParam("textarea") String area,
			@RequestParam("bookname") String bookname, @RequestParam("receive") String pub,
			@RequestParam("id") String id, @RequestParam("num") String num, ModelMap map) {

		BoardDTO dto = new BoardDTO();
		dto.setTitle("[re: ]" + title);
		dto.setContent(area);
		dto.setBookname(bookname);
		dto.setReceive(pub);
		dto.setId(id);
		dto.setGroupnum(Integer.parseInt(num));
		dto.setReplynum(1);
		dto.setBoardtype("pub");
		service.insertBoard("board.claim", dto);
		dto.setNum(dto.getGroupnum());
		service.updateBoard("board.countplus", dto);
		return "redirect:/corp/qnaList";

	}

	@RequestMapping(value = "one")
	@ResponseBody
	public String ya(@RequestParam("title") String title, @RequestParam("contents") String contents,
			@RequestParam String id) {

		BoardDTO dto = new BoardDTO();
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(contents);
		dto.setBoardtype("one");
		dto.setReceive("admin");
		dto.setReplynum(0);
		dto.setGroupnum(0);
		int res = service.insertBoard("board.one", dto);
		int num = (Integer) service.selectBoard("board.getn", dto);
		dto.setNum(num); 
		service.updateBoard("board.numup", dto);
		return String.valueOf(res); 
	}


	@RequestMapping("insertOffi")
	@ResponseBody
	public String wow(ModelMap map, @RequestParam("title") String title, @RequestParam("content") String content) {

		OfficialDTO dto = new OfficialDTO();
		dto.setWriter("관리자");
		dto.setTitle(title);
		dto.setContent(content);

		int res = service.insertBoard("board.off", dto);
		return String.valueOf(res);
	}

	@RequestMapping("pop")
	public void a(@RequestParam("title") String title, @RequestParam("content") String content, ModelMap map) {
		String[] a = content.split("/");
		ArrayList<String> t = new ArrayList<>();
		for (int i = 0; i < a.length; i++) {
			t.add(a[i]);
		}

		map.addAttribute("title", title);
		map.addAttribute("con", t);
	}

	@RequestMapping(value = "QnAForm", method = RequestMethod.GET)
	public String QnAForm(ModelMap map) {
		return "board/QnAForm";
	}

	@RequestMapping(value = "QnApop")
	public String QnApop(ModelMap map, @RequestParam(value = "num") String num) {

		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(num));
		dto = (BoardDTO) service.selectBoard("board.oneBoard", dto);
		if (dto == null) {
			map.addAttribute("error", "잘못된접근");
		} else {
			map.addAttribute("dto", dto);
			map.addAttribute("msgtitle", "메시지 내용");
		}
		return "board/QnApop";
	}

	@RequestMapping("/QnAList")
	public ModelAndView QnAPaging(@RequestParam(value = "nowPage", required = false) String nowPage,
			HttpServletRequest request, MemberDTO memdto) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("login");
		ModelAndView mav = new ModelAndView(); 
		PageDTO dto = new PageDTO();
		ArrayList<Object> rep = (ArrayList<Object>) service.selectList("QnA", id);
		if (nowPage == null) {
			dto.setNowPage(1);
		} else {
			dto.setNowPage(Integer.parseInt(nowPage));
		}
		dto.setCountRecord(rep.size());

		ArrayList<BoardDTO> rep2 = new ArrayList<>();
		for (int i = dto.getStartNum() - 1; i < dto.getEndNum(); i++) {
			rep2.add((BoardDTO) rep.get(i));
		}
		mav.addObject("list", rep2);
		mav.addObject("dto", dto);
		mav.addObject("main", "/WEB-INF/views/board/QnAList.jsp");
		mav.setViewName("home");
		return mav;
	}

	@RequestMapping(value = "QnADelete")
	public String qnaDelete(HttpServletRequest request, @RequestParam("num") Integer num) {
		String id = (String) request.getSession().getAttribute("login");

		BoardDTO dto = new BoardDTO();
		dto.setNum(num);
		dto.setId(id);

		service.deleteQnA(dto);

		return "redirect:QnAList";
	}

}
