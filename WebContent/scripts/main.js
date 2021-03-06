// Join: id, passwd 체크 변수
var isIdAvailabled = false;
var isPasswdAvailabled = false;
var isNameAvailabled = false;
var isNotChanged = true;

// Join: id 중복체크
$('#input-id').keyup(function () {
	var id = $(this).val();
	$.ajax({
		url: "../json/idDupCheck.jsp",
	 	data: {id: id},
		success: function (data) {
			dupMessage(data);
		}
	});
});
function dupMessage(isIdDup) {
	if (frm.id.value.length == 0) {
		$('#id-check').html('&nbsp;');
		isIdAvailabled = false;
	} else if (frm.id.value.length < 4 || frm.id.value.length > 12) {
		$('#id-check').html('ID must be 4~12 words').css('color', 'red');
		isIdAvailabled = false;
	} else if (isIdDup) {
		$('#id-check').html('Choose another one').css('color', 'red');
		isIdAvailabled = false;
	} else {
		$('#id-check').html('Available').css('color', 'green');
		isIdAvailabled = true;
	}
}

// Join: passwd 체크
$('.cp').keyup(function () {
	passwdCheck();
});
function passwdCheck() {
	if (frm.passwd.value.length == 0) {
		$('#passwd-check').html('&nbsp;');
		isPasswdAvailabled = false;
	} else if (frm.passwd.value.length < 4 ||
			frm.passwd.value.length > 15) {
		$('#passwd-check').html('Password must be 4~15 words').css('color', 'red');
		isPasswdAvailabled = false;
	} else if (frm.passwd.value != frm.confilm.value) {
		$('#passwd-check').html('Incorrected').css('color', 'red');
		isPasswdAvailabled = false;
	} else {
		$('#passwd-check').html('Corrected').css('color', 'green');
		isPasswdAvailabled = true;
	}
}

// Join: name 체크
$('#input-name').keyup(function () {
	nameCheck();
});
function nameCheck() {
	if (frm.name.value.length == 0) {
		$('#name-check').html('&nbsp;');
		isNameAvailabled = false;
	} else if (frm.name.value.length < 3 || frm.id.value.length > 10) {
		$('#name-check').html('Name must be 3~10 words').css('color', 'red');
		isNameAvailabled = false;
	} else {
		$('#name-check').html('Available').css('color', 'green');
		isNameAvailabled = true;
	}
	isNotChanged = false;
}

// Join: onsubmit 이벤트
function joinCheck() {
	if (!isIdAvailabled) {
		alert('Check your ID.');
		frm.id.focus();
		return false;
	}
	if (!isPasswdAvailabled) {
		alert('Check your Password.');
		frm.passwd.focus();
		return false;
	}
	if (!isNameAvailabled) {
		alert('Check your Name.');
		frm.name.focus();
		return false;
	}
}

//UpdateMember: onsubmit 이벤트
function updateCheck() {
	if (!isPasswdAvailabled) {
		alert('Check your Password.');
		frm.passwd.focus();
		return false;
	}
	if (!isNameAvailabled && !isNotChanged) {
		alert('Check your Name.');
		frm.name.focus();
		return false;
	}
}


// import : getParameterByName()
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

// nav의 이미지 마우스 오버&아웃 이벤트
var loc = location.pathname.split('/')[2]; // 현재 주소
var imgloc = '../images/include/';
var boardNum = getParameterByName('boardnum'); // 기본값 : 0
// 홈 : 홈주소에서도 홈버튼은 하이라이트되지 않으므로 조건이 필요없음
$('#home-btn').mouseover(function () {
	$('#home-btn').attr('src', imgloc+'home_hover.png');
}).mouseout(function () {
	$('#home-btn').attr('src', imgloc+'home_button.png');
});
// 뉴스
// loc가 'news'와 같지 않으면서, boardNum이 0이 아닌 경우 버튼이벤트
// !(loc=='news' || getParameterByName('boardNum')==0)
if (loc != 'news' && boardNum != 1) {
	$('#news-btn').mouseover(function () {
		$('#news-btn').attr('src', imgloc+'news_hover.png');
	}).mouseout(function () {
		$('#news-btn').attr('src', imgloc+'news_button.png');
	});
}
// 커뮤니티
if (loc != 'community' && boardNum != 2) {
	$('#comm-btn').mouseover(function () {
		$('#comm-btn').attr('src', imgloc+'community_hover.png');
	}).mouseout(function () {
		$('#comm-btn').attr('src', imgloc+'community_button.png');
	});
}
// 갤러리
if (loc != 'gallery' && boardNum != 3) {
	$('#gall-btn').mouseover(function () {
		$('#gall-btn').attr('src', imgloc+'gallery_hover.png');
	}).mouseout(function () {
		$('#gall-btn').attr('src', imgloc+'gallery_button.png');
	});
}
// 후원자
if (loc != 'supporter') {
	$('#supp-btn').mouseover(function () {
		$('#supp-btn').attr('src', imgloc+'supporter_hover.png');
	}).mouseout(function () {
		$('#supp-btn').attr('src', imgloc+'supporter_button.png');
	});
}

// nav>a:"login" 클릭시 등 팝업창 호출되는 함수
function popupLogin(url, sizeX, sizeY) {
	
	var name = 'login';
	var option = '';
	
	var positionX = (window.screen.width/2) - (sizeX/2);
	var positionY = (window.screen.height/2) - (sizeY/2);
	
	option += 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, ';
	option += 'width='+sizeX+', height='+sizeY+', left='+positionX+', top='+positionY;
	
	window.open(url, name, option); 
}

// board Search시 submit 이벤트로 호출되는 함수
function checkSearch() {
	if (sfrm.what_s.value == 'un') {
		alert('Choose title or writer');
		return false;
	}
}