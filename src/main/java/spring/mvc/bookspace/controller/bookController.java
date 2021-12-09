package spring.mvc.bookspace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.BookRegDTO;
import spring.mvc.bookspace.dto.ReviewDTO;
import spring.mvc.bookspace.dto.page.TablePageDTO;
import spring.mvc.bookspace.module.FileWorks;
import spring.mvc.bookspace.repository.BookRepository;
import spring.mvc.bookspace.repository.ReviewRepository;

@Controller
@RequestMapping("book/")
public class bookController {

	private String basePath = "/WEB-INF/views/book/";
	@Autowired
	private BookRepository repository;

	@Autowired
	private ReviewRepository rr;
	@Autowired
	private FileWorks filework;
	
	@Autowired
	private TablePageDTO pageDto;
	HashMap<String, List<String>> mlist = null;

	public bookController() {

		mlist = new HashMap<>();
		ArrayList<String> li = new ArrayList<>();
		li.add("추리");
		li.add("로맨스");
		li.add("판타지");
		li.add("역사");
		li.add("고전");
		mlist.put("소설", li);
		li = new ArrayList<>();
		li.add("순정");
		li.add("무협");
		li.add("판타지＆SF");
		li.add("성인만화");
		li.add("액션＆스포츠");
		li.add("코믹");
		li.add("공포");
		mlist.put("만화", li);
		li = new ArrayList<>();
		li.add("경영");
		li.add("교양");
		li.add("패션뷰티");
		li.add("취미");
		li.add("성인");
		mlist.put("잡지", li);
		li = new ArrayList<>();
		li.add("성공");
		li.add("리더십");
		li.add("창업");
		li.add("인간관계");
		mlist.put("자기계발", li);
		li = new ArrayList<>();
		li.add("국내");
		li.add("해외");
		mlist.put("여행", li);
		li = new ArrayList<>();
		li.add("영어");
		li.add("중국어");
		li.add("일본어");
		li.add("그 외");
		mlist.put("외국어", li);
		li = new ArrayList<>();
		li.add("불교");
		li.add("가톨릭");
		li.add("기독교");
		li.add("기타");
		mlist.put("종교", li);
	}

	@RequestMapping(value = { "novel", "cartoon", "magazine", "selfcon", "travel", "lang", "religion" })
	public String c1(ModelMap mmap, HttpServletRequest request) {

		String svlPath = request.getServletPath();
		String main = svlPath.replaceAll("/book/", "");
		List<BookDTO> list = null;
		if (main.equals("novel")) {
			list = repository.selectMainList("소설");
			mmap.addAttribute("name", "소설");
			mmap.addAttribute("mlist", mlist.get("소설"));
		} else if (main.equals("cartoon")) {
			list = repository.selectMainList("만화");
			mmap.addAttribute("name", "만화");
			mmap.addAttribute("mlist", mlist.get("만화"));
		} else if (main.equals("magazine")) {
			list = repository.selectMainList("잡지");
			mmap.addAttribute("name", "잡지");
			mmap.addAttribute("mlist", mlist.get("잡지"));
		} else if (main.equals("selfcon")) {
			list = repository.selectMainList("자기계발");
			mmap.addAttribute("name", "자기계발");
			mmap.addAttribute("mlist", mlist.get("자기계발"));
		} else if (main.equals("travel")) {
			list = repository.selectMainList("여행");
			mmap.addAttribute("name", "여행");
			mmap.addAttribute("mlist", mlist.get("여행"));
		} else if (main.equals("lang")) {
			list = repository.selectMainList("외국어");
			mmap.addAttribute("name", "외국어");
			mmap.addAttribute("mlist", mlist.get("외국어"));
		} else if (main.equals("religion")) {
			list = repository.selectMainList("종교");
			mmap.addAttribute("name", "종교");
			mmap.addAttribute("mlist", mlist.get("종교"));
		}
		mmap.addAttribute("main", basePath + "/info/selectList.jsp");
		mmap.addAttribute("list", list);
		return "home";

	}

