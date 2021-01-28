package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

@RequestMapping(value="member")
public class MemberController {

	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/pm_writeForm/checkPost";
	}

	
	@RequestMapping(value="sellerWriteForm", method=RequestMethod.GET)
	public String sellerWriteForm(Model model) {
		model.addAttribute("display", "/pm_sellerWriteForm/sellerWriteForm.jsp");
		return "/index";
	}
	
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String notice(Model model) {
		model.addAttribute("display", "/pm_writeForm/writeForm.jsp");
		return "/index";
	}
	
	
	

}
