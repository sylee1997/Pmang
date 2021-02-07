package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
=======

import org.springframework.util.FileCopyUtils;
>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026
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
    @Autowired
    private PasswordEncoder passwordEncoder;
    private String pwd;
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody 
<<<<<<< HEAD
	public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
		String userId = memberDTO.getUserId();
		pwd = memberDTO.getPwd();
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("pwd", passwordEncoder.encode(pwd));

		return memberService.login(map, session); // 맵에실어서 리턴값 문자열을 가지고 간다
=======
	public String login(@RequestParam Map<String, String> map, HttpSession session) { // �뼱李⑦뵾 �뼵�젨媛��뒗 map�쑝濡� 臾띠뼱�빞 蹂대궪�닔�엳�뼱�꽌 �뿬湲곗꽌 留듭쑝濡� 臾띠뿀�떎
		return memberService.login(map, session); // 留듭뿉�떎�뼱�꽌 由ы꽩媛� 臾몄옄�뿴�쓣 媛�吏�怨� 媛꾨떎
>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026
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
		memberDTO.setPwd(passwordEncoder.encode(memberDTO.getPwd()));
		int su = memberService.write(memberDTO);

		// �씤利� 硫붿씪 蹂대궡湲� 硫붿꽌�뱶
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
	
<<<<<<< HEAD
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
=======
	// e-mail �씤利� 而⑦듃濡ㅻ윭
	@RequestMapping(value = "regSuccess", method = RequestMethod.GET)
	public String regSuccess(@RequestParam("userId") String userId, @RequestParam("user_key") String key) {

		mailsender.regSuccess(userId, key); // mailsender�쓽 寃쎌슦 @Autowired

		return "/member/regSuccess";
		}
	
	// kakao Login
	@RequestMapping(value="kakaoLogin", method=RequestMethod.POST)
	@ResponseBody 
	public String kakaoLogin(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		System.out.println(memberDTO);
		return memberService.kakaoLogin(memberDTO, session);
		
>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026
	}
	
	@RequestMapping(value="checkPostSearch", method=RequestMethod.POST)
	public ModelAndView checkPostSearch(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.checkPostSearch(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
<<<<<<< HEAD
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "regSuccess", method = RequestMethod.GET)
	public String regSuccess(@RequestParam("userId") String userId, @RequestParam("user_key") String key) {
=======
	
	//------------------------------------seller------------------------------------------------------//
	
	@RequestMapping(value="sellerWriteForm", method=RequestMethod.GET)
	public String sellerWriteForm(Model model) {
		model.addAttribute("display", "/pm_sellerWriteForm/sellerWriteForm.jsp");
		return "/index";
	}
		
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
		
		UUID uuid = UUID.randomUUID(); //以묐났 �뙆�씪�씠由� 諛⑹�瑜� �쐞�븳 uuid�꽕�젙
		

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
>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026

		mailsender.regSuccess(userId, key); // mailsender의 경우 @Autowired

		return "/member/regSuccess";
		}
	
	// kakao Login
	@RequestMapping(value="kakaoLogin", method=RequestMethod.POST)
	@ResponseBody 
	public String kakaoLogin(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		return memberService.kakaoLogin(memberDTO, session);
		
	}
<<<<<<< HEAD
		
	
=======

>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026
}