	@RequestMapping(value = { "추리", "로맨스", "판타지", "역사", "고전", "순정", "무협", "판타지＆SF", "성인만화", "액션＆스포츠", "코믹", "공포", "경영",
			"교양", "패션뷰티", "취미", "성인", "성공", "리더십", "창업", "인간관계", "국내", "해외", "영어", "중국어", "일본어", "그 외", "불교", "가톨릭",
			"기독교", "기타" })
	public String fff(ModelMap map, HttpServletRequest request) {

		String svlPath = request.getServletPath();
		String sub = svlPath.replaceAll("/book/", "");
		String name = null;
		if (sub.equals("추리") || sub.equals("로맨스") || sub.equals("판타지") || sub.equals("역사") || sub.equals("고전")) {
			if (sub.equals("추리")) {
				map.addAttribute("go", "추리");
			} else if (sub.equals("로맨스")) {
				map.addAttribute("go", "로맨스");
			} else if (sub.equals("판타지")) {
				map.addAttribute("go", "판타지");
			} else if (sub.equals("역사")) {
				map.addAttribute("go", "역사");
			} else if (sub.equals("고전")) {
				map.addAttribute("go", "고전");
			}
			name = "소설";
		}
		if (sub.equals("순정") || sub.equals("무협") || sub.equals("판타지＆SF") || sub.equals("성인만화") || sub.equals("액션＆스포츠")
				|| sub.equals("코믹") || sub.equals("공포")) {

			if (sub.equals("순정")) {
				map.addAttribute("go", "순정");
			} else if (sub.equals("무협")) {
				map.addAttribute("go", "무협");
			} else if (sub.equals("판타지＆SF")) {
				map.addAttribute("go", "판타지＆SF");
			} else if (sub.equals("성인")) {
				map.addAttribute("go", "성인만화");
			} else if (sub.equals("액션＆스포츠")) {
				map.addAttribute("go", "액션＆스포츠");
			} else if (sub.equals("코믹")) {
				map.addAttribute("go", "코믹");
			} else if (sub.equals("공포")) {
				map.addAttribute("go", "공포");
			}
			name = "만화";
		}

		if (sub.equals("경영") || sub.equals("교양") || sub.equals("패션뷰티") || sub.equals("취미") || sub.equals("성인")) {
			if (sub.equals("경영")) {
				map.addAttribute("go", "경영");
			} else if (sub.equals("교양")) {
				map.addAttribute("go", "교양");
			} else if (sub.equals("패션뷰티")) {
				map.addAttribute("go", "패션뷰티");
			} else if (sub.equals("취미")) {
				map.addAttribute("go", "취미");
			} else if (sub.equals("성인")) {
				map.addAttribute("go", "성인");
			}
			name = "잡지";
		}

		if (sub.equals("성공") || sub.equals("리더십") || sub.equals("창업") || sub.equals("인간관계")) {
			if (sub.equals("성공")) {
				map.addAttribute("go", "성공");
			} else if (sub.equals("리더십")) {
				map.addAttribute("go", "리더십");
			} else if (sub.equals("창업")) {
				map.addAttribute("go", "창업");
			} else if (sub.equals("인간관계")) {
				map.addAttribute("go", "인간관계");
			}
			name = "자기계발";
		}

		if (sub.equals("국내") || sub.equals("해외")) {
			if (sub.equals("국내")) {
				map.addAttribute("go", "국내");
			} else if (sub.equals("해외")) {
				map.addAttribute("go", "해외");
			}
			name = "여행";
		}

		if (sub.equals("영어") || sub.equals("중국어") || sub.equals("일본어") || sub.equals("lll")) {
			if (sub.equals("영어")) {
				map.addAttribute("go", "영어");
			} else if (sub.equals("중국어")) {
				map.addAttribute("go", "중국어");
			} else if (sub.equals("일본어")) {
				map.addAttribute("go", "일본어");
			} else if (sub.equals("그 외")) {
				map.addAttribute("go", "그 외");
			}
			name = "외국어";
		}

		if (sub.equals("불교") || sub.equals("가톨릭") || sub.equals("기독교") || sub.equals("기타")) {
			if (sub.equals("불교")) {
				map.addAttribute("go", "불교");
			} else if (sub.equals("가톨릭")) {
				map.addAttribute("go", "가톨릭");
			} else if (sub.equals("기독교")) {
				map.addAttribute("go", "기독교");
			} else if (sub.equals("기타")) {
				map.addAttribute("go", "기타");
			}
			name = "종교";
		}
		map.addAttribute("name", name);
		map.addAttribute("mlist", mlist.get(name));
		List<BookDTO> list = repository.selectList(sub);
		map.addAttribute("list", list);
		map.addAttribute("main", basePath + "/info/selectList.jsp");
		return "home";
	}

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(@RequestParam("text") String text, ModelMap map) {
		String a = "%" + text + "%";
		ArrayList<BookDTO> list = (ArrayList<BookDTO>) repository.search(a);
		ArrayList<BookDTO> best = (ArrayList<BookDTO>) repository.bestOne();

		map.addAttribute("list", list);
		map.addAttribute("best", best);
		map.addAttribute("main", basePath + "/info/searchForm.jsp");

		return "home";
	}

	// 이거
	@RequestMapping(value = "stOne", method = RequestMethod.GET)
	public String search2(@RequestParam("num") Integer num, ModelMap map) {

		BookDTO dto = repository.selectOne(num);

		String reviewBN = dto.getBookname();

		ArrayList<ReviewDTO> list = (ArrayList<ReviewDTO>) rr.selectRlist(reviewBN);
		List<ReviewDTO> rlist = new ArrayList<>();

		for (ReviewDTO each : list) {
			if (each.getStar() != 0) {
				rlist.add(each);   
			} 
		}
		String[] imgfile=filework.fileList(dto.getBookname());
		String a = dto.getConlist();
		String[] clist = a.split("/");
		map.addAttribute("rlist", rlist);
		map.addAttribute("clist", clist);
		map.addAttribute("imgname", imgfile);
		map.addAttribute("dto", dto);
		map.addAttribute("main", basePath + "/info/selectInfo.jsp");
		return "home";
	}

