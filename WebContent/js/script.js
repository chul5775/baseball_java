function zipCheck() {
	url = "zipcheck.jsp?check=y"; // zipcheck.jsp에 check=y 전달.
	window
			.open(url, "post",
					"toolbar=no,width=400,height=300,top=200,left=300,status=yes,menubar=no");
	// ↑ 이게 조그만 window창 띄어주는 거
}

function idCheck() {
	if (regForm.id.value === "") {
		alert("id를 입력하시오.");
		regForm.focus();

	} else {
		url = "idcheck.jsp?id=" + regForm.id.value; // idcheck.jsp에
		// regForm.id.value 값 전달.
		window.open(url, "id",
				"width=300,height=200,top=200,left=300,status=yes,menubar=no");
	}
}

function inputCheck() {
	if (regForm.id.value === "") {
		alert("아이디를 입력하세요!");
		regForm.id.focus();
		return;
	}
	// 나머지는 생략.

	// 정규 표현식으로 이메일 검사
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	if (!regForm.email.value.match(regExp)) {
		alert("이메일을 정확히");
		regForm.email.focus();
		return;
	}

	document.regForm.submit(); // registerproc.jsp로 날아감.
}

function memberUpdate() { // 쇼핑몽 로그인 후 자신의 정보 수정 (입력자료
	document.updateForm.submit(); // memberupdateproc.jsp로 이동함.
}

function memberUpdateCancel() { // 다시 메인 페이지
	location.href = "../guest/guest_index.jsp";
}

function memberDelete() { // 회원탈퇴 버튼 활성화.
	alert("회원탈퇴는 곧 죽음!!!"); // 지금 이렇게 한 이유는 장바구니도 비워줘야하고, 상품도 없어야하기 때문이다.
}

function memUpdate(id) { // 관리자로 회원 수정
	document.updateFrm.id.value = id;
	document.updateFrm.submit();

}

function memberUpdateGuest() { // 관리자가 회원 수정.
	document.updateFormGuest.submit();
}

function btnUpdateCancelAdmin() { // 관리자가 회원 수정 취소.
	location.href = "membermanager.jsp";
}


