$(document).ready(function() {
	$("#CustomerForm").validate({
		rules: {
			'firstName': {
				required: true
				},
			'lastName': {
				required: true
				},
			'dateofbirth': {
				required: true,
				digits: true,
				maxlength: 10
				},
			'email': {
				required: true,
				email: true
				},
			'age': {
				required: true,
				digits: true
				},
			'gender': {
				required: true
				},
			'address1': {
				required: true
			}
		},
		messages: {
			firstName: {
				required: "Please enter the First name!"
				},
			lastName: {
				required: "Please enter the Last name!"
			},
			dateofbirth: {
				required: "Please pick your Date Of Birth!"
			},
			mobile: {
				required: "Please enter phone number",
				maxlength: "Number must be at least 10 digit long"
			},
			email: {
				required: "Please enter a valid email"
			},
			age: {
				required: "Please enter your age in digit"
			},
			gender: {
				required: "Please select a gender"
			},
			address1: {
				required: "Please enter your address"
			},
		}
	});
	$('#email').change(function(){
		var enteredEmail = $("#email").val();
		$.ajax({
			url : '/customer/checkemail',
			data : {email:enteredEmail},
			type : 'GET',
			success : function(result) {
				if (result) {
					console.log("result in if",result);
					$("#emailMsg").html("Email already exists");
					$("#Button").prop("disabled",true);
				} else {
					console.log("result in else",result);
					$("#emailMsg").html("");
					$("#Button").prop("disabled",false);
				}
			}
		});
	});
	$('#mobile').change(function(){
		var enteredMobile = $("#mobile").val();
		$.ajax({
			url : '/customer/checkmobile',
			data : {mobile:enteredMobile},
			type : 'GET',
			success : function(result) {
				if (result) {
					console.log("result in if",result);
					$("#mobileMsg").html("Mobile already exists");
					$("#Button").prop("disabled",true);
				} else {
					console.log("result in else",result);
					$("#mobileMsg").html("");
					$("#Button").prop("disabled",false);
				}
			}
		});
	});
});