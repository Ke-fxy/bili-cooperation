
$().ready(function () {
	$("#login_form").validate({
		rules: {
			id: {
				required:true,
				number:true
			},
			password: {
				required: true,
				minlength: 5
			},
			userCheck:"required"
		},
		messages: {
			id: {
				required:"Please enter your name!",
				number: "Please enter the correct account type"
			},
			password: {
				required: "Please input a password!",
				minlength: jQuery.format("The password cannot be less than {0} characters!")
			},
			userCheck: "Please enter Check Number!"
		}
	});

	$("#register_form").validate({
		rules: {
			username: "required",
			password: {
				required: true,
				minlength: 5
			},
			rpassword: {
				required:true,
				equalTo: "#register_password"
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			username: "Please enter your name!",
			password: {
				required: "Please input a password!",
				minlength: jQuery.format("The password cannot be less than {0} characters!")
			},
			rpassword: {
				required:"Please input your password again!",
				equalTo: "The two passwords are different!"
			},
			email: {
				required: "Please input email!",
				email: "Please enter a valid email address!"
			}
		},
		submitHandler: function(form){
			form.submit(); //没有这一句表单不会提交
		}

	});
});

//给验证码图片绑定单击事件
$("#yanzheng").click(function (){
	this.src = "kaptcha.jpg?d=" + new Date();
});

/*function show_validate_msg(ele,status,msg){
	/!*清空之前的样式*!/
	$(ele).parent().removeClass("has-success has-error");
	$(ele).next("span").text("");
	if("success" == status){
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text(msg);
	}else if ("error" == status){
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(msg);
	}
}*/


// $("#keyWord").change(function (){
// 	alert("111");
// 	var key = this.value;
// 	alert(key);
// 	$.ajax({
// 		url:"${APP_PATH}/changeTag",
// 		data:"keyWord=" + key,
// 		type:"GET",
// 		success:function (result){
// 			if(result.code == 100){
// 				$("#keyWord").attr("value",key);
// 			}else {
// 				$("#keyWord").attr("value","非法的个性签名！");
// 			}
//
// 		}
// 	});
// });

