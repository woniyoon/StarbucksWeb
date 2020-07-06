<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {

	//필요없는거 같음 ;;;;;
/* 	console.log(sessionStorage.getItem("price_to_pay"));
	console.log(sessionStorage.getItem("store_id"));
	console.log(sessionStorage.getItem("deducted_point"));
	console.log(sessionStorage.getItem("product_id"));
	console.log(sessionStorage.getItem("item_seq"));
	console.log(sessionStorage.getItem("price_per_item")); */
	
	var amount = sessionStorage.getItem("price_to_pay");
	/* var slip_no = ${slipNo}; */
	/* console.log(slip_no); */
	
	amount /= 100;

	var IMP = window.IMP; 
   
	IMP.init("imp38336214");
	
	// 결제요청하기
	IMP.request_pay({
       pg : "html5_inicis",
       pay_method : "card",
       merchant_uid : "merchant_" + new Date().getTime(),
       name : "(주) 스타벅스",	
       amount : amount,
       buyer_email : "${sessionScope.loginuser.email}",
       buyer_name : "${sessionScope.loginuser.name}",	 
       buyer_tel : "${sessionScope.loginuser.phone}",
       m_redirect_url : ""
   	}, function(rsp) {

		if ( rsp.success ) { 
			
			window.opener.update_database();
			
		    self.close();
			
        } else {
        	self.close();
            alert("결제에 실패하였습니다. \n 다시 시도해주세요!");
       }

   }); 
}); 

</script>
</head>	

<body>
</body>
</html>
