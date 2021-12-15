package com.gdu.cast.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.cast.vo.Admin;
import com.gdu.cast.vo.Qna;

@Mapper
public interface AdminMapper {
	Admin selectAdmin(Admin admin); // 관리자 로그인 시 사용
	
	// 관리자 페이지 신규회원수
	int selectNewCustomer();
	
	int selectNewTraveler();
	
	int selectNewCeo();
}
