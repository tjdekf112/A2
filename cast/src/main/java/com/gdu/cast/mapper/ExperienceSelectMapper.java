package com.gdu.cast.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.cast.vo.ExperienceSelect;
import com.gdu.cast.vo.ExperienceSelectImage;

@Mapper
public interface ExperienceSelectMapper {
	
	// 체험 추천 사진 추가
	void insertExperienceSelectImage(ExperienceSelectImage experienceSelectImage);
	
	// 체험 추천 추가
	void insertExperienceSelect(ExperienceSelect experienceSelect);
	
	// 자신이 등록한 체험 추천 리스트 
	List<ExperienceSelect> selectExperienceList(Map<String, Object> map);
	
	// 자신이 등록한 체험 추천 전체 글 수
	int selectExperienceTotalCount(String travelerId);
}
