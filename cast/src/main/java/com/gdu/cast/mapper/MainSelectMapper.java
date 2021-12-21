package com.gdu.cast.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.cast.vo.ExperienceSelect;
import com.gdu.cast.vo.RoomSelect;

@Mapper
public interface MainSelectMapper {
	
	// 자신이 등록한 체험 추천 삭제
	int deleteExperienceSelect(ExperienceSelect experienceSelect);
	
	// 자신이 등록한 체험 추천 수정
	int updateExperienceSelect(ExperienceSelect experienceSelect);
	
	// 자신이 등록한 숙소 추천 삭제
	int deleteRoomSelect(RoomSelect roomSelect);
		
	// 자신이 등록한 숙소 추천 수정
	int updateRoomSelect(RoomSelect roomSelect);
	
	// 메인 페이지 체험 추천 상세보기
	ExperienceSelect selectExperienceSelectOne(int experienceSelectId);
	
	// 메인페이지의 숙소 추천 상세보기
	RoomSelect selectRoomSelectOne(int RoomSelectId);
	
	// 메인 페이지의 체험 추천 리스트 
	List<ExperienceSelect> selectExperienceList(Map<String, Object> map);
	
	// 메인 페이지의 체험 추천 전체 글 수
	int selectExperienceTotalCount(String searchTitle);

	// 메인 페이지의 숙소 추천 리스트
	List<RoomSelect> selectRoomSelectList(Map<String, Object> map);
	
	// 메인 페이지의 숙소 추천 전체 글 수
	int selectRoomSelectTotalCount(String searchTitle);
	
}
