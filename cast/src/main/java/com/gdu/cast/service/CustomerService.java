package com.gdu.cast.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.cast.mapper.AdminQnaMapper;
import com.gdu.cast.mapper.CustomerMapper;
import com.gdu.cast.vo.Customer;
import com.gdu.cast.vo.Customer_Login;
import com.gdu.cast.vo.Delete_Id;
import com.gdu.cast.vo.Experience;
import com.gdu.cast.vo.ExperienceSelectComment;
import com.gdu.cast.vo.Hotel;
import com.gdu.cast.vo.Qna;
import com.gdu.cast.vo.QnaComment;
import com.gdu.cast.vo.RoomSelectComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	@Autowired AdminQnaMapper adminQnaMapper;
	
	//고객 회원가입
	public void getaddCustomer(Customer customer) {
		String customerId = customer.getCustomerId();
		String customerName = customer.getCustomerName();
		String customerJumin = customer.getCustomerJumin();
		String customerEmail = customer.getCustomerEmail();
		String customerPw = customer.getCustomerPw();
		String customerPhoneNum = customer.getCustomerPhoneNum();
		String customerActive = customer.getActive();
		
		customer.setCustomerId(customerId);
		customer.setCustomerName(customerName);
		customer.setCustomerJumin(customerJumin);
		customer.setCustomerEmail(customerEmail);
		customer.setCustomerPw(customerPw);
		customer.setCustomerPhoneNum(customerPhoneNum);
		customer.setActive(customerActive);
	    
		customerMapper.insertCustomer(customer);
		log.debug(customer.toString());

	}
	
	 //고객 로그인
	   public Customer getselectCustomer(Customer customer) {
	      String customerId = customer.getCustomerId();
	      String customerPw = customer.getCustomerPw();
	      customer.setCustomerId(customerId);
	      customer.setCustomerPw(customerPw);
	      return customerMapper.selectCustomer(customer);
	   }
	   
	   // 고객이 쓴 qna select
	   public Map<String, Object> getselectQna(String customerId, int currentPage, int ROW_PER_PAGE) {
		   Map<String, Object> paramMap = new HashMap<>();
		   
		   int beginRow = (currentPage-1)*ROW_PER_PAGE;
		   paramMap.put("customerId", customerId);
		   paramMap.put("beginRow", beginRow); 
		   paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		   List<Qna> qnaList = customerMapper.selectQnaList(paramMap);
		   
			Map<String, Object> returnMap = new HashMap<>();
			int lastPage = 0;
			int totalCount = customerMapper.selectQnaTotalCount(customerId);
			lastPage = totalCount / ROW_PER_PAGE;
			if(totalCount%ROW_PER_PAGE != 0) {
				lastPage += 1;
			}
			returnMap.put("qnaList", qnaList);
			returnMap.put("lastPage", lastPage);
			return returnMap;
	   }
	   
	   //qnaOne
	   public Qna getSelectQnaOne(int qnaId){
 
		return customerMapper.selectQnaOne(qnaId);
		   
	   }
	   
	   //Qna상세보기 -> 수정
	   public int getupdateQnaOne(Qna qna) {
		   System.out.println(qna+"!@#!@#qna!Q@#!@#");
		   /*
		   qna.setQnaId(qna.getQnaId());
		   qna.setQnaCategory(qna.getQnaCategory());
		   qna.setQnaContent(qna.getQnaCategory());
		   qna.setQnaTitle(qna.getQnaTitle());
		   */
		return customerMapper.updateQna(qna);
		   
	   }
	   // qna 삭제
	   public int deleteQnaOne(Qna qna) {
		   adminQnaMapper.deleteQnaComment(qna);
		   return customerMapper.deleteQnaOne(qna);
	   }
	   
	   //내정보
	   public Customer getselectInfo(String customerId) {
		   return customerMapper.selectInfo(customerId);
	   }
	   
	   //내정보 수정
	   public int getupdateInfo(Customer customer) {
		   return customerMapper.updateInfo(customer);
	   }
	   
	   // 활성화 비활성화
	   public Customer getSelectActive(String customerId) {
		   System.out.println(customerMapper.selectActive(customerId) + "customerMapper.selectActive(customerId)");
		   return customerMapper.selectActive(customerId);
	   }
	   
	   //로그인 기록 엽데이트
	   public int getupdateDate(String customerId) {
		   return customerMapper.updateDate(customerId);
	   }
	   
	   //로그인 기록 생성
	   
	   public int getinsertCustomerLogin(String customerId) {
		   return customerMapper.insertCustomerLogin(customerId);
	   }
	   
	   //customer테이블 회원 중복
	   public String getCustomerOK(String customerId) {
		   return customerMapper.selectCustomerOK(customerId);
	   }
	   
	   // 로그인 기록 출력
	   public Customer_Login getselectCustomerLogin(Customer_Login customer_Login) {
		   return customerMapper.selectCustomerLogin(customer_Login);
	   }
	   
	   // 비활성화 상태 적용
	   public int getupdateActiveZeroDate(String customerId) {
		   return customerMapper.updateActiveZeroDate(customerId);
	   }
	   
	   // 회원탈퇴 아이디 중복
	   public int getselectDeleteId(String customerId) {
		   System.out.println(customerMapper.selectDeleteId(customerId) + "customerMapper.selectDeleteId()");
		   int result = customerMapper.selectDeleteId(customerId);
		   return result;
	   }
	   
	   // 고객페이지에 등록된 5개의 체험 리스트 출력
	   public  List<Experience> getselectCustomerIndexExperienceList(){
		
		   return customerMapper.selectCustomerIndexExperienceList();
	   }
	   
	   // 고객페이지에 등록된 5개의 숙소 리스트 출력
	   public List<Hotel> getselectCustomerIndexHoelList(){
		   return customerMapper.selectCustomerIndexHoelList();
	   }
	   
	   //사용자가 작성한 추천 댓글의 총 수
	   public int getselectCustomerCommentCount(String customerId) {
		   int hi = customerMapper.selectCustomerCommentCount(customerId);
		   System.out.println(customerMapper.selectCustomerCommentCount(customerId)+"@#!@#!@#!@#!@#!@#!@#!@#!@#!@#!testtestetestsetsetsetsetsetset");
		   return hi;
	   }
	   
	   // 고객이 결제한 총 금액
	   public int getselectCustomerPaymentCount(String customerId) {
		  if((customerMapper.selectCustomerExperienceOrderId(customerId) == 0) || (customerMapper.selectcustomerRoomOrderId(customerId) == 0)) {
			  return 0;
		  }else {
			   int paymentCount = customerMapper.selectCustomerPaymentCount(customerId);
			   return paymentCount; 
		  }
		 
	   }
	   
	   // 고객이 예약한 총 횟수
	   public int getselectCustomerOrderCount(String customerId) {
		   int orderCount = customerMapper.selectCustomerOrderCount(customerId);
		   return orderCount;
	   }
	   
	   // 고객이 작성한 총 후기의 수
	   public int getselectCustomerReviewCount(String customerId) {
		   int selectReviewCount = customerMapper.selectCustomerReviewCount(customerId);
		   return selectReviewCount;
	   }
	   
	   // 고객페이지 체험 추천 댓글 페이지
	   public Map<String, Object> getCustomerExperienceSelectCommentList(String customerId,int currentPage,int row_per_page){
	   Map<String, Object> paramMap = new HashMap<>();
		   
		   int beginRow = (currentPage-1)*row_per_page;
		   paramMap.put("customerId", customerId);
		   paramMap.put("beginRow", beginRow); 
		   paramMap.put("row_per_page", row_per_page);
		
		   List<ExperienceSelectComment> commentList = customerMapper.CustomerExperienceSelectCommentList(paramMap);
		   
			Map<String, Object> returnMap = new HashMap<>();
			int lastPage = 0;
			int totalCount = customerMapper.CustomerselectCommentTotalCount(customerId);
			lastPage = totalCount / row_per_page;
			if(totalCount%row_per_page != 0) {
				lastPage += 1;
			}
			returnMap.put("commentList", commentList);
			returnMap.put("lastPage", lastPage);
			return returnMap;
		   
	   }
	   
	   // 고객 페이지 숙소 추천 댓글 페이지
	   public Map<String, Object> getCustomerRoomSelectCommentList(String customerId, int currentPage, int row_per_page){
	   Map<String, Object> paramMap = new HashMap<>();
		   
		   int beginRow = (currentPage-1)*row_per_page;
		   paramMap.put("customerId", customerId);
		   paramMap.put("beginRow", beginRow); 
		   paramMap.put("row_per_page", row_per_page);
		   List<RoomSelectComment> commentList = customerMapper.CustomerRoomSelectCommentList(paramMap);
			
		   Map<String, Object> returnMap = new HashMap<>();
			int lastPage = 0;
			int totalCount = customerMapper.CustomerselectRoomCommentTotalCount(customerId);
			lastPage = totalCount / row_per_page;
			if(totalCount%row_per_page != 0) {
				lastPage += 1;
			}
			returnMap.put("commentList", commentList);
			returnMap.put("lastPage", lastPage);
			return returnMap;
	   }
	   
	   /*
	   // 총결제 금액 조건문
	   public int getselectCustomerExperienceOrderId(String customerId) {
		   return customerMapper.selectCustomerExperienceOrderId(customerId);
	   }
	   
	   public int getselectcustomerRoomOrderId(String customerId) {
		   return customerMapper.selectcustomerRoomOrderId(customerId);
	   }
	   */

}
