var curr_datetime = new Date();
var seconds = curr_datetime.getSeconds();
var minutes = curr_datetime.getMinutes();
var hours = curr_datetime.getHours();
var month = curr_datetime.getMonth();
var year = curr_datetime.getFullYear();
var date = curr_datetime.getDate();

month = month + 1;
seconds = seconds + 1;
minutes = minutes + 20;	//change again

if(minutes > 60){
	hours = hours + 1;
	minutes = minutes - 60;
}
var date_string = date+"/"+month+"/"+year+" "+hours+":"+minutes+":"+seconds;
//document.getElementById("date_string").innerHTML = date_string;

var limit=new Date(date_string).getTime();
var x=setInterval(function(){	
	var now=new Date().getTime();
	var distance=limit-now;
	document.getElementById("distance").innerHTML = distance;
	
	var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	
	document.getElementById("time").innerHTML = hours + "h " + minutes + "m " + seconds + "s";
	if (distance < 0 || (minutes == 0 && seconds == 0)) {
	    clearInterval(x);
	    document.getElementById("time").innerHTML = "EXPIRED";
	    document.getElementById("send").click();
	}
},1000);