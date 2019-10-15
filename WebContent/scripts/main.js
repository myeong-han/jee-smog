// Join: id, passwd 체크 변수
var isIdAvailabled = false;
var isPasswdAvailabled = false;
var isNameAvailabled = false;

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

// nav>a:"login" 클릭시 호출되는 함수
function popupLogin(url, sizeX, sizeY) {
	
	var name = 'login';
	var option = '';
	
	var positionX = (window.screen.width/2) - (sizeX/2);
	var positionY = (window.screen.height/2) - (sizeY/2);
	
	option += 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, ';
	option += 'width='+sizeX+', height='+sizeY+', left='+positionX+', top='+positionY;
	
	window.open(url, name, option); 
}