function func_comma(num){
		var result = "";
		
		if(isNaN(num)) {							// isNaN(문자열) : 문자열이 숫자가 아니라면 true, 숫자이면 false;
			alert("숫자가 아닙니다.");		

		} else {
		
			var nBlockCount = 0; // 세자리마다 분할되어 나오는 블럭수
			var nStartCommaPoint = 0; // 콤마가 최초로 찍히는 인덱스 값
			
			if(num.length % 3 != 0) {
				nBlockCount = parseInt((num.length / 3)) + 1;
				nStartCommaPoint = num.length % 3;
				
			} else {
				nBlockCount = 3;
				nStartCommaPoint = 3;
			}
			
			var nStartIndex = 0;	// num.substring의 첫 번째 파라미터값
			for(var i=0;i<nBlockCount;i++) {
				// num <== 1234567890
				
				// num.substring(0,1) + ","		첫 번째
				// num.substring(1,4) + ","		두 번째 
				// num.substring(4,7) + ","		세 번째 
				// num.substring(7,10) + ","	네 번째 
				
				var sComma = (i != (nBlockCount-1)) ? "," : "";
				
				result += num.substring(nStartIndex, nStartCommaPoint) + sComma;
				
				nStartIndex = nStartCommaPoint;
				nStartCommaPoint += 3;
			}
		}	
		
		return result;
	}

function func_sorting(sString){

	var sResult = "";
	
	if(isNaN(sString)) {
		console.log("숫자가 아니라 정렬할 수 없습니다.");
		
	} else {
		
		var arrArray = sString.split(",");
		
		for(var i=0; i<arrArray.length; i++) {
			for(var j=0; j<arrArray.length-1-i; j++) {
				
				if(Number(arrArray[j]) > Number(arrArray[j+1])) {
					var temp = arrArray[j];
					arrArray[j] = arrArray[j+1];
					arrArray[j+1] = temp;
				}
			}
		}
		
		sResult = arrArray.join(',');
	}
	
	return sResult;
	
	
}


// == 주민번호를 검사하는 함수 == //

function func_jubunCheck(jubun){
	// 9210201234567
	// 8906152063414
	
	
	if(jubun.length != 13) {
		return false;
	} else {
		// 9*2 + 2*3 + 1*4 + 0*5 + 2*6 + 0*7 + 1*8 + 2*9 + 3*2 + 4*3 + 5*4 + 6*5
		// 8*2 + 9*3 + 0*4 + 6*5 + 1*6 + 5*7 + 2*8 + 0*9 + 6*2 + 3*3 + 4*4 + 1*5
		// 16 + 27 + 0 + 30 + 6 + 35+ 16+ 0 + 12 + 9 + 16 + 5
		// 57+ 22 + 51 + 26 + 16
		// 108 + 48 + 16
		// 156 + 16
		//   172
		var nSum = 0;
		
		for(var i=0; i<12; i++){
			
			if(i < 8) {				
				nSum += Number(jubun.substring(i, i+1)) * (i+2);
			} else {
				nSum += Number(jubun.substring(i, i+1)) * (i-6);
			}
		}
		
		var nResult = nSum%11;
		
		nResult = 11 - nResult;
		
		nResult %= 10;
		
		if(nResult == Number(jubun.substring(12, 13))) {
			return true;
		} else {
			return false;
		}
	}
	
}







