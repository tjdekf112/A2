package com.gdu.cast.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.cast.vo.ExperiencePaymentReview;
import com.gdu.cast.vo.ExperiencePaymentReviewImage;
import com.gdu.cast.vo.RoomPaymentReview;
import com.gdu.cast.vo.RoomPaymentReviewImage;

@Mapper
public interface MainExperienceOrHotelReviewMapper {
	//체험 리뷰 리스트 출력
	List<ExperiencePaymentReview> experiencePaymentReview(Map<String, Object> map);
	//체험 리뷰 리스트 페이징
	int selectExperienceReviewTotalCount();
	//체험 결제 아이디 매개변수
	int selectCustomerPaymentId(String experienceName, String customerId);
	// 체험 후기 추가
	void insertExperiencePaymentReview(ExperiencePaymentReview experiencePaymentReview);
	// 체험 후기 사진 추가
	void insertExperiencePaymentReviewImage(ExperiencePaymentReviewImage experiencePaymentReviewImage);
	// 체험 후기 삭제
	void deleteExperienceReview(int experiencePaymentReviewId);
	// 호텔 리뷰 리스트 출력
	List<RoomPaymentReview> roomPaymentReview(Map<String, Object> map);
	// 호텔 리뷰 리스트 페이징
	int selectRoomReviewTotalCount();
	// 호텔 결제 아이디 매개변수
	int selectCustomerHotelPaymentId(String hotelName, String customerId);
	// 호텔 후기 추가
	void insertRoomPaymentReview(RoomPaymentReview roomPaymentReview);
	// 호텔 후기 사진 추가
	void insertRoomPaymentReviewImage(RoomPaymentReviewImage roomPaymentReviewImage);
	// 호텔 후기 삭제
	void deletehotelReview(int roomPaymentReviewId);
	// 결제한 사람만 채험 리뷰 작성 가능하도록 하는 조건문 키값.
	String selectExperienceId(String customerId, String experienceName);
	// 결제한 사람만 호텔 리뷰 작성 가능하도록 하는 조건문 키값.
	String selectHotelId(String customerId, String hotelName);
	// 체험 리뷰 리스트 고객페이지에 출력
	List<ExperiencePaymentReview> CustomerExperienceReviewList(Map<String , Object> Map);
	// 체험 리뷰 리스트 고객페이징
	int CustomerExperienceReviewTotalCount(String customerId);
	// 호텔 리뷰 리스트 고객페이지에 출력
	List<RoomPaymentReview> CustomerHotelReviewList(Map<String, Object> Map);
	// 호텔 리뷰 리스트 고객페이징
	int CustomerRoomReviewTotalCount(String customerId);
	
}
