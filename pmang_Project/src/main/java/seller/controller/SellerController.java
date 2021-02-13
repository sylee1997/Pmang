package seller.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import seller.bean.SellerManagementDTO;
import seller.bean.SellerManagementPaging;
import seller.service.SellerService;

@Controller
@RequestMapping(value="seller")
public class SellerController {
	@Autowired
	private SellerService sellerService;
	
	// -------------------sellerManagement-------------------
	
		@RequestMapping(value = "sellerManagementList", method = RequestMethod.GET)
		public String sellerManagementList(@RequestParam(required = false, defaultValue = "1") String pg, String userid, Model model) {
			model.addAttribute("pg", pg);
			model.addAttribute("userid", userid);
			model.addAttribute("display", "/pm_sellerWriteForm/sellerManagementForm.jsp");
			return "/index";
		}

		@RequestMapping(value = "getSellerManagementList", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView getSellerManagementList(@RequestParam String pg, @RequestParam String userid) {
			List<SellerManagementDTO> list = sellerService.getSellerManagementList(pg, userid);
			// 페이징 처리
			SellerManagementPaging sellerManagementPaging = sellerService.sellerManagementPaging(pg, userid);

			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", pg);
			mav.addObject("list", list);
			mav.addObject("sellerManagementPaging", sellerManagementPaging);
			mav.setViewName("jsonView");

			return mav;
		}

		@RequestMapping(value="sellerManagementDelete", method=RequestMethod.POST)
		public ModelAndView sellerManagementDelete(int item_seq) {
			sellerService.sellerManagementDelete(item_seq);

			return new ModelAndView("redirect:/pm_sellerWriteForm/sellerManagementForm");
		}

		@RequestMapping(value = "sellerModifyForm", method=RequestMethod.POST)
		public String sellerModifyForm(@RequestParam String item_seq, @RequestParam String pg, Model model) {
			model.addAttribute("item_seq", item_seq);
			model.addAttribute("pg", pg);
			model.addAttribute("display", "/pm_seller/sellerModifyForm.jsp");
			return "/index";
		}

		@RequestMapping(value = "sellerModify", method = RequestMethod.POST)
		@ResponseBody
		public void sellerModify(@RequestParam Map<String, String> map) {
			sellerService.sellerModify(map);
		}
		
		@RequestMapping(value="getManagementSearch", method=RequestMethod.POST)
		public ModelAndView getManagementSearch(@RequestParam(required = false, defaultValue = "1") String pg, @RequestParam String userid, @RequestParam String setting, @RequestParam String item_state, @RequestParam String keyword) {
			System.out.println(keyword);
			
			Map<String, String> map = new HashedMap<String, String>();
			map.put("pg", pg);
			map.put("userid", userid);
			map.put("setting", setting);
			map.put("item_state", item_state);
			map.put("keyword", keyword);
			
			List<SellerManagementDTO> list = sellerService.getManagementSearch(map);	
			
			//페이징 처리
			SellerManagementPaging sellerManagementPaging = sellerService.sellerManagementPaging(map);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", map.get("pg"));
			mav.addObject("list", list);
			mav.addObject("sellerManagementPaging", sellerManagementPaging);
			mav.setViewName("jsonView");
			
			return mav;
			
		}
}
