/**
 * 
 */
function chkblank(check, error) {
	var x = document.getElementById(check).value;
	if (x == "") {
		document.getElementById(error).innerHTML = "Please Fill This Field";
		return false;
	} else {
		document.getElementById(error).innerHTML = "";
		return true;
	}
}
// for not filling the mandatory field

function ValidateER(mail, error) {
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var x = document.getElementById(mail).value;
	if (x.match(mailformat)) {
		document.getElementById(error).innerHTML = "";
		return true;
	} else{
		document.getElementById(error).innerHTML = "Invalid Email Format";
		return false;
	}
}
//for email validation

function validatePh(iph, eph) {
	var phoneno = /^09\d{9}$/;
	var x = document.getElementById(iph).value;
	if ((x.match(phoneno))) {
		document.getElementById(eph).innerHTML = "";
		return true;
	}
	else {
		document.getElementById(eph).innerHTML = "Invalid Phone Number ";
		return false;
	}
}
// for phone number validation

function chkpw(pass, error) {
	var x = document.getElementById("password").value;
	var y = document.getElementById(pass).value;
	if (x == y) {
		document.getElementById(error).innerHTML = "";
		return true;
	} else {
		document.getElementById(error).innerHTML = "Password does not match";
		return false;
	}
}
// confirm password validation
function validategen(gen, egen) {
	var genformat = /\d{4}$/;
	var x = document.getElementById(gen).value;
	if ((x.match(genformat))) {
		document.getElementById(egen).innerHTML = "";
		return true;
	}
	else {
		document.getElementById(egen).innerHTML = "Invalid Format";
		return false;
	}
}

//for bidding validation

function validateBidding(check, error) {
	var bidFormat = /\D/g;
	var x = document.getElementById(check).value;
	if ((x.match(bidFormat))) {
		document.getElementById(error).innerHTML = "Enter the valid amount";
		return false;
	}
	else {
		document.getElementById(error).innerHTML = "";
		return true;
	}
}

function validatelic(lno, elno) {
	var lnoformat = /\d\w-\d{4}$/;
	var x = document.getElementById(lno).value;
	if ((x.match(lnoformat))) {
		document.getElementById(elno).innerHTML = ""
		return true;
	}
	else {
		document.getElementById(elno).innerHTML = "Invalid Format"
		return false
	}
}
function chkbox(chk, error) {
	var x = document.getElementById(chk);

	if (x == true) {
		document.getElementById(error).innerHTML = "";
		return true;
	} else {
		document.getElementById(error).innerHTML = "Please agree to the Terms and Condiions";
		return false;
	}
}

function clickSubmit() {
	var validation = !!chkblank('fname', 'n-error') && !!chkblank('lname', 'n-error') && !!ValidateER('email', 'e-error') && !!chkblank('password', 'p-error') && !!chkpw('cpassword', 'cp-error');
	if (validation == true) {
		submit()
	} else {
		return false
	}
}