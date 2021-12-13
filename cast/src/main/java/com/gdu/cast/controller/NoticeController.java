package com.gdu.cast.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.cast.service.NoticeService;
import com.gdu.cast.vo.Notice;


@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		
		return "/admin/addNotice";
	}
	
	@PostMapping("/admin/addNotice")
	public String addNotice(HttpSession session, Notice notice) {
		String adminId = (String) session.getAttribute("loginAdminId");
		notice.setAdminId(adminId);
		System.out.println(notice);
		noticeService.addNotice(notice);
		return"redirect:/noticeList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchTitle) {
			// required = true -> 값이 안넘어오면 에러, required = false -> 안넘어오면 null
		System.out.println(searchTitle);
		final int ROW_PER_PAGE = 10;
		Map<String, Object> map = noticeService.getNoticeList(currentPage, ROW_PER_PAGE, searchTitle);
		System.out.println(session);
		System.out.println(session.getAttribute("loginAdminId"));
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("totalPage", map.get("totalPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("loginAdminId", session.getAttribute("loginAdminId"));
		System.out.println(session.getAttribute("loginAdminId") + " 공지사항리스트 세션값");
		return "noticeList";
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, int noticeNo) {
		System.out.println(noticeNo);
		Notice notice = noticeService.NoticeOne(noticeNo);
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + notice + "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		model.addAttribute("noticeNo", notice.getNoticeNo());
		model.addAttribute("adminId", notice.getAdminId());
		model.addAttribute("noticeTitle", notice.getNoticeTitle());
		model.addAttribute("noticeContent", notice.getNoticeContent());
		model.addAttribute("createDate", notice.getCreateDate());
		model.addAttribute("updateDate", notice.getUpdateDate());
		return"noticeOne";
	}
	
	@GetMapping("/updateNotice")
	public String updateNotice(int noticeNo, Model model) {
		System.out.println(noticeNo + "<-------noticeNo");
		model.addAttribute("noticeNo", noticeNo);
		return "/admin/updateNotice";
	}
	
	@PostMapping("/admin/updateNotice")
	public String updateNotice(Notice notice) {
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + notice + "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		noticeService.updateNotice(notice);
		return "redirect:/noticeOne?noticeNo="+notice.getNoticeNo();
		
	}
	
	@GetMapping("/deleteNotice")
	public String delectNotice(int noticeNo, Model model) {
		System.out.println(noticeNo + "<-------noticeNo");
		model.addAttribute("noticeNo", noticeNo);
		return "/admin/deleteNotice";
	}
	
	@PostMapping("/admin/deleteNotice")
	public String deletetNotice(Notice notice) {
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ넘어옴ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + notice + "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
		noticeService.deleteNotice(notice);
		return "redirect:/noticeList";
		
	}
}