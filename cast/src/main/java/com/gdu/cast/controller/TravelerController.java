package com.gdu.cast.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.cast.service.JoinRequestService;
import com.gdu.cast.service.TravelerService;
import com.gdu.cast.vo.Experience;
import com.gdu.cast.vo.ExperienceSelect;
import com.gdu.cast.vo.ExperienceSelectComment;
import com.gdu.cast.vo.Hotel;
import com.gdu.cast.vo.RoomSelect;
import com.gdu.cast.vo.RoomSelectComment;
import com.gdu.cast.vo.Traveler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TravelerController {
	
	@Autowired
	TravelerService travelerService;	
	
	// 12.15
	@Autowired
	JoinRequestService joinRequestService;
	
	private final int ROW_PER_PAGE = 10;
	
	// 자신이 등록한 체험 추천 글의 댓글 리스트
	@GetMapping("/experienceSelectCommentList")
	public String experienceSelectCommentList(Model model,
			@RequestParam(defaultValue = "1") int currentPage, String travelerId, HttpSession session) {
		travelerId = (String)session.getAttribute("loginTravelerId");
		log.debug("★★★★Hyun★★★★"+travelerId);
		Map<String, Object> map = travelerService.getSelectExperienceSelectCommentList(travelerId, currentPage, ROW_PER_PAGE);
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(travelerId);
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(travelerId);
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		model.addAttribute("experienceSelectCommentList", map.get("experienceSelectCommentList"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("totalPage", map.get("totalPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("travelerId", travelerId);
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/experienceSelectCommentList";
	}
	
	// 자신이 등록한 숙소 추천 글의 댓글 리스트
	@GetMapping("/roomSelectCommentList")
	public String roomSelectCommentList(Model model, 
			@RequestParam(defaultValue = "1") int currentPage, String travelerId, HttpSession session) {
		travelerId = (String)session.getAttribute("loginTravelerId");
		log.debug("★★★★Hyun★★★★"+travelerId);
		Map<String, Object> map = travelerService.getSelectRoomSelectCommentList(travelerId, currentPage, ROW_PER_PAGE);
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(travelerId);
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(travelerId);
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		model.addAttribute("roomSelectCommentList", map.get("roomSelectCommentList"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("totalPage", map.get("totalPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("travelerId", travelerId);
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/roomSelectCommentList";
	}
	
	// 여행작가 비밀번호 변경
	@GetMapping("/modifyTravelerPw")
	public String modifyTravelerPw(Model model, Traveler traveler) {
		log.debug("★★★★Hyun★★★★"+traveler.toString());
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(traveler.getTravelerId());
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(traveler.getTravelerId());
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/modifyTravelerPw";
	}
	
	// 여행작가 비밀번호 변경
	@PostMapping("/modifyTravelerPw")
	public String modifyTravelerPw(String travelerId, String travelerPw, String newTravelerPw) {
		travelerService.modifyTravelerPw(travelerId, travelerPw, newTravelerPw);
		
		log.debug("★★★★Hyun★★★★"+travelerId);
		log.debug("★★★★Hyun★★★★"+travelerPw);
		log.debug("★★★★Hyun★★★★"+newTravelerPw);
		
		return "redirect:/travelerIndex?travelerId="+travelerId;
	}
	
	// 여행작가 회원 탈퇴
	@GetMapping("/removeTraveler")
	public String getRemoveTraveler(Traveler traveler, Model model) {
		travelerService.getRemoveTraveler(traveler.getTravelerId(), traveler.getTravelerPw());
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(traveler.getTravelerId());
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(traveler.getTravelerId());
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		
		log.debug("★★★★Hyun★★★★"+traveler.toString());
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/removeTraveler";
	}
	
	// 여행작가 회원 탈퇴
	@PostMapping("/removeTraveler")
	public String getRemoveTraveler(Traveler traveler, HttpSession session) {
		String travelerId = (String)session.getAttribute("loginTravelerId");
		log.debug("★★★★Hyun★★★★"+travelerId);
		
		if(travelerService.getSelectTravelerPw(travelerId, traveler.getTravelerPw()) != 1) {
			return "redirect:/travelerIndex?travelerId="+travelerId;
		} else {
			// 회원 탈퇴(delete_id 테이블에 id 값 입력)
			travelerService.getAddDeleteTravelerId(traveler.getTravelerId());
			
			// 회원 탈퇴(traveler 테이블 데이터 삭제)
			travelerService.getRemoveTraveler(traveler.getTravelerId(), traveler.getTravelerPw());
			
			// 세션 종료
			session.invalidate();
			
			log.debug("★★★★Hyun★★★★"+traveler.toString());
			return "redirect:/loginSelect";
		}
	}
	
	// 여행작가 메인 페이지 자신이 등록한 숙소/체험 추천 리스트 출력(5개) 및 최근 등록한 호텔/체험 리스트 출력
	@GetMapping("/travelerIndex")
	public String SelectListMain(HttpSession session, Model model, String travelerId) {
		
		// 자신이 등록한 숙소 리스트 및 댓글 출력
		List<RoomSelect> roomSelectList = travelerService.getselectRoomSelectListByMain(travelerId);
		List<RoomSelectComment> roomSelectCommentListByMain = travelerService.getselectRoomSelectCommentListByMain(travelerId);
		
		// 자신이 등록한 체험 리스트 및 댓글 출력
		List<ExperienceSelect> experienceSelectList = travelerService.getselectExperienceSelectListByMain(travelerId);
		List<ExperienceSelectComment> experienceSelectCommentListByMain = travelerService.getselectExperienceSelectCommentListByMain(travelerId);
		
		// 최근 호텔 및 체험 등록 리스트(5개) 
		List<Hotel> hotelList = travelerService.getSelectHotelListByMain();
		List<Experience> experienceList = travelerService.getSelectExperienceListByMain();
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(travelerId);
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(travelerId);
		
		// 가입 요청 세션 가져오기
		String state = joinRequestService.getTravelerJoinRequestResult((String)session.getAttribute("loginTravelerId"));
		session.setAttribute("state", state);
		System.out.println(state + " <<< LoginCeoController");
		
		model.addAttribute("roomSelectList", roomSelectList);
		model.addAttribute("experienceSelectList", experienceSelectList);
		model.addAttribute("roomSelectCommentListByMain", roomSelectCommentListByMain);
		model.addAttribute("experienceSelectCommentListByMain", experienceSelectCommentListByMain);
		model.addAttribute("hotelList", hotelList);
		model.addAttribute("experienceList", experienceList);
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		model.addAttribute("travelerId", travelerId);
		
		log.debug("★★★★Hyun★★★★"+model.toString());
		log.debug("★★★★Hyun★★★★"+travelerId);
		
		return "traveler/travelerIndex";
	}
	
	// 여행작가 내정보 수정
	@GetMapping("/modifyTravelerMyInfo")
	public String modifyTravelerMyInfo(Model model, HttpSession session, String travelerId) {
		travelerId = (String)session.getAttribute("loginTravelerId");
		Traveler traveler = travelerService.getTravelerMyInfo(travelerId);
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(travelerId);
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(travelerId);
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);
		model.addAttribute("traveler", traveler);
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/modifyTravelerMyInfo";
	}
	
	// 여행작가 내정보 수정
	@PostMapping("/modifyTravelerMyInfo")
	public String modifyTravelerMyInfo(Traveler traveler) {
		travelerService.modifyTravelerMyInfo(traveler);
		log.debug("★★★★Hyun★★★★"+traveler.toString()); 
		
		return "redirect:/modifyTravelerMyInfo?travelerId="+traveler.getTravelerId();
	}
	
	// 여행작가 프로필
	@GetMapping("/travelerMyInfo")
	public String getTravelerMyInfo(Model model, HttpSession session, String travelerId) {
		travelerId = (String)session.getAttribute("loginTravelerId");
		Traveler traveler = travelerService.getTravelerMyInfo(travelerId);
		
		// 자신이 등록한 숙소/체험 댓글 알람
		List<RoomSelect> roomSelectAlarmList = travelerService.getRoomSelectAlarm(travelerId);
		List<ExperienceSelect> experienceSelectAlarmList = travelerService.getExperienceSelectAlarm(travelerId);
		
		model.addAttribute("roomSelectAlarmList", roomSelectAlarmList);
		model.addAttribute("experienceSelectAlarmList", experienceSelectAlarmList);	
		model.addAttribute("traveler", traveler);
		log.debug("★★★★Hyun★★★★"+model.toString());
		
		return "traveler/travelerMyInfo";
	}
	
	/* 여행작가 메인 페이지
	@GetMapping("/travelerIndex")
	public String travelerIndex() {
		return "traveler/travelerIndex";
	} 
	
	
	// 여행작가 메인 차트
	@GetMapping("/chart")
	public String chart() {
		return "traveler/chart";
	}
	
	// 여행작가 메인 버튼
	@GetMapping("/button")
	public String button() {
		return "traveler/button";
	}
	*/
	
	// 여행작가 로그아웃
	@GetMapping("/travelerLogout")
	public String travelerLogout(HttpSession session) {
		session.invalidate();
		log.debug("★★★★Hyun★★★★"+session.toString());
		
		return "redirect:/index";
	}
	
	// 여행작가 로그인
	@GetMapping("/travelerLogin")
	public String travelerLogin() {
		return "traveler/travelerLogin";
	}
	
	// 여행작가 로그인
	@PostMapping("/travelerLogin")
	public String travelerLogin(HttpSession session, Traveler traveler) {
		log.debug(traveler.getTravelerId());
		log.debug(traveler.getTravelerPw());
		Traveler loginTraveler = travelerService.getSelectTraveler(traveler);
		if(loginTraveler == null) {
			// login 실패!
			return "redirect:/travelerLogin";
		}
		session.setAttribute("loginTravelerId", loginTraveler.getTravelerId());
		log.debug((String) session.getAttribute("loginTravelerId"));
		return "redirect:/index";
	}
	
	// 여행작가 회원가입
	@GetMapping("/addTraveler")
	public String addTraveler() {
		return "traveler/addTraveler";
	}
	
	// 여행작가 회원가입
	@PostMapping("/addTraveler")
	public String addBoard(Traveler traveler) {
		
		// 회원가입 시 회원 탈퇴 테이블에 존재하는 아이디를 적는다면 retrun값 호출
		if((travelerService.getSelectDeleteTravelerId(traveler.getTravelerId()) == 1) || 
			(travelerService.getSelectTravelerId(traveler.getTravelerId()) != null)) {
			return "redirect:/addCustomer";
		}
		
		// 회원 가입
		travelerService.addTraveler(traveler);
		log.debug("★★★★Hyun★★★★"+traveler.toString());
		
		// 여행작가 회원가입 시 여행작가 회원가입 요청 리스트에 추가
		joinRequestService.addTravelerJoinRequest(traveler.getTravelerId());
		
		return "redirect:/index";
	}
}
