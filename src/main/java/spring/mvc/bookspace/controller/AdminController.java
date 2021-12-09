package spring.mvc.bookspace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import spring.mvc.bookspace.dto.AccountDTO;
import spring.mvc.bookspace.dto.AdminDTO;
import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.BookRegDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.dto.ReviewDTO;
import spring.mvc.bookspace.dto.TableDataDTO;
import spring.mvc.bookspace.dto.page.TableItemDTO;
import spring.mvc.bookspace.dto.page.TablePageDTO;
import spring.mvc.bookspace.module.FileWorks;
import spring.mvc.bookspace.service.AdminService;

@Controller	
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private TableItemDTO pageDTO;
	@Autowired
	private TablePageDTO tableDTO;
	@Autowired
	private FileWorks filework;
	@Autowired
	private AdminService service;

	private String basePath="/WEB-INF/views/admin/";

	@RequestMapping(value={"home","/"})
	public String setMainView(ModelMap mmap){
		int pubmsg=0;
		int memmsg=0;
		int bookcon=0;
		int bookdel=0;
		
		List<Object> list=service.selectList("admin.memnotread", "one");
		memmsg=list.size();
		list=service.selectList("board.msgnotread", null);
		pubmsg=list.size();
		list=service.selectList("book.regList","등록");
		bookcon=list.size();
		list=service.selectList("book.regList","삭제");
		bookdel=list.size();
		mmap.addAttribute("pubmsg", pubmsg);
		mmap.addAttribute("memmsg", memmsg);
		mmap.addAttribute("bookcon", bookcon);
		mmap.addAttribute("bookdel", bookdel);
		mmap.addAttribute("mainview", basePath+"main.jsp");
		return "adminhome";
	}
	@RequestMapping("bookinsert")
	public String bookInsert(@RequestParam("num") String rcv,ModelMap mmap){
		int num=Integer.parseInt(rcv);
		BookRegDTO dto=null;
		for(Object obj:pageDTO.getList()){
			dto=(BookRegDTO)obj;
			if(dto.getNum()==num) break;
		}
		dto.setPrice(dto.getPrice()*2);
		int res=service.insertOne("admin.bookinsert", dto);
		if(res>0) service.deleteOne("admin.regdelconfirm", dto);

		return "redirect:book/allList";
	}



	@RequestMapping(value="log", method=RequestMethod.POST)
	public RedirectView adminLog(@RequestParam("no") String params,HttpServletRequest request){

		AdminDTO dto=new AdminDTO();
		dto=(AdminDTO)service.selectOne("admin.logOne",Integer.parseInt(params));
		RedirectView rcv=new RedirectView("home");
		if(dto!=null){
			HttpSession session=request.getSession();
			rcv.addStaticAttribute("msgpop", dto.getName()+"관리자님 로그인");;
			session.setAttribute("adminlog", dto.getName());
		}		
		rcv.setExposeModelAttributes(false);	
		return rcv;
	}

	// 책관련
	@RequestMapping(value={"book/*"})
	public String bookListge(HttpServletRequest request){
		String type=request.getServletPath().replaceAll("/admin/book/", "");
		pageDTO.setThead("book");
		String rcv=request.getParameter("num");
		if(rcv!=null){
			int num=Integer.parseInt(rcv);
			String msg="";
			if(type.contains("all")){
				BookDTO dto=null;
				for(Object obj:pageDTO.getList()){
					dto=(BookDTO) obj;
					if(dto.getNum()==num) break;
				}
				if(type.equals("allInfo")){
					request.setAttribute("dto", dto);
					request.setAttribute("all", "all");
					return "admin/bookInfo";
				}else if(type.equals("alldel")){
					int res=service.deleteOne("book.delName", dto.getBookname());
					filework.deleteBook(dto.getBookname());
					msg=res>0?"삭제완료":"삭제실패";
					request.setAttribute("msgpp", msg);
				}
			}else{
				BookRegDTO dto=null;
				for(Object obj:pageDTO.getList()){
					dto=(BookRegDTO) obj;
					if(dto.getNum()==num) break;
				}
				if(type.equals("Info")){
					request.setAttribute("dto", dto);
					return "admin/bookInfo";
				}else if(type.equals("del")){
					int res=service.deleteOne("book.delregName",dto.getBookname());
					res+=service.deleteOne("book.delName", dto.getBookname());
					filework.deleteBook(dto.getBookname());
					msg=res>1?"삭제완료":"삭제실패";
					request.setAttribute("msgpp", msg);
				}
			}}
			ArrayList<Object> booklist=null;
			if(type.equals("allList")){
				booklist=(ArrayList<Object>)service.selectList("book.allList", null);
				request.setAttribute("search", "도서 이름 검색");
				request.setAttribute("searchtype", "bookname");
				pageDTO.setAllRecord(booklist.size());
				pageDTO.setPageSetting(booklist,"all","book");
				request.setAttribute("veiwTitle", "도서 전체 리스트");
			}else if(type.equals("confirmList")){

				booklist=(ArrayList<Object>) service.selectList("book.regList","등록");
				pageDTO.setAllRecord(booklist.size());
				pageDTO.setPageSetting(booklist,"confirm","book");
				request.setAttribute("veiwTitle", "등록 요청 리스트");
			}else if(type.equals("deleteList")){

				booklist=(ArrayList<Object>)service.selectList("book.regList","삭제");
				pageDTO.setAllRecord(booklist.size());
				pageDTO.setPageSetting(booklist,"del","book");
				request.setAttribute("veiwTitle", "삭제 요청 리스트");
			}
			String page=request.getParameter("page");
			if(page !=null){pageDTO.setNowPage(Integer.parseInt(page));}
			else{pageDTO.setNowPage(1);}
			request.setAttribute("dto", pageDTO);
			request.setAttribute("mainview", basePath+"tableex.jsp");
			return "adminhome";
		}

		@RequestMapping("logout")
		public RedirectView adminLogout(HttpServletRequest request){
			request.getSession().invalidate();
			RedirectView rcv=new RedirectView("home");
			rcv.setExposeModelAttributes(false);
			return rcv;
		}
		@RequestMapping("bookup")
		public String bookUpdate(ModelMap mmap,BookDTO book){
			
			int res=service.updateOne("book.bookup", book);
			String msg=res>0?"수정완료":"수정실패";
			mmap.addAttribute("msg", msg);
			return "admin/bookInfo";
		}
		@RequestMapping(value="insertForm",method=RequestMethod.GET)
		public void goview(){	}


		@RequestMapping("join")
		public String adminInsert(AdminDTO dto,ModelMap mmap){
			int res=service.insertOne("admin.insertOne", dto);
			if(res>0){
				return "redirect:home";
			}else{
				return "redirect:insertForm";
			}
		}

		@RequestMapping(value={"member/*"})
		public String memberSet(HttpServletRequest request,ModelMap mmap){
			String type=request.getServletPath().replaceAll("/admin/member/", "");
			String page=request.getParameter("page");

			if(type.equals("selectList")){
				ArrayList<Object> list=null;
				list=(ArrayList<Object>)service.selectList("mem.allList", null);
				pageDTO.setThead("member");
				pageDTO.setPageSetting(list, "list", "member");
				mmap.addAttribute("dto", pageDTO);
				mmap.addAttribute("veiwTitle", "회원 전체 목록");
				mmap.addAttribute("mainview", basePath+"tableex.jsp");
			}else if(type.contains("selectChart")){
				String now=request.getParameter("date");
				ArrayList<Object> list=null;
				tableDTO.setRecordDegree(30);
				int nowPage=1;
				if(now!=null){
					nowPage=Integer.parseInt(now);
					tableDTO.setNowPage(nowPage);
				}else{
					list=(ArrayList<Object>)service.selectList("admin.joindata",null);
					tableDTO.setList(list);
					tableDTO.setNowPage(1);
				}
				String dtolist="";
				for(int i=tableDTO.getStart();i<tableDTO.getEnd();i++){
					TableDataDTO dto=(TableDataDTO)tableDTO.getList().get(i);
					if(dto!=null)
						dtolist+=dto.getJoindate()+"/"+dto.getWoman()+"/"+dto.getMan()+"/";
				}
				mmap.addAttribute("now", nowPage);
				mmap.addAttribute("data", dtolist);
				mmap.addAttribute("veiwTitle", "회원 가입 통계");
				mmap.addAttribute("mainview", basePath+"chart_bar.jsp");
				return "adminhome";
			}else{ 
				String num=request.getParameter("num");
				if(num!=null){
					if(type.equals("Info")){
						MemberDTO dto=(MemberDTO)service.selectOne("mem.selectNum",Integer.parseInt(num));
						mmap.addAttribute("dto", dto);
						return "/member/my/myInfo";
					}else if(type.contains("del")){
						int result=service.deleteOne("mem.deleteNum", Integer.parseInt(num));
						if(result>0){
							mmap.addAttribute("msgpp", "탈퇴 성공.");
						}else{
							mmap.addAttribute("msgpp", "탈퇴 실패");
						}
						mmap.addAttribute("mainview", basePath+"tableex.jsp");
						return "adminhome";
					}else{
						mmap.addAttribute("msgpp", "잘못된 접근입니다.");
					}	}}
			
			if(page!=null){
				pageDTO.setNowPage(Integer.parseInt(page));
				request.setAttribute("dto", pageDTO);
				mmap.addAttribute("veiwTitle", "회원 전체 목록");
				mmap.addAttribute("mainview", basePath+"tableex.jsp");
			}
			return "adminhome";
		}

		@RequestMapping("visitor")
		public String visitorGo(ModelMap mmap){
			ArrayList<Object> list=(ArrayList<Object>) service.selectList("admin.visitList", null);
			String data="";
			for(Object obj:list){
				TableDataDTO dto=(TableDataDTO) obj;
				data+=dto.getVisitdate()+"/"+dto.getCount()+"/";
			}
			mmap.addAttribute("data", data);
			mmap.addAttribute("veiwTitle", "방문자수(최근3개월)");
			mmap.addAttribute("mainview", basePath+"chart_vsitor.jsp");
			return "adminhome";
		}



		@RequestMapping("chart/*")
		public String chartGo(HttpServletRequest request,ModelMap mmap){
			String type=request.getServletPath().replaceAll("/admin/chart/", "");
			mmap.addAttribute("veiwTitle", "도서 선호도");
			if(type.equals("genderChart")){
				ArrayList<Object> list= (ArrayList<Object>)service.selectList("admin.gendercount", null);
				String man="";
				String woman="";
				for(Object obj: list){
					AccountDTO dto=(AccountDTO) obj;
					ArrayList<Object> gender=(ArrayList<Object>) service.selectList("admin.likeGender", dto.getGender());
					if(dto.getGender().equals("man")) man=chatResult(gender, dto.getNum());
					else woman=chatResult(gender, dto.getNum());
				}
				mmap.addAttribute("mainview", basePath+"chart_circle2.jsp");
				mmap.addAttribute("man", man);
				mmap.addAttribute("woman", woman);
			}else {
				
				ArrayList<Object> list=(ArrayList<Object>) service.selectList("admin.likeall", null);
				int total=(Integer)service.selectOne("admin.accCount", null);
				String chart=chatResult(list, total);
				mmap.addAttribute("data", chart);
				mmap.addAttribute("mainview", basePath+"chart_circle.jsp");
			}
			return "adminhome";
		}
		
		private String chatResult(ArrayList<Object> list,int total){
			String chart="";
			for(Object obj:list){
				AccountDTO dto=(AccountDTO) obj;
				int num=(int) (((double)dto.getNum()/total)*100);
				chart+=dto.getBooktype()+"/"+num+"/";
			}
			return chart;
			
		}

		@RequestMapping("account/*")
		public String accountGo(HttpServletRequest request,ModelMap mmap){
			String year=request.getParameter("year");
			String month=request.getParameter("month");
			if(year!=null && month !=null){
				ArrayList<Object> dtolist=(ArrayList<Object>)service.selectList("admin.searchAc", "%"+year+"-"+month+"%");
				mmap.addAttribute("dtolist", dtolist);
			}

			ArrayList<Object> list=(ArrayList<Object>) service.selectList("admin.allAc", null);
			String chart=null;
			for(int i=0;i<12;i++){
				String day="2016-0"+i;
				if(i>9) day="2016-"+i;
				int price=0;
				for(Object obj:list){
					AccountDTO dto=(AccountDTO) obj;
					if(dto.getRegdate().contains(day)){
						price+=dto.getPrice();
					}
				}
				chart=day+"/"+price+"/";
			}
			ArrayList<Object> yearlist=(ArrayList<Object>) service.selectList("admin.yearAc", null);
			ArrayList<String> yearli=new ArrayList<>();
			for(Object obj:yearlist){
				String date=((AccountDTO) obj).getRegdate();
				String yy=date.split("-")[0];
				if(!yearli.contains(yy))
					yearli.add(yy);
			}
			mmap.addAttribute("yearlist", yearli);
			mmap.addAttribute("data", chart);
			mmap.addAttribute("veiwTitle", "매출 통계");
			mmap.addAttribute("mainview", basePath+"chart_account.jsp");

			return "adminhome";
		}

		@RequestMapping("pub/*")
		public String pubWork(ModelMap mmap, HttpServletRequest request){
			String path=request.getServletPath().replaceAll("/admin/pub", "");
			pageDTO.setThead("pub");
			ArrayList<Object> list=new ArrayList<>();

			String num=request.getParameter("num");
			if(num!=null){
				if(path.contains("del")){
					PublisherDTO dto=(PublisherDTO)service.selectOne("pub.selectOne",Integer.parseInt(num));
					int res=service.deleteOne("pub.deleteLog", dto);
					String name=dto.getName();
					int a=service.deleteOne("admin.bookdel", name); // 책삭제
					int b=service.deleteOne("admin.bookregdel", name); // 책reg삭제
					int c=service.deleteOne("admin.delboard", dto); // 보드삭제
					if(res>0)res+=service.deleteOne("pub.deleteOne",dto);
					if(res>1){
						mmap.addAttribute("msgpp", "삭제완료");
					}else{
						mmap.addAttribute("msgpp", "삭제실패");
					}
				}else if(path.equals("/Info")){
					PublisherDTO dto=null;
					try {
						 dto=(PublisherDTO) service.selectOne("admin.onenumPub",Integer.parseInt(num));
					} catch (Exception e) {
						 dto=(PublisherDTO) service.selectOne("admin.onePub",num);
					}
			
					
					mmap.addAttribute("dto",dto);
					return "publisher/info";
				}}
			if(path.contains("/list")){
				list=(ArrayList<Object>)service.selectList("admin.pubList",null);
				pageDTO.setPageSetting(list, "list", "pub");
				mmap.addAttribute("veiwTitle", "전체 업체 목록");
				mmap.addAttribute("search", "아이디,업체명검색");
				mmap.addAttribute("searchtype", "pub");
			}else if(path.contains("/pay")){
				list=(ArrayList<Object>) service.selectList("admin.accpub", null);

				pageDTO.setThead("pay");
				pageDTO.setPageSetting(list, "pay", "pub");
				mmap.addAttribute("veiwTitle", "업체별 수익 목록");

			}else if(path.contains("/delete")){
				list=(ArrayList<Object>) service.selectList("admin.delpub",null);
				pageDTO.setPageSetting(list, "delete", "pub");
				mmap.addAttribute("veiwTitle", "계약 철회 요청 목록");
			}
			String page=request.getParameter("page");
			if(page!=null) pageDTO.setNowPage(Integer.parseInt(page));
			else pageDTO.setNowPage(1);
			mmap.addAttribute("dto", pageDTO);
			mmap.addAttribute("mainview", basePath+"tableex.jsp");
			return "adminhome";
		}

		@RequestMapping(value="serialfind",produces="text/plain;charset=UTF-8")
		@ResponseBody
		public Object serialCheck(HttpServletRequest request){
			AdminDTO dto=new AdminDTO();
			dto.setName(request.getParameter("name"));
			dto.setPhone(request.getParameter("phone"));
			if(dto.getName()!=null&&dto.getPhone()!=null){
				dto=(AdminDTO)service.selectOne("admin.findOne", dto);
				if(dto==null){
					return null;	
				}else{
					return dto.getSysno()+"";
				}
			}else{
				return null;
			}
		}

		@RequestMapping(value={"nofind"})
		public String serialGo(ModelMap mmap){
			mmap.addAttribute("veiwTitle", "시리얼 넘버 찾기");
			mmap.addAttribute("mainview", basePath+"serialFind.jsp");
			return "adminhome";
		}


		@RequestMapping("board/*")
		public String boardWork(ModelMap mmap, HttpServletRequest request){
			String path=request.getServletPath().replaceAll("/admin/board", "");
			ArrayList<Object> list=null;
			String num=request.getParameter("num");
			if(path.equals("/member")){
				list=(ArrayList<Object>) service.selectList("admin.memboard", "one");
				pageDTO.setThead("board"); 			
				pageDTO.setPageSetting(list, "member", "board");
				mmap.addAttribute("veiwTitle", "회원 문의 목록");
			}else if(path.equals("/complain")){
				list=(ArrayList<Object>) service.selectList("admin.complain", null);
				pageDTO.setThead("complain");		
				pageDTO.setPageSetting(list, "complain", "board");
				mmap.addAttribute("veiwTitle", "신고 내역 ");
			}else if(path.equals("/pubmsg")){
				list=(ArrayList<Object>) service.selectList("board.msgAllList", null);
				pageDTO.setThead("msg");
				pageDTO.setPageSetting(list, "pubmsg", "board");
				mmap.addAttribute("veiwTitle", "업체쪽지함 ");
			}else{
				if(num!=null){
					if(path.equals("/complainInfo")){
						ReviewDTO dto=null;
						for(Object obj:pageDTO.getList()){
							dto=(ReviewDTO) obj;
							if(dto.getNum()==Integer.parseInt(num))
								break;
						}
						mmap.addAttribute("rDto", dto);
						return "book/review/revView";
					}else if(path.contains("Info")){
						BoardDTO dto=null;
						for(Object obj:pageDTO.getList()){
							dto=(BoardDTO) obj;
							if(dto.getNum()==Integer.parseInt(num))
								break;
						}
						mmap.addAttribute("dto", dto);
						return "board/msgForm";
					}else if(path.contains("/complaindel")){
						service.deleteOne("admin.delcomplain", Integer.parseInt(num));
						return "redirect:complain";
					}else if(path.equals("/del")){
						BoardDTO dto=new BoardDTO();
						dto.setNum(Integer.parseInt(num));
						int res=service.deleteOne("board.QnADel", dto);
						mmap.addAttribute("msgpp", res>0? "삭제완료":"삭제실패");
					} 
				}
			}
			String page=request.getParameter("page");
			if(page!=null) pageDTO.setNowPage(Integer.parseInt(page));
			else pageDTO.setNowPage(1);
			mmap.addAttribute("height", 400);
			mmap.addAttribute("dto", pageDTO);
			mmap.addAttribute("mainview", basePath+"tableex.jsp");
			return "adminhome";
		}
		@RequestMapping("msgForm")
		public String msgFormGo(BoardDTO dto,ModelMap mmap){
			mmap.addAttribute("ddto", dto);
			return "board/msgForm";
		}
		@RequestMapping("msginsert")
		public String msgInsert(BoardDTO dto,ModelMap mmap){
			dto.setTitle("[re:]"+dto.getTitle());
			dto.setId("admin");
			dto.setReplynum(1);
			
			
			int res=service.insertOne("board.msgReply", dto);
			dto.setNum(dto.getGroupnum());
			if(res>0){
				service.updateOne("board.countplus", dto);
				mmap.addAttribute("result", "전송 성공");
			}else{
				mmap.addAttribute("result", "전송 실패");
			}
			return "board/msgForm";
		}

		@RequestMapping("setting/*")
		public String adminSetting(ModelMap mmap, HttpServletRequest request){
			String path=request.getServletPath();
			ArrayList<Object> list=new ArrayList<>();		
			if(path.contains("/notice")){
				mmap.addAttribute("mainview", basePath+"noticeForm.jsp");
				mmap.addAttribute("veiwTitle", "공지글 등록 ");
			}else if(path.contains("/insert")){
				mmap.addAttribute("mainview", basePath+"insertForm.jsp");
				mmap.addAttribute("veiwTitle", "관리자 등록 페이지 ");

			}else if(path.contains("/list")){
				list= (ArrayList<Object>)service.selectList("admin.adminList",null);
				pageDTO.setThead("else");
				pageDTO.setPageSetting(list,"setting","else");
				String page=request.getParameter("page");
				if(page!=null) pageDTO.setNowPage(Integer.parseInt(page));
				else pageDTO.setNowPage(1);
				mmap.addAttribute("dto", pageDTO);
				mmap.addAttribute("mainview", basePath+"tableex.jsp");
				mmap.addAttribute("veiwTitle", "관리자 목록 ");	
			}else if(path.contains("/addel")){
				int res=service.deleteOne("admin.delOne",request.getParameter("num"));
				return "redirect:list";
			}

			return "adminhome";
		}
		@RequestMapping(value="search", method=RequestMethod.POST)
		public String searchView(ModelMap mmap,String search,String searchtype){
			ArrayList<Object> list=null;
			String title="";
			if(searchtype.equals("pub")){
				list=(ArrayList<Object>) service.selectList("pub.searchList", "%"+search+"%");
				pageDTO.setPageSetting(list,"list", "pub");
				title="업체 검색 결과";
			}else if(searchtype.equals("bookname")){
				list=(ArrayList<Object>) service.selectList("admin.searchBookList", "%"+search+"%");
				pageDTO.setPageSetting(list,"all","book");
				title="도서 검색 결과";
			}
			mmap.addAttribute("dto", pageDTO);
			mmap.addAttribute("veiwTitle", title);
			mmap.addAttribute("mainview", basePath+"tableex.jsp");
			return "adminhome";
		}
		
		@RequestMapping(value="search", method=RequestMethod.GET)
		public String searchView(String page,ModelMap mmap){
			pageDTO.setNowPage(Integer.parseInt(page));
			mmap.addAttribute("dto", pageDTO);
			mmap.addAttribute("veiwTitle", "검색결과");
			mmap.addAttribute("mainview", basePath+"tableex.jsp");
			return "adminhome";
		}
		@RequestMapping("cashplus")
		public String plusCash(ModelMap mmap,MemberDTO dto){
			int res=service.updateOne("admin.plusCash", dto);
			if(res>0){
				mmap.addAttribute("fail", "지급 완료");
			}else{
				mmap.addAttribute("fail", "지급 실패");
			}
			return "member/my/myInfo";
		}


	}
