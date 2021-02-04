package member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
    @Autowired
	private MemberService mailsender;

	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody 
	public String login(@RequestParam Map<String, String> map, HttpSession session) { // 어차피 언젠가는 map으로 묶어야 보낼수있어서 여기서 맵으로 묶었다
		return memberService.login(map, session); // 맵에실어서 리턴값 문자열을 가지고 간다
	}
	
	
    @RequestMapping(value="loginForm")
    public String loginForm(@RequestParam(value = "code", required = false) String code) throws Exception{
        System.out.println("#########" + code);
        return "/member/loginForm";
    }
    
    @RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("display", "/member/logout.jsp");
		return "/index"; 
	}
	
	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeForm() {
		return "/member/writeForm";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model,HttpServletRequest request) throws IOException {
		
		int su = memberService.write(memberDTO);

		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(memberDTO.getEmail1(),memberDTO.getEmail2(), memberDTO.getUserId(), request);
		
		model.addAttribute("su", su);
		model.addAttribute("display", "/member/write.jsp");
		return "/index";
	}
	
	
	@RequestMapping(value="/checkId", 
			produces = "application/String;charset=UTF-8",
			method=RequestMethod.POST)
	public @ResponseBody String checkId(String userId) {
		String result = memberService.checkId(userId);
		return result;
		
	}
	
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}
	
	@RequestMapping(value="checkPostSearch", method=RequestMethod.POST)
	public ModelAndView checkPostSearch(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.checkPostSearch(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "regSuccess", method = RequestMethod.GET)
	public String regSuccess(@RequestParam("userId") String userId, @RequestParam("user_key") String key) {

		mailsender.regSuccess(userId, key); // mailsender의 경우 @Autowired

		return "/member/regSuccess";
		}
	
	// kakao Login
	@RequestMapping(value="kakaoLogin", method=RequestMethod.POST)
	@ResponseBody 
	public String kakaoLogin(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		System.out.println(memberDTO);
		return memberService.kakaoLogin(memberDTO, session);
		
	}
		
	
}
