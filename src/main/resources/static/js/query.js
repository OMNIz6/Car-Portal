
$(document).ready(function(){
	
    $("#submit").click(function(){
		var validation = !!chkblank('fname','n-error') 
						&& !!chkblank('lname','n-error') 
						&& !!ValidateER('email','e-error') 
						&& !!chkblank('password','p-error') 
						&& !!chkpw('cpassword','cp-error');
		
		if (validation == true) {
        	$("#form").submit();
		}else{
			return false
		}
    });
    
    $("#carsubmit").click(function(){
		var validation = !!chkblank('model','e1-error') 
						&& !!chkblank('make','e2-error') 
						&& !!chkblank('kilo','e3-error') 
						&& !!chkblank('reg','e4-error') 
						&& !!chkblank('price','e5-error') 
						&& !!chkblank('fuel','e6-error') 
						&& !!chkblank('color','e7-error') 
						&& !!chkblank('engine','e8-error') 
						&& !!chkblank('power','e9-error') ;
		
		if (validation == true) {
        	$("#form").submit();
		}else{
			return false
		}
    });
     $("#bpsubmit").click(function(){
		var validation = !!validateBidding('bprice','bp-error');
		
		if (validation == true) {
        	$("#bpform").submit();
		}else{
			return false
		}
    });
});
