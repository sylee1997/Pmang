package member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;
import data.url.Base64Utils;
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

	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/pm_writeForm/checkPost";
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
	
	
	@RequestMapping(value="/checkId", produces = "application/String;charset=UTF-8",method=RequestMethod.POST)
	public @ResponseBody String checkId(String userId) {
		String result = memberService.checkId(userId);
		return result;
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
	
	@RequestMapping(value="checkPostSearch", method=RequestMethod.POST)
	public ModelAndView checkPostSearch(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.checkPostSearch(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	
	
	
	
	//------------------------------------seller------------------------------------------------------//

		
	@RequestMapping(value="sellerWrite", method=RequestMethod.POST)
	@ResponseBody
	public void sellerWrite(@ModelAttribute ItemDTO itemDTO, HttpServletRequest request, @RequestParam("img1url") String img1url, @RequestParam(value="img2url") String img2url, @RequestParam(value="img3url") String img3url) {
		//String filePath ="http://localhost:8080/pmang/storage";
		
		String filePath = "D:/git_home/Pmang/pmang_Project/src/main/webapp/storage/";
		//D:\git_home\Pmang\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\pmang_Project\storage;
		//System.out.println(filePath);
		
		/*
		 * URL resource = ClassLoader.getSystemClassLoader().getResource();
		 * "http:/localhost:8080/pmang/storage"); String path = resource.getPath();
		 * System.out.println(path);
		 */
		
		//ServletContext sc = request.getSession().getServletContext();
		//String realPath = request.getServletPath();
		//System.out.println(realPath);
		
		UUID uuid = UUID.randomUUID(); //중복 파일이름 방지를 위한 uuid설정
		

		try {
			byte[] in1 = Base64Utils.decodeBase64ToBytes(img1url);
			File file1 = new File(filePath, uuid.toString()+"_"+itemDTO.getImg1());
			FileCopyUtils.copy(in1, new FileOutputStream(file1));
			itemDTO.setImg1(uuid.toString()+"_"+itemDTO.getImg1());

			byte[] in2 = null;
			byte[] in3 = null;
			if (!img2url.equals("undefined")) {
				in2 = Base64Utils.decodeBase64ToBytes(img2url);
				File file2 = new File(filePath, uuid.toString()+"_"+itemDTO.getImg2());
				FileCopyUtils.copy(in2, new FileOutputStream(file2));
				itemDTO.setImg2(uuid.toString()+"_"+itemDTO.getImg2());
			}

			if (!img3url.equals("undefined")) {
				in3 = Base64Utils.decodeBase64ToBytes(img3url);
				File file3 = new File(filePath, uuid.toString()+"_"+itemDTO.getImg3());
				FileCopyUtils.copy(in3, new FileOutputStream(file3));
				itemDTO.setImg3(uuid.toString()+"_"+itemDTO.getImg3());
			}
			

			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			//DB
			memberService.sellerWrite(itemDTO);
		
	}
		
	@RequestMapping(value="searchlocation", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView searchlocation(@RequestParam String address) {
		List<ZipcodeDTO> zipcodeList = memberService.searchlocation(address);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("list", zipcodeList);
		
		return mav;
	}
	
		
	
}
