package board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import board.bean.AdminDTO;
import board.bean.BoardPaging;
import board.bean.CommentDTO;

import board.service.BoardService;
import data.url.Base64Utils;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;
import board.bean.NoticeDTO;
import board.bean.ReportDTO;

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

	// 내상점 기본정보
	@RequestMapping(value = "mystore", method = RequestMethod.GET)
	public String mystore(HttpSession session, Model model) {
		// 나중에 세션 받아와야함.
		// String userid=(String)session.getAttribute("memId");
		// int userid = 1;
		// SellerDTO sellerDTO = boardService.getMystore(userid);

		// model.addAttribute("sellerDTO", sellerDTO);

		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}

	// 수정 후 바뀐 내상점 정보를 출력하기 위해 -- 조회수 처리 안해줬음
	@RequestMapping(value = "getMystore", method = RequestMethod.POST)
	public ModelAndView getMystore(HttpSession session, @CookieValue(value = "memHit", required = false) Cookie cookie,
			HttpServletResponse response) {
		// int userid=session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		// 조회수 - 새로고침방지
		if (cookie != null) {
			boardService.mystoreHitUpdate(userid);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		SellerDTO sellerDTO = boardService.getMystore(userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sellerDTO", sellerDTO);
		mav.addObject("userid", userid);
		mav.setViewName("jsonView");

		return mav;
	}

	// 내상점 탭메뉴1
	@RequestMapping(value = "mystoreTab1", method = RequestMethod.GET)
	public String mystoreTab1() {

		return "/pm_mystore/tab1";
	}

	// 내상점 탭메뉴2
	@RequestMapping(value = "mystoreTab2", method = RequestMethod.GET)
	public String mystoreTab2() {

		return "/pm_mystore/tab2";
	}

	// 내상점 탭메뉴3
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

	// 프로필 사진 수정 
	@RequestMapping(value = "profileImgModify", method = RequestMethod.POST)
	//@ResponseBody
	public String profileImgModify(@ModelAttribute SellerDTO sellerDTO, @RequestParam("img") MultipartFile img,Model model) {
		String filePath = "C:/project/Pmang/pmang_Project/src/main/webapp/storage/";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath, fileName);

		// 파일복사
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));

		} catch (IOException e) {
			e.printStackTrace();
		}

		sellerDTO.setPf_photo("/pmang/image/"+fileName);

		// db
		boardService.profileImgModify(sellerDTO);
		model.addAttribute("display", "/pm_mystore/mystore.jsp");
		return "/index";
	}

	// 내상점 상품 탭메뉴 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreItemList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreItemList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 찜 탭메뉴 내가 찜한 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreWishList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		String userid = "1"; // 세션값 받아야함
		List<WishDTO> list = boardService.getMystoreWishList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}
		// 페이징처리
		// MystoreTab2Paging mystoreTab2Paging = boardService.mystoreTab2Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab2Paging", mystoreTab2Paging);
		mav.setViewName("jsonView");
		return mav;

	}

	// 내상점 찜 탭메뉴 항목 삭제
	@RequestMapping(value = "wishListDelete", method = RequestMethod.POST)
	@ResponseBody
	public int wishListDelete(@RequestParam Map<String, Object> map, HttpSession session) {
		String userid = "1"; // 세션값을 받아야함
		
		
		int result = 0;
		int cnt = Integer.parseInt((String) map.get("cnt"));
		String item_seq = (String) map.get("item_seq");
		String[] arr = item_seq.split(",");
		map.put("userid", userid);
		for (int i = 0; i < cnt; i++) {
			int temp = Integer.parseInt((String) arr[i]);
			map.put("item_seq", temp);
			boardService.wishListDelete(map);
			result++;
		}

		return result;
	}

	// 내상점 상점후기 탭메뉴 최신순으로 출력(기본)
	@RequestMapping(value = "getMystoreReviewList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMystoreReviewList(@RequestParam(required = false) String pg, HttpSession session,
			HttpServletResponse response) {
		String userid = "1"; // 세션값 받아야함

		List<ReviewDTO> list = boardService.getMystoreReviewList(pg, userid);

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
		mav.addObject("userid", userid);
		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 상품 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreItemCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreItemCnt(HttpSession session, HttpServletResponse reponse) {
		String userid ="1"; // 세션값 받아야함

		String result = boardService.getMystoreItemCnt(userid);
		return result;
	}

	// 내상점 찜 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreWishCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreWishCnt(HttpSession session, HttpServletResponse reponse) {
		String userid = "1"; // 세션값 받아야함

		String result = boardService.getMystoreWishCnt(userid);
		return result;
	}

	// 내상점 상점후기 탭메뉴 목록 총개수
	@RequestMapping(value = "getMystoreReviewCnt", method = RequestMethod.POST)
	@ResponseBody
	public String getMystoreReviewCnt(HttpSession session, HttpServletResponse reponse) {
		String userid = "1"; // 세션값 받아야함
		String result = boardService.getMystoreReviewCnt(userid);
		return result;
	}

	// 내상점 상점 탭메뉴 인기순 출력
	@RequestMapping(value = "getMystoreItemPopularList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemPopularList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreItemPopularList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 상점 탭메뉴 저가순 출력
	@RequestMapping(value = "getMystoreItemLowerPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemLowerPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreItemLowerPriceList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 상점 탭메뉴 고가순출력
	@RequestMapping(value = "getMystoreItemHighestPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreItemHighestPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {

		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreItemHighestPriceList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 찜 탭메뉴 인기순출력
	@RequestMapping(value = "getMystoreWishPopularList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishPopularList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreWishPopularList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 찜 탭메뉴 저가순출력
	@RequestMapping(value = "getMystoreWishLowerPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishLowerPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함

		List<ItemDTO> list = boardService.getMystoreWishLowerPriceList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// 내상점 찜 탭메뉴 고가순출력
	@RequestMapping(value = "getMystoreWishHighestPriceList", method = RequestMethod.POST)
	public ModelAndView getMystoreWishHighestPriceList(@RequestParam(required = false, defaultValue = "1") String pg,
			HttpSession session, HttpServletResponse response) {
		// 나중에 변경 세션받으면!
		// String userid = (String) session.getAttribute("userid");
		String userid = "1"; // 세션값 받아야함
		List<ItemDTO> list = boardService.getMystoreWishHighestPriceList(pg, userid);

		// 조회수 - 새로고침 방지
		if (session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit", "0");// 생성
			cookie.setMaxAge(30 * 60);// 초 단위 생존기간
			cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 페이징처리
		// MystoreTab1Paging mystoreTab1Paging = boardService.mystoreTab1Paging(pg,
		// userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("userid", userid);
		// mav.addObject("mystoreTab1Paging", mystoreTab1Paging);

		mav.setViewName("jsonView");
		return mav;
	}

	// -----------------------mystore

	// -------------------review-------------------
	// 리뷰 작성폼
	@RequestMapping(value = "reviewWriteForm", method = RequestMethod.GET)
	public String reviewWriteForm() {
		return "/pm_review/reviewWriteForm";
	}

	// 리뷰 작성 
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	@ResponseBody
	public void reviewWrite(@ModelAttribute ReviewDTO reviewDTO, HttpServletRequest request,
			@RequestParam("img1url") String img1url,@RequestParam("img2url") String img2url,@RequestParam("img3url") String img3url) {
		String filePath = "C:/project/Pmang/pmang_Project/src/main/webapp/storage/";

		/*
		 * System.out.println(reviewDTO); System.out.println(list);
		 * 
		 * for (MultipartFile img : list) { String fileName = img.getOriginalFilename();
		 * File file = new File(filePath, fileName);
		 * 
		 * // 파일복사 try { FileCopyUtils.copy(img.getInputStream(), new
		 * FileOutputStream(file)); } catch (IOException e) { e.printStackTrace(); }
		 * 
		 * // ReviewDTO reviewDTO=new ReviewDTO(); reviewDTO.setReviewWriter("승은"); //
		 * 일단 임의로 넣음. reviewDTO.setReviewSubject("글제ㅔ목 일단 임의로");
		 * reviewDTO.setReviewImg1(fileName); reviewDTO.setReviewImg2("");
		 * reviewDTO.setReviewImg3("");
		 */
		String reviewWriter="작성자id";//작성자 아이디 세션으로 넣어야함
		reviewDTO.setReviewWriter(reviewWriter);
		
		UUID uuid=UUID.randomUUID();	//중복파일이름방지를 위한 uuid설정
		
		try {
		
			byte[] in1=null;
			byte[] in2=null;
			byte[] in3=null;
			
			if(!img1url.equals("undefined")) {
				in1=Base64Utils.decodeBase64ToBytes(img1url);
				File file1=new File(filePath,uuid.toString()+"_"+reviewDTO.getImg1());
				FileCopyUtils.copy(in1, new FileOutputStream(file1));
				reviewDTO.setImg1(uuid.toString()+"_"+reviewDTO.getImg1());
			}
			if(!img2url.equals("undefined")) {
				in2=Base64Utils.decodeBase64ToBytes(img2url);
				File file2=new File(filePath,uuid.toString()+"_"+reviewDTO.getImg2());
				FileCopyUtils.copy(in2, new FileOutputStream(file2));
				reviewDTO.setImg2(uuid.toString()+"_"+reviewDTO.getImg2());
						
			}
			if(!img3url.equals("undefined")) {
				in3=Base64Utils.decodeBase64ToBytes(img3url);
				File file3=new File(filePath,uuid.toString()+"_"+reviewDTO.getImg3());
				FileCopyUtils.copy(in3, new FileOutputStream(file3));
				reviewDTO.setImg3(uuid.toString()+"_"+reviewDTO.getImg3());
			}
		}catch(IOException e) {
			e.printStackTrace();
		}

			// db
			boardService.reviewWrite(reviewDTO);

		
	}

	// -------------------review-------------------

	// 공지사항 창 열기
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(@RequestParam(required = false, defaultValue = "0") int tabNo, Model model) {
		model.addAttribute("tabNo", tabNo);
		model.addAttribute("display", "/pm_notice/notice.jsp");

		return "/index";
	}

	// 판매글 창 열기
	@RequestMapping(value = "itemView", method = RequestMethod.GET)
	public String itemView(@RequestParam(required = false, defaultValue = "999") int item_seq, Model model) {

		model.addAttribute("item_seq", item_seq);
		model.addAttribute("display", "/pm_itemView/itemView.jsp");
		return "/index";
	}

	// 판매글 정보 DB 읽어오기
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

	// 댓글리스트 DB 읽어오기
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

	// ------------------admin

	// 일단 보여주기용으로!!~2/6 이후엔 mystore에 합치기! 세션으로 구분할거임
	/*
	 * @RequestMapping(value = "admin", method = RequestMethod.GET) public String
	 * admin(Model model) { model.addAttribute("display", "/pm_admin/admin.jsp");
	 * return "/index"; }
	 */
	@RequestMapping(value = "getAdmin", method = RequestMethod.POST)
	public ModelAndView getAdmin() {
		AdminDTO adminDTO = boardService.getAdmin();

		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminDTO", adminDTO);
		// mav.addObject("userid", userid);
		mav.setViewName("jsonView");

		return mav;
	}

	// admin 탭메뉴1
	@RequestMapping(value = "adminTab1", method = RequestMethod.GET)
	public String adminTab1() {

		return "/pm_admin/tab1";
	}

	// admin 탭메뉴2
	@RequestMapping(value = "adminTab2", method = RequestMethod.GET)
	public String adminTab2() {

		return "/pm_admin/tab2";
	}

	// admin 탭메뉴3
	/*
	 * @RequestMapping(value = "adminTab3", method = RequestMethod.GET) public
	 * String adminTab3() {
	 * 
	 * return "/pm_admin/tab3"; }
	 */
	
	//신고 리스트
	@RequestMapping(value="getReportList",method=RequestMethod.POST)
	public ModelAndView getReportList()
	{
		List<ReportDTO> list=boardService.getReportList();
		
		//System.out.println(list);
		//페이징 처리
		//ReportPaging reportPaging=boardService.reportPaging(pg);
		
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("pg", pg);
		mav.addObject("list", list);
		//mav.addObject("reportPaging", reportPaging);
		mav.setViewName("jsonView");
		
		
		
		return mav;
		
	}
	
	//신고내역
	@RequestMapping(value="reportView",method=RequestMethod.GET)
	public String reportView(@RequestParam String userid,Model model) {
		model.addAttribute("userid",userid);
		return "/pm_admin/reportView";
	}
	
	//신고 내역 리스트
	@RequestMapping(value="getReport",method=RequestMethod.POST)
	public ModelAndView getReport(@RequestParam String userid) {
		List<ReportDTO> list=boardService.getReport(userid);
		
		//System.out.println(list);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//신고 3회 이상 받은 회원 리스트
	@RequestMapping(value="getReportTarget")
	public ModelAndView getReportTarget() {
		List<String> list=boardService.getReportTarget();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//공지사항 작성
	@RequestMapping(value="noticeWrite",method=RequestMethod.POST)
	@ResponseBody
	public void noticeWrite(@RequestParam Map<String,String> map) {
		boardService.noticeWrite(map);
	}
	// ------------------admin
}
