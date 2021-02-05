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

import board.bean.BoardPaging;
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
	public ModelAndView getitemBoardList(@RequestParam(required=false, defaultValue="1") String pg, @RequestParam Map<String, String> map) {
		System.out.println(map.get("category1"));
		System.out.println(map.get("category2"));
		System.out.println(map.get("category3"));
		List<ItemDTO> list = boardService.getItemBoardList(map);
		
		//전체 카테고리 수 구하기
		int entireItemNum = boardService.getEntireItemNum(map);
		
		//페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg, map);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("itemBoardList", list);
		mav.addObject("entireItemNum", entireItemNum);
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
	
	@RequestMapping(value="getOrderbyItem", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getOrderbyItem(@RequestParam Map<String, String> map) {
		
		List<Object> list = boardService.getOrderbyItem(map);
		int entireItemNum = boardService.getEntireItemNum(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderbylist", list);
		mav.addObject("entireItemNum", entireItemNum);
		mav.setViewName("jsonView");
		
		return mav;
		
	}

	
	
}