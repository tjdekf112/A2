package com.gdu.cast.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.cast.service.ExhibitionService;
import com.gdu.cast.service.ExperienceWishListService;
import com.gdu.cast.service.IndexService;
import com.gdu.cast.service.KeywordService;
import com.gdu.cast.service.MainSelectService;
import com.gdu.cast.service.RoomWishListService;
import com.gdu.cast.vo.Exhibition;
import com.gdu.cast.vo.Experience;
import com.gdu.cast.vo.ExperienceWishList;
import com.gdu.cast.vo.Hotel;
import com.gdu.cast.vo.Keyword;
import com.gdu.cast.vo.RoomWishList;
import com.sun.tools.javac.util.Log;

@Controller
public class IndexController {
	@Autowired ExhibitionService exhibitionService;
	@Autowired MainSelectService mainSelectService;
	@Autowired KeywordService keywordService;
	@Autowired ExperienceWishListService experienceWishListService;
	@Autowired RoomWishListService roomWishListService;
	@Autowired IndexService indexService;
	
	private final String value = "false";
	final int ROW_PER_PAGE = 6;
	
	// localhost로 주소검색해도 "index" Controller가 실행이 되도록 함
	@GetMapping(value={"/","/index"})
	public String index(HttpSession session, Model model, HttpServletRequest request) {
		
		System.out.println("loginCustomerId"+session.getAttribute("loginCustomerId"));
		System.out.println("loginAdminId"+session.getAttribute("loginAdminId"));
		System.out.println("loginTravelerId"+session.getAttribute("loginTravelerId"));
		System.out.println("loginCeoId"+session.getAttribute("loginCeoId"));
		// 최근에 올라온 체험 3개
		List<Experience> experienceList = indexService.getExperienceList();
		// 최근에 올라온 체험 3개
		List<Hotel> hotelList = indexService.getHotelList();
		// 가장 많은 추천을 받은 체험
		List<Experience> experienceBestChoice = indexService.getExperienceBestChoice();
		// 가장 많은 추천을 받은 숙소
		List<Hotel> hotelBestChoice = indexService.getHotelBestChoice();
		System.out.println("@@@@@@@@@@@@@experienceList" + experienceList);
		System.out.println("@@@@@@@@@@@@@hotelList" + hotelList);
		System.out.println("@@@@@@@@@@@@@experienceBestChoice" + experienceBestChoice);
		System.out.println("@@@@@@@@@@@@@hotelBestChoice" + hotelBestChoice);
		// 메인페이지 전시소개 리스트
		List<Exhibition> exhibition = exhibitionService.getExhibitionList1();
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path + " path 경로");
		model.addAttribute("exhibition", exhibition);
		model.addAttribute("loginCustomerId", session.getAttribute("loginCustomerId"));
		model.addAttribute("loginTravelerId",session.getAttribute("loginTravelerId"));
		model.addAttribute("loginAdminId",session.getAttribute("loginAdminId"));
		model.addAttribute("loginCeoId",session.getAttribute("loginCeoId"));
		// 최근에 올라온 체험 3개 리스트
		model.addAttribute("experienceList", experienceList);
		// 최근에 올라온 호텔 3개 리스트
		model.addAttribute("hotelList", hotelList);
		// 가장 많은 추천을 받은 체험
		model.addAttribute("experienceBestChoice", experienceBestChoice);
		// 가장 많은 추천을 받은 숙소
		model.addAttribute("hotelBestChoice", hotelBestChoice);
		
