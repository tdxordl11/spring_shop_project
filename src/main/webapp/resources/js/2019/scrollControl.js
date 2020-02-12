/**
 * 
 */
/** 
* Author	: MC 심새 (ganer9r@naver.com) 
* Make Date : 2008-07-15
* comment	: 1줄 텍스트 롤링 스크립트
**/
var ScrollControl	= function(objId,options){
	this.init(objId,options);
}
ScrollControl.prototype	= {
	stage : {},
	options : {},
	isover : false,
	freeze : false,
	course : 'top',

	init : function(objId,options){
		this.setOptions(options);
		this.setStage(objId);
		this.setTrueData();

		this.move();
	},
	setOptions : function(options){
		options.inteval	= options.inteval	|| 20;
		options.freeze	= options.freeze	|| 2000;
		options.height	= parseInt(options.height, 10)	|| 20;

		options.cMarginTop	= options.cMarginTop	|| (options.height/2) * 0.5;
		options.cHeight		= options.height - options.cMarginTop;

		this.options	= options;
	},
	setTrueData : function(){
		var cObjs		= this.stage.childNodes;
		var removes		= [];

		for(var i=0;i<cObjs.length;i++){
			if(!cObjs[i].tagName){
				removes.push(cObjs[i]);	//바로 삭제 시 데이터 꼬이는듯 하여 일단 킵함.
			}else{
				cObjs[i].style.margin		= "0";

				cObjs[i].style.marginTop	= this.options.cMarginTop;
				cObjs[i].style.height		= this.options.cHeight;
			}
		}

		// 찾은 데이터를 삭제함.(FF의 경우 text 노드가 첨부됨.)
		for(var i=0;i<removes.length;i++){
			this.stage.removeChild(removes[i]);
		}

		if(cObjs.length == 1){
			this.stage.appendChild( cObjs[0].cloneNode(true) );
		}

	},
	setStage : function(objId){
		var This	= this;
		this.stage		= document.getElementById(objId);

		this.stage.style.height		= this.options.height;
		this.stage.style.overflow	= "hidden";
		this.stage.style.padding	= "0px";
		this.stage.style.margin		= "0px";

		this.stage.onmouseover=function(){This.isover=true;} 
		this.stage.onmouseout=function(){This.isover=false;} 
	},
	setCourse : function(course){
		if(this.course != 'down' && course == 'down'){
			this.changeChild();
			this.stage.scrollTop = this.options.height;
		}else if(course == 'top' && this.stage.scrollTop >= this.options.height){
			this.stage.appendChild(this.stage.childNodes[0]);
			this.stage.scrollTop = this.stage.scrollTop - this.options.height;
		}

		this.course	= course;
	},
	changeChild : function(){
		var childCnt	= this.stage.childNodes.length;

		for(var i=0; i<childCnt-1;i++ ){
			this.stage.appendChild( this.stage.childNodes[0] );	// 항상 첫번째것을 뒤로 이동
		}
	},
	actionTop : function(){
		this.stage.scrollTop++;
		if( this.stage.scrollTop >= this.options.height ){
			this.stage.appendChild(this.stage.childNodes[0]);
			this.stage.scrollTop = this.stage.scrollTop - this.options.height;
			this.freeze			= true;
		}
	},
	actionDown : function(){
		this.stage.scrollTop--;
		if( this.stage.scrollTop == 0 ){
			this.changeChild();
			this.stage.scrollTop = this.options.height;
			this.freeze			= true;
			
			this.setCourse("top");
		}
	},
	move : function(){
		if(!this.isover){
			if(this.course == 'top')	this.actionTop();
			else						this.actionDown();
		}

		var This	= this;
		if(this.freeze)	window.setTimeout(function(){This.move()}, this.options.freeze); 
		else			window.setTimeout(function(){This.move()}, this.options.inteval); 
		this.freeze	= false;
	}

}


/* 사용법 Start*/
//	var scroll	= new ScrollControl('html element id',options);
//
//	options 항목
//	inteval : 재귀호출 시간 간격 1/1000초(기본값 50)
//	freeze : 잠시 멈춰 있는 시간 간격 1/1000 초(기본값 1000)
//	height : 객체 높이(기본값 20)
//	cMarginTop : 자동으로 구해주나, 글자 크기와 객체 높이 등으로 인해, 의도한 높이가 나오지 않을 수 있기 때문에 사용자가 강제 입력함.
//	
/* 사용법 End */