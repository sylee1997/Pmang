package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="pm_writeForm")
public class MemberController {
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/pm_writeForm/checkPost";
	}
}