		return "index";
	}
	@GetMapping("/shop")
	public String shop(HttpSession session,Model model, @RequestParam(defaultValue = "") String themeSmallName, @RequestParam(defaultValue = "전체보기") String shopCategory,String searchKeyword, @RequestParam(defaultValue = "1") int currentPage) {
		String customerId = (String) session.getAttribute("loginCustomerId");
		int Experience_Hotel_Keyword_TotalCount = 0;
		int Experience_Hotel_Keyword_startPage = 0;
		int Experience_Hotel_Keyword_lastPage = 0;

		
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+searchKeyword+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁsearchKeyword");
		
		List<ExperienceWishList> experienceId = experienceWishListService.getselectExperienceWishList(customerId);
		List<RoomWishList> roomId = roomWishListService.getselectRoomWishList(customerId);
		
		
		System.out.println(experienceId.toString() + "experienceId");
		
		// 테마 대,중 출력
		Map<String, Object> map = mainSelectService.selectTheme();
		// 테마 소 리스트 출력
		Map<String, Object> ThemeSmallmap = mainSelectService.selectThemeSmall();
		
		// 테마 소에 해당하는 체험 리스트 출력
		Map<String, Object> themeSmallExperienceListmap = mainSelectService.selectThemeShopExperienceList(themeSmallName, searchKeyword, shopCategory, currentPage, ROW_PER_PAGE);
		// 테마 소에 해당하는 숙소 리스트 출력
		Map<String, Object> themeSmallHotelListmap = mainSelectService.selectThemeShopHotelList(themeSmallName, searchKeyword, shopCategory, currentPage, ROW_PER_PAGE);
		
		// shop 페이지 키워드 리스트 출력
		Map<String, Object> keywordListmap = keywordService.getKeywordList(searchKeyword, currentPage, ROW_PER_PAGE);
		
		if(searchKeyword != null) {
			Experience_Hotel_Keyword_TotalCount = (int) keywordListmap.get("totalPage");
			Experience_Hotel_Keyword_startPage = (int) keywordListmap.get("startPage");
			Experience_Hotel_Keyword_lastPage = (int) keywordListmap.get("lastPage");
		}	
		else {
			if(shopCategory.equals("전체보기")) {
					if ((int) themeSmallExperienceListmap.get("totalPage") < (int) themeSmallHotelListmap.get("totalPage")) {
						Experience_Hotel_Keyword_TotalCount = (int) themeSmallHotelListmap.get("totalPage");
						Experience_Hotel_Keyword_startPage = (int) themeSmallHotelListmap.get("startPage");
						Experience_Hotel_Keyword_lastPage = (int) themeSmallHotelListmap.get("lastPage");
					} else {
						Experience_Hotel_Keyword_TotalCount = (int) themeSmallExperienceListmap.get("totalPage");
						Experience_Hotel_Keyword_startPage = (int) themeSmallExperienceListmap.get("startPage");
						Experience_Hotel_Keyword_lastPage = (int) themeSmallExperienceListmap.get("lastPage");
					}
			} else if(shopCategory.equals("체험")) {
					Experience_Hotel_Keyword_TotalCount = (int) themeSmallExperienceListmap.get("totalPage");
					Experience_Hotel_Keyword_startPage = (int) themeSmallExperienceListmap.get("startPage");
					Experience_Hotel_Keyword_lastPage = (int) themeSmallExperienceListmap.get("lastPage");
				} else {
					Experience_Hotel_Keyword_TotalCount = (int) themeSmallHotelListmap.get("totalPage");
					Experience_Hotel_Keyword_startPage = (int) themeSmallHotelListmap.get("startPage");
					Experience_Hotel_Keyword_lastPage = (int) themeSmallHotelListmap.get("lastPage");
				}
		}
		
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+map.get("selectThemeList")+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁmap.get(selectThemeList)");
		System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆"+ThemeSmallmap.get("selectThemeSmallList")+"★☆★☆★☆★☆★☆★☆★☆★☆ThemeSmallmap.get(selectThemeSmallList)");
		System.out.println("★☆★☆★☆★☆★☆★☆★☆"+themeSmallName+"★☆★☆★☆★☆★☆★☆★☆ThemeShopList");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+themeSmallExperienceListmap.get("selectThemeShopExperienceList")+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁselectThemeShopExperienceList");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+themeSmallHotelListmap.get("selectThemeShopHotelList")+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁselectThemeShopHotelList");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+shopCategory+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁshopCategory");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ"+searchKeyword+"ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁsearchKeyword");
		
		model.addAttribute("value",value);
		model.addAttribute("roomWishList" , roomId);
		model.addAttribute("wishList", experienceId);
		model.addAttribute("selectThemeList", map.get("selectThemeList"));
		model.addAttribute("selectThemeSmallList", ThemeSmallmap.get("selectThemeSmallList"));
		model.addAttribute("selectThemeShopExperienceList", themeSmallExperienceListmap.get("selectThemeShopExperienceList"));
		model.addAttribute("startPage", Experience_Hotel_Keyword_startPage);
		model.addAttribute("lastPage", Experience_Hotel_Keyword_lastPage);
		model.addAttribute("totalPage", Experience_Hotel_Keyword_TotalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("selectThemeShopHotelList", themeSmallHotelListmap.get("selectThemeShopHotelList"));
		model.addAttribute("keywordList",keywordListmap.get("selectShopKeywordList"));
		model.addAttribute("shopCategory",shopCategory);
		model.addAttribute("themeSmallName", themeSmallName);
		model.addAttribute("searchKeyword", searchKeyword);
		return "shop";
	}
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	@GetMapping("/shopsingle")
	public String shopsingle() {
		return "shop-single";
	}

}
