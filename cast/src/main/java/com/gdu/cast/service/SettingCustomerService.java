package com.gdu.cast.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.cast.mapper.SettingCustomerMapper;
import com.gdu.cast.vo.Customer;

@Transactional
@Service
public class SettingCustomerService {
	@Autowired SettingCustomerMapper settingCustomerMapper;
	
	   // 비밀번호 변경
	   public int getUpdatePwCustomer(String customerId, String customerPw , String newCustomerPw) {
		   
	      return settingCustomerMapper.updatePwCustomer(customerId, customerPw ,newCustomerPw);
	      
	   }
	
	   // 회원탈퇴 (delete_id 테이블에 입력)
	   public void getInsertDeleteId(String customerId) {
		   
		settingCustomerMapper.insertDeleteId(customerId);
		   
	   }
	   
	   // 회원탈퇴 (customer테이블 삭제)
	   public void getDeleteCustomer(String customerId, String customerPw) {
		   settingCustomerMapper.deleteCustomer(customerId, customerPw);
	   }
	   
	   // 로그인 기록 삭제
	   public void getdeleteCustomerLogin(String customerId) {
		   settingCustomerMapper.deleteCustomerLogin(customerId);
	   }
	   
	   // 비밀번호 조회 조건문
	   public int getselectCustomerPw(String customerId, String customerPw) {
		   return settingCustomerMapper.selectCustomerPw(customerId, customerPw);
	   }
	   
	   public void getdeleteCustomerWishList(String customerId) {
		  // 체험 관심상품 삭제
		   settingCustomerMapper.deleteCustomerWishList(customerId);
		   // 숙소 관심상품 삭제
		   settingCustomerMapper.deleteCustomerRoomWishList(customerId);
	   }

}
