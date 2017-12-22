<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, com.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Healthwiki || Experts Registration</title>
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<jsp:include page="genericheader.jsp"/>
<script>
function checkvalidation() {
	var ui = document.getElementById("txtuserid").value;
	var flag=false;
	
	var phoneno = /^\d{10}$/;
	var phone = document.getElementById("phoneno");
	if (phone.value.match(phoneno)) {
		flag=true;
	} 
	else {
		alert("Enter valid contact number");
		return false;
	}
	var pass1 = document.getElementById("txtuserpass1");
	var pass2 = document.getElementById("txtuserpass2");
	
	if (pass1.value==pass2.value) {
		if((pass1.value.length>=8)&&(pass1.value.length<=12)){
			//alert("not else");
		     flag=true;}
		else{
			alert("Password length should be 8-12 characters");
			return false;
			} 
		}
	else {
		alert("Both the passwords are not same");
		return false;
	}
/* 		
	if(flag){
	var fg=checkUserValidation(ui);
	alert(fg);
	if(fg){
		
	}else{
		return false;
	}
	} */
	if(flag)
		return true;

}
function checkUserValidation(ui){
	var fg=false;
	var x;
	if(XMLHttpRequest)
		x=new XMLHttpRequest();
	else
		x=new ActiveXObject("Microsoft.XMLHTTP"); 
	x.onreadystatechange=function()
	{
		if((x.readyState==4)&&(x.status==200))
		{
			var s=x.responseText;
			var col=s.split(',');
			//alert(col);
			if(col[0]=='red'){
				alert("UserId alredy exists. Enter Another UserId");
	     		fg= false;
				}
			else{
				fg= true;
			}
			
	}}
		x.open("get","/ehealthcare/CheckUserId?uid="+ui,"true");
		x.send();
		alert(fg);

}
function checkpass1(pass1)
{
	if(pass1.length<8)
		document.getElementById("pass1").innerHTML="<font color='red'>Password is too short</font>";
		else
	if(pass1.length>12)	
		document.getElementById("pass1").innerHTML="<font color='red'>Password is too long</font>";		
		else
	if((pass1.length>=8)&&(pass1.length<=12))
		document.getElementById("pass1").innerHTML="<font color='green'>Password length is correct</font>";
}

function checkpass2(pass2)
{
	var pass1 = document.getElementById("txtuserpass1").value;
	if (pass1==pass2) 
		document.getElementById("pass2").innerHTML="<font color='green'>Password matched</font>";
		else
		document.getElementById("pass2").innerHTML="<font color='red'>Password don't match</font>";
}

function checkUserId(ui)
{ 
var x;
if(XMLHttpRequest)
	{
	x=new XMLHttpRequest();
	}
else
{	
	x=new ActiveXObject("Microsoft.XMLHTTP"); 
}
x.onreadystatechange=function()
{
	if((x.readyState==4)&&(x.status==200))
			{
		var data=x.responseText;
		var col=data.split(',');
		document.getElementById("info").innerHTML="<font color='"+col[0]+"'>"+col[1]+"</font>";
		if(col[0]=="red")
		document.getElementById("txtuserid").focus();
			}
}
x.open("get","/ehealthcare/CheckUserId?uid="+ui,"true");
x.send();
	}
</script>

</head>
<body>
	<a class="button small" href="index.jsp">Home</a>
	<div class="container">
			<header class="major">
				<h2>Expert Registration</h2>
			</header>
		</div>
	
	<div style="margin-left: 350px">
		<form method="post" action="/ehealthcare/RegistrationExperts"
			onsubmit="return checkvalidation()">
			<div class="row uniform 50%">
				<div class="6u$ 12u$(4)">
					<input type="text" id="txtname" name="txtname" required="required"
						placeholder="Name" />
				</div>
				<div class="6u$ 12u$(4)">
					<input type="text" id="txtuserid" name="txtuserid"
						required="required" placeholder="userid"  onblur="checkUserId(this.value)" />
				<h5 id="info"></h5>
				</div>
				<div class="6u$ 12u$(4)">
					<input type="email" id="email" name="email" required="required"
						placeholder="Email" />
				</div>

				<div class="6u$ 12u$(4)">
					<input type="password" id="txtuserpass1" name="txtuserpass1"
						required="required" placeholder="Password" onblur="checkpass1(this.value)"/>
				<h5 id="pass1"></h5>
				</div>
				<div class="6u$ 12u$(4)">
					<input type="password" id="txtuserpass2" name="txtuserpass2"
						required="required" placeholder="Confirm Password" onblur="checkpass2(this.value)"/>
						<h5 id="pass2"></h5>	
				</div>
				<div class="4u 12u$(3)">
					<input type="radio" id="male" name="gender" value="male" /> <label
						for="male">Male</label>
				</div>
				<div class="4u 12u$(3)">
					<input type="radio" id="female" name="gender" value="female"
						checked /> <label for="female">Female</label>
				</div>
				<div class="6u$ 12u$(4)">
					<input type="text" id="dob" name="dob" required="required" pattern="\d{1,2}-\d{1,2}-\d{4}"
						placeholder="Date Of Birth (dd-mm-yyyy)" />
				</div>
				<div class="6u$ 12u$(4)">
					<input type="text" id="phoneno" name="phoneno" required="required"
						placeholder="Contact Number" />
				</div>
				<div class="6u$ 12u$(4)">
					<textarea name="txtadd" id="txtadd" placeholder="Address" rows="2"></textarea>
				</div>

				<div class="6u$ 12u$(4)">
					<div class="select-wrapper">
						<select name="role" id="role">
							<option value="default">- Role -</option>
							<option value="yogaexpert" selected="selected">Yoga Expert</option>
							<option value="dietician">Dietician</option>
							<option value="nutritionist">Nutritionist</option>
						</select>
					</div>
				</div>
				<div class="6u$ 12u$(4)">
				<textarea name="exp" id="exp" placeholder="Experience" rows="1" required></textarea>
				</div>
				<div class="6u$ 12u$(4)">
				<textarea name="skills" id="skills" placeholder="Skills" rows="1"  required></textarea>
				</div>
				<div class="6u$ 12u$(3)">
					<input type="checkbox" id="human" name="human" required /> <label
						for="human">I am a human and not a robot</label>
				</div>
				<div class="12u$">
					<ul class="actions">
						<li><input type="submit" value="Submit" class="special" /></li>
						<li><input type="reset" value="Reset" /></li>
					</ul>
				</div>
		</form>
	</div>
</body>
</html>