package member.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import member.bean.ItemDTO;
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
	public void sellerWrite(@ModelAttribute ItemDTO itemDTO, @RequestParam("img[]") List<MultipartFile> list) {
		String filePath ="D:\\git_home\\Pmang\\pmang_Project\\src\\main\\webapp\\storage";
		
		for(MultipartFile img: list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			itemDTO.setImg1(fileName);
			itemDTO.setImg2("");
			itemDTO.setImg3("");
			
			//DB
			memberService.sellerWrite(itemDTO);
		}
	}
	
	
	

}
