package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
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
	
	//공지사항 창 열기
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String notice(@RequestParam(required=false, defaultValue="0") int tabNo, Model model) {
		model.addAttribute("tabNo",tabNo);
		model.addAttribute("display", "/pm_notice/notice.jsp");
		
		return "/index";
	}
	
	//판매글 창 열기
	@RequestMapping(value="itemView", method=RequestMethod.GET)
	public String itemView(@RequestParam(required=false, defaultValue="999") int item_seq, Model model) {
		
		model.addAttribute("item_seq", item_seq);
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}
	
	//판매글 정보 DB 읽어오기
	@RequestMapping(value="getItem", method=RequestMethod.POST)
	public ModelAndView getItem(@RequestParam(required=false, defaultValue="999") int item_seq) {
		//맨 위에 전역변수로 선언하고 Autowired 걸면 안됨.
		ItemDTO itemDTO = boardService.getItem(item_seq);
		
		ModelAndView mav = new ModelAndView();
		//임의로 입력한 값 999, click한 상품의 item_seq가 parameter로 들어와야 함.
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");
				
		return mav;
	}

	//댓글리스트 DB 읽어오기
	@RequestMapping(value="getCommentList", method=RequestMethod.POST)
	public ModelAndView getCommentList(@RequestParam(required=false, defaultValue="999") int item_seq) {
		
		List<CommentDTO> list = boardService.getCommentList(item_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;	
	}
	
	//댓글 생성
	@RequestMapping(value="itemComment", method=RequestMethod.POST)
	public void itemComment(@RequestParam(required=false, defaultValue="999") int item_seq, @RequestParam String item_comment) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("item_seq", item_seq);
		map.put("item_comment", item_comment);
		boardService.itemComment(map);
	}
	
	//댓글 삭제
	@RequestMapping(value="commentDelete", method=RequestMethod.POST)
	public void commentDelete(@RequestParam String comment_seq) {
		boardService.commentDelete(comment_seq);
	}
	
	//댓글 1개 읽어오기 (대댓글용)
	@RequestMapping(value="getAComment", method=RequestMethod.POST)
	public ModelAndView getAComment(@RequestParam String comment_seq) {
		
		CommentDTO commentDTO = boardService.getAComment(comment_seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentDTO", commentDTO);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}