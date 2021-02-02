package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ReviewDTO;
import board.service.BoardService;
import member.bean.SellerDTO;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "itemBoard", method = RequestMethod.GET)
	public String itemBoard(Model model) {
		model.addAttribute("display", "/pm_itemBoard/itemBoard.jsp");
		return "/index";
	}
	//-------------------mystote------------------------
	@RequestMapping(value = "mystore", method = RequestMethod.GET)
	public String mystore(HttpSession session,Model model) {
		//나중에 세션 받아와야함.
		//String userkey=(String)session.getAttribute("memId");
		int userkey=1;
		SellerDTO sellerDTO=boardService.getMystore(userkey);
		
		
		model.addAttribute("sellerDTO",sellerDTO);
		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getMystore",method=RequestMethod.POST)
	public ModelAndView getMystore(HttpSession session,
			@CookieValue(value="memHit",required=false) Cookie cookie,HttpServletResponse response)
	{
		//int userkey=session.getAttribute("userkey");
		int userkey=1;
		
		//조회수 - 새로고침방지
		if(cookie!=null) {
			boardService.mystoreHitUpdate(userkey);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		SellerDTO sellerDTO=boardService.getMystore(userkey);

		ModelAndView mav=new ModelAndView();
		mav.addObject("sellerDTO",sellerDTO);
		mav.addObject("userkey",userkey);
		mav.setViewName("jsonView");
		
		return mav;
	}

	@RequestMapping(value = "mystoreTab1", method = RequestMethod.GET)
	public String mystoreTab1() {

		return "/pm_mystore/tab1";
	}

	@RequestMapping(value = "mystoreTab2", method = RequestMethod.GET)
	public String mystoreTab2() {

		return "/pm_mystore/tab2";
	}

	@RequestMapping(value = "mystoreTab3", method = RequestMethod.GET)
	public String mystoreTab3() {

		return "/pm_mystore/tab3";
	}
	
	@RequestMapping(value="mystoreModify",method=RequestMethod.POST)
	@ResponseBody
	public void mystoreModify(@RequestParam String marketname, @RequestParam String marketcontent) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("marketname", marketname);
		map.put("pf_content", marketcontent);
		
		boardService.mystoreModify(map);
	}
	
	@RequestMapping(value="profileImgModify",method=RequestMethod.POST)
	@ResponseBody
	public void profileImgModify(@ModelAttribute SellerDTO sellerDTO,
							  @RequestParam("img") MultipartFile img) {
		String filePath="C:\\project\\Pmang\\pmang_Project\\src\\main\\webapp\\storage";
		String fileName=img.getOriginalFilename();
		File file=new File(filePath,fileName);
		
		//파일복사
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		sellerDTO.setPf_photo(fileName);
		
		//db
		boardService.profileImgModify(sellerDTO);
	}

	//-----------------------mystore
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(Model model) {
		model.addAttribute("display", "/pm_notice/notice.jsp");
		return "/index";
	}

	@RequestMapping(value = "itemView", method = RequestMethod.GET)
	public String itemView(Model model) {
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}

	@RequestMapping(value="reviewWriteForm",method=RequestMethod.GET)
	public String reviewWriteForm() {
		return "/pm_review/reviewWriteForm";
	}
	
	@RequestMapping(value="reviewWrite",method=RequestMethod.POST)
	@ResponseBody
	public void reviewWrite(@ModelAttribute ReviewDTO reviewDTO,@RequestParam("img[]") List<MultipartFile> list) {
		String filePath="C:\\project\\Pmang\\pmang_Project\\src\\main\\webapp\\storage";
		
		for(MultipartFile img:list) {
			String fileName=img.getOriginalFilename();
			File file=new File(filePath,fileName);
			
			//파일복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			reviewDTO.setReviewImg1(fileName);
			reviewDTO.setReviewImg2("");
			reviewDTO.setReviewImg3("");
			
			//db
			boardService.reviewWrite(reviewDTO);
			
		}
	}
}