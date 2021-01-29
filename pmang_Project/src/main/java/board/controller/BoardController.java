package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
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
	
	

	
	
}