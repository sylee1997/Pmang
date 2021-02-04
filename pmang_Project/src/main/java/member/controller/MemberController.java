package member.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;


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
