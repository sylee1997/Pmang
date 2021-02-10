package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.WishlistDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "mystore", method = RequestMethod.GET)
	public String mystore(Model model) {
		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}

	// 공지사항 창 열기
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(@RequestParam(required = false, defaultValue = "0") int tabNo, Model model) {
		model.addAttribute("tabNo", tabNo);
		model.addAttribute("display", "/pm_notice/notice.jsp");

		return "/index";
	}

	// 판매글 창 열기
	@RequestMapping(value = "itemView", method = RequestMethod.GET)
	public String itemView(Model model/* @RequestParam(required=false, defaultValue="999") int item_seq */ ) {

		/* model.addAttribute("item_seq", item_seq); */
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}

	// 판매글 정보 DB 읽어오기
	@RequestMapping(value = "getItem", method = RequestMethod.POST)
	public ModelAndView getItem(@RequestParam int item_seq,
			@CookieValue(value = "itemHit", required = false) Cookie cookie, HttpServletResponse response,
			HttpSession session) {
		// 맨 위에 전역변수로 선언하고 Autowired 걸면 안됨. --> 고치면서 본건대 이게 무슨소리인가요..?

		// 조회수 - 새로고침 방지
		if (cookie != null) {
			boardService.itemHitUpdate(item_seq); // 조회수 증가 -->서비스쪽이랑 디비, 매퍼 추가됬음요
			cookie.setMaxAge(0); // 쿠키 삭제
			response.addCookie(cookie); // 쿠키 삭제된걸 클라이언트에게 보내주기.
		}

		ItemDTO itemDTO = boardService.getItem(item_seq);

		ModelAndView mav = new ModelAndView();
		// 임의로 입력한 값 999, click한 상품의 item_seq가 parameter로 들어와야 함.
		// -------------------------------------->해결!
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");

		return mav;
	}

	// 댓글리스트 DB 읽어오기
	@RequestMapping(value = "getCommentList", method = RequestMethod.POST)
	public ModelAndView getCommentList(int item_seq) {

		List<CommentDTO> list = boardService.getCommentList(item_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 댓글 생성
	@RequestMapping(value = "itemComment", method = RequestMethod.POST)
	@ResponseBody
	public void itemComment(@RequestParam int item_seq, @RequestParam String userId,
			@RequestParam String item_comment) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_seq", item_seq);
		map.put("item_comment", item_comment);
		map.put("userId", userId);
		boardService.itemComment(map);
	}

	// 댓글 삭제
	@RequestMapping(value = "commentDelete", method = RequestMethod.POST)
	@ResponseBody
	public void commentDelete(@RequestParam String comment_seq) {
		boardService.commentDelete(comment_seq);
	}

	// 댓글 1개 읽어오기 (대댓글용)
	@RequestMapping(value = "getAComment", method = RequestMethod.POST)
	public ModelAndView getAComment(@RequestParam String comment_seq) {

		CommentDTO commentDTO = boardService.getAComment(comment_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("commentDTO", commentDTO);
		mav.setViewName("jsonView");

		return mav;
	}

	// 찜여부 체크
	@RequestMapping(value = "getWishlist", method = RequestMethod.POST)
	public ModelAndView getWishlist(@RequestParam(required = false, defaultValue = "999") int item_seq) {
		List<WishlistDTO> list = boardService.getWishlist(item_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 찜하기
	@RequestMapping(value = "pushLike", method = RequestMethod.POST)
	@ResponseBody
	public void pushLike(@RequestParam int item_seq, @RequestParam String userId) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_seq", item_seq);
		map.put("userId", userId);
		boardService.pushLike(map);
	}

	// 찜 해제
	@RequestMapping(value = "cancelLike", method = RequestMethod.POST)
	@ResponseBody
	public void cancelLike(@RequestParam int item_seq, @RequestParam String userId) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_seq", item_seq);
		map.put("userId", userId);
		boardService.cancelLike(map);
	}

	@RequestMapping(value = "reportUser", method = RequestMethod.POST)
	@ResponseBody
	public void reportUser(@RequestParam int target_seq, @RequestParam String targetType,
			@RequestParam String reportContent) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("target_seq", target_seq);
		map.put("targetType", targetType);
		String userId = boardService.getUesrId(map);

		map.put("userId", userId);
		map.put("reportContent", reportContent);
		boardService.reportUser(map);
		boardService.countReport(userId);

	}

	// ===========================Item Board

	@RequestMapping(value = "itemBoard", method = RequestMethod.GET)
	public String itemBoard(Model model) {
		model.addAttribute("display", "/pm_itemBoard/itemBoard.jsp");
		return "/index";
	}

	@RequestMapping(value = "getItemBoardCount", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getItemBoardCount(@RequestParam Map<String, Object> categoryMap) {

		List<Object> list = boardService.getItemBoardCount(categoryMap);

		ModelAndView mav = new ModelAndView();
		mav.addObject("ctgMapList", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 처음 보여줄 때 리스트
	@RequestMapping(value = "getitemBoardList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getitemBoardList(@RequestParam(required = false, defaultValue = "1") String pg,
			@RequestParam Map<String, Object> map, HttpSession session, HttpServletResponse response) {
		System.out.println(map.get("category1"));
		System.out.println(map.get("category2"));
		System.out.println(map.get("category3"));
		List<ItemDTO> list = boardService.getItemBoardList(pg, map);

		// 전체 카테고리 수 구하기
		int entireItemNum = boardService.getEntireItemNum(map);

		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg, map);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memUserId") != null) {
			Cookie cookie = new Cookie("itemHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("itemBoardList", list);
		mav.addObject("entireItemNum", entireItemNum);
		mav.setViewName("jsonView");

		return mav;
	}

	// 최신순, 인기순, 고가순, 저가순...
	@RequestMapping(value = "getOrderbyItem", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getOrderbyItem(@RequestParam(required = false, defaultValue = "1") String pg,
			@RequestParam Map<String, Object> map) {

		System.out.println(pg);
		List<Object> list = boardService.getOrderbyItem(pg, map);
		int entireItemNum = boardService.getEntireItemNum(map);
		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg, map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("orderbylist", list);
		mav.addObject("entireItemNum", entireItemNum);
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);

		mav.setViewName("jsonView");

		return mav;

	}

}// public