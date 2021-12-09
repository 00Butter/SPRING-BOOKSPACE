package spring.mvc.bookspace;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.OfficialDTO;
import spring.mvc.bookspace.dto.page.PageDTO;
import spring.mvc.bookspace.repository.BoardRepository;
import spring.mvc.bookspace.repository.BookRepository;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private PageDTO pdto;


	@Autowired
	private BookRepository repository;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Cookie[] ck=request.getCookies();
		if(ck!=null && ck.length>0){
			for(Cookie ckc:ck){
				if(ckc.getName().equals("pop10")){
					model.addAttribute("popup", ckc.getValue());
				}
			}
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		List<BookDTO> best = repository.best();
		List<BookDTO> newB = repository.newB();
		List<BookDTO> magz = repository.magz();
		List<BookDTO> cartoon = repository.cartoon();

		model.addAttribute("best", best);
		model.addAttribute("newB", newB);
		model.addAttribute("magz", magz);
		model.addAttribute("cartoon", cartoon);

		return "home";
	}

	@RequestMapping("/cshome") 
	public ModelAndView cservive(@RequestParam(value = "nowPage", required = false) String nowPage) {
		ModelAndView mav = new ModelAndView();
		pdto = new PageDTO();
		List<OfficialDTO> rep = repository.selectList();
		if (nowPage == null) {
			pdto.setNowPage(1);
		} else {
			pdto.setNowPage(Integer.parseInt(nowPage));
			mav.addObject("official", "fd");
		}   
		pdto.setCountRecord(rep.size());
		ArrayList<OfficialDTO> rep2 = new ArrayList<>();
		for (int i = pdto.getStartNum() - 1; i <= pdto.getEndNum() - 1; i++) {
			rep2.add(rep.get(i));
		}    
		mav.addObject("list", rep2); 
		mav.addObject("pDto", pdto); 
		mav.addObject("main", "/WEB-INF/views/cs/Cservice.jsp");
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("nopop")
	   public String nopop(HttpServletResponse response, ModelMap map) {

	      Cookie ck = new Cookie("pop10", "no popView");
	      ck.setMaxAge(600);
	      response.addCookie(ck);
	      map.addAttribute("no", "fd");
	      return "pop";
	   }
	@RequestMapping("pop")
	public void popup(){
		
	}
	
	@RequestMapping("star")
	public String stargo(ModelMap map){
		
		map.addAttribute("main", "/WEB-INF/views/cs/star.jsp");
		return "home";
	}
	
	

}
