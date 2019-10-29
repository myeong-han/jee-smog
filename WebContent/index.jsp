<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.sendRedirect("main/main.jsp"); 

// 파일삭제 메소드 추가 필요 (회원탈퇴, 회원정보 수정 프로필이미지)
// (회원가입 및 회원정보 수정에서 (올린 파일이 이미지가 아닐 경우))
// edit, del, reply 구현


// 구현할 수 없는 미흡한 점 : 게시판 별로 특정 주제(vape, cycle, motocycle, camera, fishing)를 기준으로 세분화 되는 기능
// 회원가입시 선택한 특정주제(취미)에 맞춰 맞춤형 메인페이지를 제공하는 기능
%>