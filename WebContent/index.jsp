<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.sendRedirect("main/main.jsp"); 

// 토탈, 투데이, 추천수, 추천수 기준으로 HotClip 메인페이지에 띄우기.
// 메인페이지에 셀렉트태그 구현 : 취미별
// 구현할 수 없는 미흡한 점 : 게시판 별로 특정 주제(vape, cycle, motocycle, camera, fishing)를 기준으로 세분화 되는 기능
// 회원가입시 선택한 특정주제(취미)에 맞춰 맞춤형 메인페이지를 제공하는 기능
// 게시글 삭제에서 파일 버튼클릭으로 삭제 시킬지 말지 결정 : 현재 미구현으로 모든 기존파일 삭제됨
// 댓글기능
%> 