"use strict";

function gfn_isNull(str) {
	var chkStr = new String(str);
	
	if (str == null) {
		return true;
	}
	if (str == "NaN") {
		return true;
	}
	if (chkStr.valueOf() == "undefined") {
		return true;
	}
	if (chkStr == null) {
		return true;
	}
	if (chkStr.toString().length == 0) {
		return true;
	}
	
	return false;
}

var gfv_SubmitCallback = "";
function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if (this.formId == "commonForm") {
		//$("#commonForm")[0].reset();
		$("#"+this.formId).empty();
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.addParam = function addParam(key, value) {
		$("#" + this.formId).append(
				$("<input type='hidden' name='" + key + "' id='" + key + "' value='" + value + "' >")
		);
	};
	
	this.setCallback = function setCallback(callBack) {
		gfv_SubmitCallback = callBack;
	};
	
	this.submit = function submit() {
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
	
	this.openPopup = function openPopup(w, h) {
		var l = (screen.availWidth - w) / 2;
		var t = (screen.availHeight - h) / 2;
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.target = "commonForm";
		window.open('', "commonForm", "width= "+ w + ",height=" + h + ",left=" + l + ",top=" + t
				+ ", scrollbars=no, location=no, toolbar=no, menubar=no, status=no, toolbar=no");
		frm.submit();
		
		// 호출 후 콜백
		if(!gfn_isNull(gfv_SubmitCallback)){
			eval(gfv_SubmitCallback+"();");
		}
	};
}

var gfv_ajaxCallback = "";
function ComAjax(opt_formId) {
	this.url = "";		
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param = "";
	
	if(this.formId == "commonForm") {
        var frm = $("#commonForm");
        if(frm.length > 0){
	        frm.remove();
        }
        
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.setCallback = function setCallback(callBack) {
		gfv_ajaxCallback = callBack;
	};

	this.addParam = function addParam(key,value){ 
		this.param = this.param + "&" + key + "=" + value; 
	};
	
	this.ajax = function ajax() {
		if(this.formId != "commonForm") {
			this.param += "&" + $("#" + this.formId).serialize();
		}
		$.ajax({
			url : this.url,
			type : "POST",
			data : this.param,
			async : false,
			success : function(data, status) {
				if(typeof(gfv_ajaxCallback) == "function"){
					gfv_ajaxCallback(data);
				}
				else {
					eval(gfv_ajaxCallback + "(data);");
				}
			}
		});
	};
}

/**
 * divId : 페이징 태그가 그려질 div
 * pageIndx : 현재 페이지 위치가 저장될 input 태그 id
 * recordCount : 페이지당 레코드 수
 * totalCount : 전체 조회 건수 
 * eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
 */
var gfv_pageIndex = null;
var gfv_eventName = null;
var gfn_searchLike = null
function gfn_renderPaging(params){
	var divId = params.divId; // 페이징이 그려질 div id
	gfv_pageIndex = params.pageIndex; // 현재 위치가 저장될 input 태그
	var totalCount = params.totalCount; // 전체 조회 건수
	var currentIndex = $("#"+params.pageIndex).val(); // 현재 위치
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount; // 페이지당 레코드 수
	if(gfn_isNull(recordCount) == true){
		//recordCount = 20;
		recordCount = 15;
	}
	var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
	gfv_eventName = params.eventName;
	gfn_searchLike = params.searchLike;
	
	$("#"+divId).empty();
	
	var preStr = "";
	var postStr = "";
	var str = "";
	var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
	//var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	var last = (parseInt(totalIndexCount/10) < parseInt(currentIndex)/10) ? totalIndexCount%10 : 10;
	var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1;
	var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	
	preStr += "<ul class='pagination' style='text-align: center; white-space: nowrap;'>";
	if(totalIndexCount > 10){ // 전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
		preStr += "<li><a href='#this' class='button primary small' onclick='_movePage(1)'>First</a></li>" +
			"<li><a href='#this' class='button small' onclick='_movePage("+prev+")'>Prev</a></li>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ // 전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
		preStr += "<li><a href='#this' class='button primary small' onclick='_movePage(1)'>First</a></li>";
	}
	
	if(totalIndexCount > 10){ // 전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
		postStr += "<li><a href='#this' class='button small' onclick='_movePage("+next+")'>Next</a></li>" +
			"<li><a href='#this' class='button primary small' onclick='_movePage("+totalIndexCount+")'>End</a></li>";
	}
	else if(totalIndexCount <=10 && totalIndexCount > 1){ // 전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
		postStr += "<li><a href='#this' class='button primary small' onclick='_movePage("+totalIndexCount+")'>End</a></li>";
	}
	
	for(var i = first; i < (first+last); i ++){
		if(i != currentIndex){
			str += "<li><a href='#this' class='page' onclick='_movePage("+i+")'>"+i+"</a></li>";
		}
		else{
			str += "<li><a href='#this' class='page active' onclick='_movePage("+i+")'>"+i+"</a></li>";
		}
	}
	postStr += "</ul>";
	
	$("#"+divId).append(preStr + str + postStr);
}

function _movePage(value){
	$("#"+gfv_pageIndex).val(value);
	
	if(!gfn_isNull(gfn_searchLike)){
		if(typeof(gfv_eventName) == "function"){
			gfv_eventName(value, gfn_searchLike);
		}
		else {
			eval(gfv_eventName + "(value, gfn_searchLike);");
		}
	}else{
		if(typeof(gfv_eventName) == "function"){
			gfv_eventName(value);
		}
		else {
			eval(gfv_eventName + "(value);");
		}
	}
}

/**
 * fadeIn 효과를 이용한 알림 스크립트
 */
// Default settings
var gfv_noticePopupTimer = setTimeout(function(){}, 1);
var gfv_noticePopupDefaultOption =
{
		id: 'default',
		message: '기본 메시지 입니다.',
		padding: '20px 40px',
		fade: 500,
		duration: 1500,
		beforeShow: function(){},
};
function gfn_alertPopup(options)
{
	// Set Options
	var settings = $.extend({}, gfv_noticePopupDefaultOption, options);
	$("div.noticePopup").attr("id", settings.id);
	
	var element = "div#"+settings.id+".noticePopup";
	// Set Style
	$(element).css("padding", settings.padding);
	// Set Message
	$(element+">div.noticeMessage").html(settings.message);
	
	// Set Position
	var width = $(element).outerWidth();
	var height = $(element).outerHeight();
	$(element).css("margin-left", String(-width/2)+"px");
	$(element).css("margin-top", String(-height/2)+"px");
	
	// Clear Animation
	$(element).stop();
	clearTimeout(gfv_noticePopupTimer);
	$(element).css("display", "none");
	
	// Start Animation
	$(element).fadeIn(settings.fade, function()
	{
		gfv_noticePopupTimer = setTimeout(function()
		{
			$(element).fadeOut(settings.fade);
		}, settings.duration);
	});
}

var gfv_modalDefaultOption =
{
		modal : 'myModal',
		btn : 'myBtn',
		close : 'close'
};
function ComModal(options) {
	// Set Options
	var settings = $.extend({}, gfv_modalDefaultOption, options);
	
	// Get the modal
	var modal = document.getElementById(settings.modal);
	
	// Get the button that opens the modal
	var btn = document.getElementById(settings.btn);
	
	// Get the <span> element that closes the modal
	//var span = document.getElementsByClassName("close")[0];
	var span = null;
	if(gfn_isNull(options)){
		span = document.getElementsByClassName("close")[0];
	}else{
		span = document.getElementById(settings.close);
	}
	
	// When the user clicks the button, open the modal 
	/*
	btn.onclick = function() {
		modal.style.display = "block";
	}
	*/
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	
	this.block = function block() {
		modal.style.display = "block";
	};
}

// 3자리 단위마다 콤마 생성
function gfn_addCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 전화번호 정규식
function gfn_addMinus(x) {
	return x.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
}

// 모든 콤마 제거
function gfn_removeCommas(x) {
	if(!x || x.length == 0) return "";
	else return x.split(",").join("");
}

function gfn_readyAlert(){
	gfn_alertPopup({message:"해당 기능은 준비중입니다."});
	return false;
}