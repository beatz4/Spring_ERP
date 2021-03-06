/**
 * 
 */

// 자바 스크립트 정규식 

// 한글, 영어만 가능
var reg_name = /^[가-힣a-zA-Z]+$/;

// 이메일
var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

//전화번호 (000-0000-0000)
var reg_phone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

// 주민번호 (-포함) 
var reg_regnumber = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

// 공백 체크
var reg_blank = /[\s]/g;

/*
톰캣 버전 규약강화로 인해 특문에 제약이 걸린다
사용가능한 특수문자 : -._~:/?#[]@!$&'()*+,;=`
참고 : http://taesikman1.tistory.com/64 
*/

// 특수 문자 체크
var reg_special_char = /[~!@\#$%<>^&*\()\-=+_\’]/gi;

// 특문+영문(한글)+숫자 - 패스워드 
var reg_password = /^(?=.*[a-zA-Z])(?=.*[!@#$*+=-])(?=.*[0-9]).{8,16}$/;
