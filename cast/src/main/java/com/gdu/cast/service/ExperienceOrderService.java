package com.gdu.cast.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.cast.mapper.ExperienceOrderMapper;
import com.gdu.cast.vo.ExperienceOrder;
import com.gdu.cast.vo.ExperiencePayment;

@Transactional
@Service
public class ExperienceOrderService {
	@Autowired ExperienceOrderMapper experienceOrderMapper;
	
	// 체험 결제 요금
	public int getexperienceSelectPrice(int experienceId) {
		return experienceOrderMapper.experienceSelectPrice(experienceId);
		
	}
	
	// 체험 예약  insert
	public int getexperienceInsertOrder(int experienceOrderPeople, String experienceName, String customerId, String experienceOrderEndDate, String experienceOrderStartDate) {
		 System.out.println(experienceName+ "experienceName");
		experienceOrderMapper.experienceInsertOrder(customerId,experienceName,experienceOrderPeople,experienceOrderStartDate,experienceOrderEndDate);
		System.out.println("2#@#@#@#@");
		 return experienceOrderMapper.experienceOrderId(customerId);

	}
	// 체험 이름
	public String getexperienceSelectName(int experienceId) {
		return experienceOrderMapper.experienceSelectName(experienceId);
	}
	
	// 결제 테이블 insert
	public void getexperienceInsertPayment(int experienceOrderId, String experiencePaymentMethod, String experiencePaymentMethodNumber, int experiencePaymentMoney) {
		experienceOrderMapper.experienceInsertPayment(experienceOrderId,experiencePaymentMethod, experiencePaymentMethodNumber, experiencePaymentMoney );
		
	}
	
	// 고객 페이지에 본인이 한 예약 리스트 출력
	public Map<String, Object> getCustomerIndexExperienceOrder(String customerId, int currentPage, int ROW_PER_PAGE){
		   Map<String, Object> paramMap = new HashMap<>();
		   
		   int beginRow = (currentPage-1)*ROW_PER_PAGE;
		   paramMap.put("customerId", customerId);
		   paramMap.put("beginRow", beginRow); 
		   paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		   System.out.println(ROW_PER_PAGE +"ROW_PER_PAGE");
		   System.out.println(currentPage +"currentPage");
		   List<ExperienceOrder> experienceOrderList = experienceOrderMapper.CustomerIndexExperienceOrder(paramMap);
		   System.out.println(experienceOrderList.toString()+"@#@#experienceOrderList@#@#");
			Map<String, Object> returnMap = new HashMap<>();
			int lastPage = 0;
			int totalCount = experienceOrderMapper.selectExperienceOrderTotalCount(customerId);
			lastPage = totalCount / ROW_PER_PAGE;
			if(totalCount%ROW_PER_PAGE != 0) {
				lastPage += 1;
			}
			returnMap.put("experienceOrderList", experienceOrderList);
			returnMap.put("lastPage", lastPage);
			return returnMap;
	   }
	
	//고객 페이지에 체험 결제한 리스트 출력
	public Map<String, Object> getCustomerIndexExperiencePayment(String customerId, int currentPage, int ROW_PER_PAGE){
		   Map<String, Object> paramMap = new HashMap<>();
		   
		   int beginRow = (currentPage-1)*ROW_PER_PAGE;
		   paramMap.put("customerId", customerId);
		   paramMap.put("beginRow", beginRow); 
		   paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		   System.out.println(ROW_PER_PAGE +"ROW_PER_PAGE");
		   System.out.println(currentPage +"currentPage");
		   List<ExperiencePayment> experiencePaymentList = experienceOrderMapper.CustomerIndexExperiencePayment(paramMap);
		   System.out.println(experiencePaymentList.toString()+"@#@#experienceOrderList@#@#");
			Map<String, Object> returnMap = new HashMap<>();
			int lastPage = 0;
			int totalCount = experienceOrderMapper.selectExperiencePaymentTotalCount(customerId);
			lastPage = totalCount / ROW_PER_PAGE;
			if(totalCount%ROW_PER_PAGE != 0) {
				lastPage += 1;
			}
			returnMap.put("experiencePaymentList", experiencePaymentList);
			returnMap.put("lastPage", lastPage);
			return returnMap;
	}
	
	// 관리자 페이지에 체험 예약 리스트 출력
	public List<ExperienceOrder> getAdminExperienceOrder(){
		return experienceOrderMapper.selectAdminExperienceOrder();
	}
	
	// 관리자 페이지에 체험 결제 리스트 출력
	public List<ExperiencePayment> getAdminExperiencePayment(){
		return experienceOrderMapper.selectAdminExperiencePayment();
	}
	
	// 관리자 페이지에 체험 예약&결제 상세보기 출력
	public ExperiencePayment getAdminExperiencePaymentOne(int experienceOrderId) {
		return experienceOrderMapper.selectAdminExperiencePaymentOne(experienceOrderId);
	}
}
