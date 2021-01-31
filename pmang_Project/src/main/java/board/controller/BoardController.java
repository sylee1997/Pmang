package board.controller;

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
	
	@Autowired
	private ItemDTO itemDTO;
	
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
	public String itemView(@RequestParam String item_seq, Model model) {
		
		model.addAttribute("item_seq", item_seq);
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}
	
	@RequestMapping(value="getItem", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getItem(@RequestParam String seq) {

		itemDTO = boardService.getItem("999");
		
		ModelAndView mav = new ModelAndView();
		//임의로 입력한 값 999, click한 상품의 item_seq가 parameter로 들어와야 함.
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
				
		return mav;
	}

	
	
}