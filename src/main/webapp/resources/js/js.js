/**
 * 
 */
function b_img_pop(img_b,title_val){	
	var tmp_width=(screen.availWidth - 300)/2;
	var tmp_height=(screen.availHeight - 300)/2;

	var look='width=300,height=300,left='+tmp_width+',top='+tmp_height;
	
	popwin=window.open("","AABBCC",look)
	popwin.document.open();

	popwin.document.write('<title>'+title_val+'</title>')
	
	popwin.document.write('<body topmargin=0 leftmargin=0><img style=cursor:hand; onclick="self.close()" src="'+img_b+'" onload="opener.resize_img_window(this);"></body>')

	popwin.document.close();
}

function resize_img_window(img)
{
	var t_width=screen.availWidth;
	var t_height=screen.availHeight;
	var tmp_width=0;
	var tmp_height=0;

	tmp_width=(t_width - img.width)/2;
	tmp_height=(t_height - img.height)/2;

	popwin.moveTo(tmp_width,tmp_height);

	var i_width=img.width+10;
	var i_height=img.height+36;
	popwin.resizeTo(i_width,i_height);
}

/*SNS*/

function goFaceBook(msg,url)
{
	var href = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url) + "&t=" + encodeURIComponent(msg);
	var a = window.open(href, 'facebook', '');
	if (a) {
		a.focus();
	}
}

function goTwitter(msg,url)
{
	//var href = "http://twitter.com/home?status=" + encodeURIComponent(msg) + "  " + encodeURIComponent(url);

	var href = "http://twitter.com/share?url=" + encodeURIComponent(url) + "&text="+encodeURIComponent(msg);
	//var href = "http://twitter.com/share?url=" + encodeURIComponent(url);
	var a = window.open(href, 'twitter', '');
	if (a) {
		a.focus();
	}
}


function goMe2Day(msg,url)
{
	var href = "http://me2day.net/posts/new?new_post[body]=" + encodeURIComponent(msg) + "  " + encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent('SmartAudio,헤드폰,이어폰,미니오디오');
	var a = window.open(href, 'me2Day', '');
	if (a) {
		a.focus();
	}
}




/*

var imgObj_WQEQSS = new Image();
function b_img_pop(img_b){	
	imgObj_WQEQSS.src = img_b;
	
	var img_width=imgObj_WQEQSS.width;
	var img_height=imgObj_WQEQSS.height;

	if(!imgObj_WQEQSS.width||!imgObj_WQEQSS.height){
		img_width=500;
		img_height=500;
	}
	var tmp_width=(screen.availWidth - img_width)/2;
	var tmp_height=(screen.availHeight - img_height)/2;

	var look='width='+img_width+',height='+img_height+',left='+tmp_width+',top='+tmp_height;
	
	popwin=window.open("","",look)
	popwin.document.open();
	if(!imgObj_WQEQSS.width||!imgObj_WQEQSS.height){
	popwin.document.write('<title>상세 이미지</title><body topmargin=0 leftmargin=0><table width=500 height=500 cellspacing=0 cellpadding=0 border=0><tr><td align=center><img width=450 style=cursor:hand; onclick="self.close()" src="'+imgObj_WQEQSS.src+'"></td></tr></table></body>')
	}else{
	popwin.document.write('<title>상세 이미지</title><body topmargin=0 leftmargin=0><center><img style=cursor:hand; onclick="self.close()" src="'+imgObj_WQEQSS.src+'"></center></body>')

	}
	
	popwin.document.close();
}



var imgObj_WQEQSS = new Image();
function b_img_pop(img_b){	
	imgObj_WQEQSS.src = img_b;
	
	var img_width=imgObj_WQEQSS.width;
	var img_height=imgObj_WQEQSS.height;

	if(!imgObj_WQEQSS.width||!imgObj_WQEQSS.height){
		img_width=500;
		img_height=500;
	}
	var tmp_width=(screen.availWidth - img_width)/2;
	var tmp_height=(screen.availHeight - img_height)/2;

	var look='width='+img_width+',height='+img_height+',left='+tmp_width+',top='+tmp_height;
	
	popwin=window.open("","",look)
	popwin.document.open();
	if(!imgObj_WQEQSS.width||!imgObj_WQEQSS.height){
	popwin.document.write('<title>상세 이미지</title><body topmargin=0 leftmargin=0><table width=500 height=500 cellspacing=0 cellpadding=0 border=0><tr><td align=center><img width=450 style=cursor:hand; onclick="self.close()" src="'+imgObj_WQEQSS.src+'"></td></tr></table></body>')
	}else{
	popwin.document.write('<title>상세 이미지</title><body topmargin=0 leftmargin=0><center><img style=cursor:hand; onclick="self.close()" src="'+imgObj_WQEQSS.src+'"></center></body>')

	}
	
	popwin.document.close();
}


function b_img_pop(img_b){	
	var t_width=(screen.availWidth-5)/2;
	var t_height=(screen.availHeight-5)/2;

	window.open('http://www.sorishop.com/js/b_img_pop.html?img_b='+img_b,'img_b',"left="+t_width+",top="+t_height+",width=10,height=10");
}
*/

function setCookie( name, value, expiredays )
{
	var endDate = new Date();
	endDate.setDate(endDate.getDate()+expiredays);
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + endDate.toGMTString() + ";" ;
}

 function getCookie( name )
 {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie )
		{
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfCookie = document.cookie.length;
				return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 ) break;
	}
	return "";
 } 

// pre_id로 시작하는것 숨김
function comm_hide_all(pre_id){
	 $("div[id^='"+pre_id+"']").hide();
}

// id_val 숨김,pre_id로 시작하는것 숨김(없을시 '')
function comm_hide(id_val,pre_id){
	 if(pre_id){
		comm_hide_all(pre_id);
	 }
	 $("#"+id_val).hide();	 
}

// id_val 보임,pre_id로 시작하는것 숨김(없을시 '')
function comm_show(id_val,pre_id){
	 if(pre_id){
		comm_hide_all(pre_id);
	 }
	 $("#"+id_val).show();	 
}

// id_val로 시작하는것 toggle
function comm_toggle(id_val){
	 $("#"+id_val).toggle();	 
}

function num_updown(idname,val) {
	var onum = $("#"+idname).val();
	if (onum > 0) {
		var sum = eval(onum) + eval(val);
		if (sum < 1) {
			alert('1개이상 주문가능 합니다.');
		} else {
			$("#"+idname).val(sum);
		}
	}
}

/*
숫자만 입력
 */
function comm_only_num(obj){
	var digits="0123456789";
	var temp;
	var val='';
	var num=obj.value;
	for(var i=0;i<num.length;i++){
		temp=num.substring(i,i+1);
		if(digits.indexOf(temp)==-1){
		}else{
			val=val+temp;
		}
	}

	obj.value=val;
}

function comm_only_num2(obj,digits){
	var temp;
	var val='';
	var num=obj.value;
	for(var i=0;i<num.length;i++){
		temp=num.substring(i,i+1);
		if(digits.indexOf(temp)==-1){
		}else{
			val=val+temp;
		}
	}

	obj.value=val;
}
