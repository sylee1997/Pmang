package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardPaging;
import board.bean.CommentDTO;

import board.service.BoardService;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;

import board.bean.ReviewDTO;
import board.bean.WishDTO;
import board.service.BoardService;
import member.bean.SellerDTO;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "itemBoard", method = RequestMethod.GET)
	public String itemBoard(Model model) {
		model.addAttribute("display", "/pm_itemBoard/itemBoard.jsp");
		return "/index";
	}

	// -------------------mystote------------------------
	
	//내상점 기본정보 
	@RequestMapping(value = "mystore", method = RequestMethod.GET)
	public String mystore(HttpSession session, Model model) {
		// 나중에 세션 받아와야함.
		// String userkey=(String)session.getAttribute("memId");
		int userkey = 1;
		SellerDTO sellerDTO = boardService.getMystore(userkey);

		model.addAttribute("sellerDTO", sellerDTO);

		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}

	//수정 후 바뀐 내상점 정보를 출력하기 위해 -- 조회수 처리 안해줬음
	@RequestMapping(value = "getMystore", method = RequestMethod.POST)
	public ModelAndView getMystore(HttpSession session, @CookieValue(value = "memHit", required = false) Cookie cookie,
			HttpServletResponse response) {
		// int userkey=session.getAttribute("userkey");
		int userkey = 1;

		// 조회수 - 새로고침방지
		if (cookie != null) {
			boardService.mystoreHitUpdate(userkey);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		SellerDTO sellerDTO = boardService.getMystore(userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sellerDTO", sellerDTO);
		mav.addObject("userkey", userkey);
		mav.setViewName("jsonView");

		return mav;
	}

	//내상점 탭메뉴1 
	@RequestMapping(value = "mystoreTab1", method = RequestMethod.GET)
	public String mystoreTab1() {

		return "/pm_mystore/tab1";
	}

	//내상점 탭메뉴2
	@RequestMapping(value = "mystoreTab2", method = RequestMethod.GET)
	public String mystoreTab2() {

		return "/pm_mystore/tab2";
	}

	//내상점 탭메뉴3
	@RequestMapping(value = "mystoreTab3", method = RequestMethod.GET)
	public String mystoreTab3() {

		return "/pm_mystore/tab3";
	}

	@RequestMapping(value = "mystoreModify", method = RequestMethod.POST)
	@ResponseBody
	public void mystoreModify(@RequestParam String marketname, @RequestParam String marketcontent) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("marketname", marketname);
		map.put("pf_content", marketcontent);

		boardService.mystoreModify(map);
	}

	//프로필 사진 수정 --> 구현못했음 이미지 변경부터 구현 못함 		#sxxgxxnz
	@RequestMapping(value = "profileImgModify", method = RequestMethod.POST)
	@ResponseBody
	public void profileImgModify(@ModelAttribute SellerDTO sellerDTO, @RequestParam("img") MultipartFile img) {
		String filePath = "C:\\project\\Pmang\\pmang_Project\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);

		// 파일복사
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}

		sellerDTO.setPf_photo(fileName);

		// db
		boardService.profileImgModify(sellerDTO);
	}

	//내상점 상품 탭메뉴 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreItemList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreItemList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 찜 탭메뉴 내가 찜한 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreWishList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		int userkey = 1;

		List<WishDTO> list = boardService.getMystoreWishList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}
		// 페이징처리
		// MystoreTab2Paging mystoreTab2Paging = boardService.mystoreTab2Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab2Paging", mystoreTab2Paging);
		mav.setViewName("jsonView");
		return mav;

	}

	//내상점 찜 탭메뉴 항목 삭제
	@RequestMapping(value = "wishListDelete", method = RequestMethod.POST)
	@ResponseBody
	public int wishListDelete(@RequestParam Map<String, Object> map, HttpSession session) {
		int userkey = 1; // 세션값을 받아야함
		int result = 0;
		int cnt = Integer.parseInt((String) map.get("cnt"));
		String item_seq = (String) map.get("item_seq");
		String[] arr = item_seq.split(",");
		map.put("userkey", userkey);
		for (int i = 0; i < cnt; i++) {
			int temp = Integer.parseInt((String) arr[i]);
			map.put("item_seq", temp);
			boardService.wishListDelete(map);
			result++;
		}

		return result;
	}

	//내상점 상점후기 탭메뉴 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreReviewList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMystoreReviewList(@RequestParam(required = false) String pg, HttpSession session,
			HttpServletResponse response) {
		int userkey = 1; // 세션값 받아야함

		List<ReviewDTO> list = boardService.getMystoreReviewList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 상품 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreItemCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreItemCnt(HttpSession session, HttpServletResponse reponse) {
		int userkey = 1; // 세션값 받아야함

		String result = boardService.getMystoreItemCnt(userkey);
		return result;
	}

	//내상점 찜 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreWishCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreWishCnt(HttpSession session, HttpServletResponse reponse) {
		int userkey = 1; // 세션값 받아야함

		String result = boardService.getMystoreWishCnt(userkey);
		return result;
	}

	//내상점 상점후기 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreReviewCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreReviewCnt(HttpSession session, HttpServletResponse reponse) {
		int userkey = 1; // 세션값 받아야함

		String result = boardService.getMystoreReviewCnt(userkey);
		return result;
	}

	//내상점 상점 탭메뉴 인기순 출력
	@RequestMapping(value = "getMystoreItemPopularList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemPopularList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreItemPopularList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 상점 탭메뉴 저가순 출력
	@RequestMapping(value = "getMystoreItemLowerPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemLowerPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreItemLowerPriceList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 상점 탭메뉴 고가순출력
	@RequestMapping(value = "getMystoreItemHighestPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemHighestPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreItemHighestPriceList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 찜 탭메뉴 인기순출력
	@RequestMapping(value = "getMystoreWishPopularList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishPopularList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreWishPopularList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	//내상점 찜 탭메뉴 저가순출력
	@RequestMapping(value = "getMystoreWishLowerPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishLowerPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreWishLowerPriceList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}
	
	//내상점 찜 탭메뉴 고가순출력
	@RequestMapping(value = "getMystoreWishHighestPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishHighestPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userkey = (String) session.getAttribute("userkey");
		int userkey = 1;

		List<ItemDTO> list = boardService.getMystoreWishHighestPriceList(pg, userkey);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userkey);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userkey", userkey);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// -----------------------mystore


	// -------------------review-------------------
	//리뷰 작성폼
	@RequestMapping(value = "reviewWriteForm", method = RequestMethod.GET)
	public String reviewWriteForm() {
		return "/pm_review/reviewWriteForm";
	}

	//리뷰 작성 --> 구현 못했음 이미지등록.. #sxxgxxnz
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	@ResponseBody
	public void reviewWrite(@ModelAttribute ReviewDTO reviewDTO, @RequestParam("img[]") List<MultipartFile> list) {
		String filePath = "C:\\project\\Pmang\\pmang_Project\\src\\main\\webapp\\storage";

		System.out.println(reviewDTO);
		System.out.println(list);

		for (MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);

			// 파일복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}

			// ReviewDTO reviewDTO=new ReviewDTO();
			reviewDTO.setReviewWriter("승은"); // 일단 임의로 넣음.
			reviewDTO.setReviewSubject("글제ㅔ목 일단 임의로");
			reviewDTO.setReviewImg1(fileName);
			reviewDTO.setReviewImg2("");
			reviewDTO.setReviewImg3("");

			// db
			boardService.reviewWrite(reviewDTO);

		}
	}

	// -------------------review-------------------

	// 공지사항 창 열기
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(@RequestParam(required = false, defaultValue = "0") int tabNo, Model model) {
		model.addAttribute("tabNo", tabNo);
		model.addAttribute("display", "/pm_notice/notice.jsp");

		return "/index";
	}

	//판매글 창 열기
	@RequestMapping(value = "itemView", method = RequestMethod.GET)
	public String itemView(@RequestParam(required = false, defaultValue = "999") int item_seq, Model model) {

		model.addAttribute("item_seq", item_seq);
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}

	//판매글 정보 DB 읽어오기
	@RequestMapping(value = "getItem", method = RequestMethod.POST)
	public ModelAndView getItem(@RequestParam(required = false, defaultValue = "999") int item_seq) {
		// 留� �쐞�뿉 �쟾�뿭蹂��닔濡� �꽑�뼵�븯怨� Autowired 嫄몃㈃ �븞�맖.
		ItemDTO itemDTO = boardService.getItem(item_seq);

		ModelAndView mav = new ModelAndView();
		// �엫�쓽濡� �엯�젰�븳 媛� 999, click�븳 �긽�뭹�쓽 item_seq媛� parameter濡� �뱾�뼱���빞 �븿.
		mav.addObject("itemDTO", itemDTO);
		mav.setViewName("jsonView");

		return mav;
	}

	//댓글리스트 DB 읽어오기
	@RequestMapping(value = "getCommentList", method = RequestMethod.POST)
	public ModelAndView getCommentList(@RequestParam(required = false, defaultValue = "999") int item_seq) {

		List<CommentDTO> list = boardService.getCommentList(item_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// �뙎湲� �깮�꽦
	@RequestMapping(value = "itemComment", method = RequestMethod.POST)
	public void itemComment(@RequestParam(required = false, defaultValue = "999") int item_seq,
			@RequestParam String item_comment) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_seq", item_seq);
		map.put("item_comment", item_comment);
		boardService.itemComment(map);
	}

	// �뙎湲� �궘�젣
	@RequestMapping(value = "commentDelete", method = RequestMethod.POST)
	public void commentDelete(@RequestParam String comment_seq) {
		boardService.commentDelete(comment_seq);
	}

	// �뙎湲� 1媛� �씫�뼱�삤湲� (���뙎湲��슜)
	@RequestMapping(value = "getAComment", method = RequestMethod.POST)
	public ModelAndView getAComment(@RequestParam String comment_seq) {

		CommentDTO commentDTO = boardService.getAComment(comment_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("commentDTO", commentDTO);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "getitemBoardList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getitemBoardList(@RequestParam(required = false, defaultValue = "1") String pg,
			@RequestParam Map<String, String> map) {
		System.out.println(map.get("category1"));
		System.out.println(map.get("category2"));
		System.out.println(map.get("category3"));
		List<ItemDTO> list = boardService.getItemBoardList(map);

		// �쟾泥� 移댄뀒怨좊━ �닔 援ы븯湲�
		int entireItemNum = boardService.getEntireItemNum(map);

		// �럹�씠吏� 泥섎━
		BoardPaging boardPaging = boardService.boardPaging(pg, map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("itemBoardList", list);
		mav.addObject("entireItemNum", entireItemNum);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "getItemBoardCount", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getItemBoardCount(@RequestParam Map<String, String> categoryMap) {

		List<Object> list = boardService.getItemBoardCount(categoryMap);

		ModelAndView mav = new ModelAndView();
		mav.addObject("ctgMapList", list);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "getOrderbyItem", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getOrderbyItem(@RequestParam Map<String, String> map) {

		List<Object> list = boardService.getOrderbyItem(map);
		int entireItemNum = boardService.getEntireItemNum(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("orderbylist", list);
		mav.addObject("entireItemNum", entireItemNum);
		mav.setViewName("jsonView");

		return mav;

	}

}