	@RequestMapping(value = "insert")
	public String bookInsertGo(HttpServletRequest request, ModelMap map) {
		String id = (String) request.getSession().getAttribute("publog");
		String name = repository.publishName(id);
		map.addAttribute("publisher", name);
		map.addAttribute("main", basePath + "/pub/insertForm.jsp");
		return "home";
	}


	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String postInsertGo(MultipartHttpServletRequest request) {
		String bookname = request.getParameter("bookname");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		String maintype = request.getParameter("maintype");
		String subtype = request.getParameter("subtype");
		int price = Integer.parseInt(request.getParameter("price"));
		MultipartFile upfile = request.getFile("img");
		filework.fileUpload(upfile,bookname);
		String img=filework.filename(bookname);
		
		String conlist = request.getParameter("conlist");
		String story = request.getParameter("story");
		BookRegDTO dto = new BookRegDTO();

		dto.setBookname(bookname);
		dto.setWriter(writer);
		dto.setPublisher(publisher);
		dto.setMaintype(maintype);
		dto.setSubtype(subtype);
		dto.setPrice(price);
		dto.setImg(img);
		dto.setConlist(conlist);
		dto.setStory(story);
		dto.setState("등록");

		repository.insertOne(dto);

		return "redirect:corpList";
	}

	@RequestMapping(value = "corpList")
	public String bookCorpList(ModelMap map, HttpServletRequest request) {
		pageDto.setRecordDegree(10);
		HttpSession session = request.getSession();
		String rcv = (String) session.getAttribute("publog");
		String data = request.getParameter("data");
		
		if (data == null) {
			ArrayList<Object> dto = (ArrayList<Object>) repository.corpList(rcv);
			map.addAttribute("dto", dto);
			map.addAttribute("all", "전체목록");
			pageDto.setList(dto);
			pageDto.setNowPage(1);
		} else {
			ArrayList<Object> dto = (ArrayList<Object>) repository.corpRegList(rcv, data);
			map.addAttribute("dto", dto);
			pageDto.setList(dto);
			pageDto.setNowPage(1);
		}
		String page=request.getParameter("page");
		if(page!=null){
			pageDto.setNowPage(Integer.parseInt(page));
		}
		map.addAttribute("page", pageDto);
		map.addAttribute("main", basePath + "/pub/bookallList.jsp");
		return "home";
	}

	@RequestMapping(value = "sublist")
	public String bookSubListGo(ModelMap map) {
		map.addAttribute("main", basePath + "/info/selectList.jsp");
		return "home";
	}

	@RequestMapping(value = "bookinfo")
	public String selectInfo(ModelMap map) {
		map.addAttribute("main", basePath + "/info/selectInfo.jsp");
		return "home";
	}

	
	@RequestMapping(value="goBook")
	public String goBook(
			@RequestParam("bookname") String bookname
			){
		BookDTO bDto = repository.findBookNum(bookname);
		
		return "redirect:stOne?num=" + bDto.getNum();
	}
	
	  @RequestMapping(value = "detail")
	   public String detailView(ModelMap map, @RequestParam("num") int num) {
	      BookRegDTO dto = (BookRegDTO) repository.detailView(num);
	      map.addAttribute("dto", dto);
	      map.addAttribute("main", basePath + "/info/detailView.jsp");
	      return "home";
	   }
	  @RequestMapping(value = "detailAll")
	   public String detailAll(ModelMap map, @RequestParam("num") int num) {
	      BookDTO alldto = (BookDTO) repository.detailAll(num);
	      map.addAttribute("alldto", alldto);
	      map.addAttribute("main", basePath + "/info/detailView.jsp");
	      return "home";
	   }
	
	  @RequestMapping(value = "delete")
	   public String bookDelete(@RequestParam("data") String num) {
	      BookDTO regdto = (BookDTO)repository.DeleteCk(Integer.parseInt(num));
	      BookRegDTO dto = new BookRegDTO();
	      dto.setBookname(regdto.getBookname());
	      dto.setWriter(regdto.getWriter());
			dto.setPublisher(regdto.getPublisher());
			dto.setMaintype(regdto.getMaintype());
			dto.setSubtype(regdto.getSubtype());
			dto.setPrice(regdto.getPrice());
			dto.setImg(regdto.getImg());
			dto.setConlist(regdto.getConlist());
			dto.setStory(regdto.getStory());
			dto.setState("삭제");
			
			repository.insertOne(dto);
	      return "redirect:corpList";
	   }
	  	@RequestMapping(value="dubcheck")
		@ResponseBody
		public String dubcheck(HttpServletRequest request){
			String bookname = request.getParameter("bookname");
			String res = repository.dubcheck(bookname).size()+"";
			
			return res;
		}

	  	@RequestMapping(value="dubdelete")
		@ResponseBody
		public String dubdelete(HttpServletRequest request){
	  		String bookname = request.getParameter("bookname");
			String res = repository.dubdelete(bookname).size()+"";
			
			return res;
		}

}
