package board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="itemBoard", method=RequestMethod.GET)
	public String itemBoard(Model model) {
		model.addAttribute("display", "/pm_itemBoard/itemBoard.jsp");
		return "/index";
	}
	
	@RequestMapping(value="mystore", method=RequestMethod.GET)
	public String mystore(Model model) {
		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}
	
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String notice(Model model) {
		model.addAttribute("display", "/pm_notice/notice.jsp");
		return "/index";
	}
	
	@RequestMapping(value="itemView", method=RequestMethod.GET)
	public String itemView(Model model) {
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getitemBoardList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getitemBoardList(@RequestParam Map<String, String> map) {
		System.out.println(map.get("category1"));
		System.out.println(map.get("category2"));
		System.out.println(map.get("category3"));
		List<ItemDTO> list = boardService.getItemBoardList(map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("itemBoardList", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="getItemBoardCount", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getItemBoardCount(@RequestParam Map<String, String> categoryMap) {
		
		List<Object> list = boardService.getItemBoardCount(categoryMap);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ctgMapList", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	

	
	
}