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
		$("#commonForm")[0].reset();
		//$("#"+this.formId).empty();
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
				+ ", scrollbars = no, location = no, toolbar = no, menubar = no, status = no");
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

function gfn_readyAlert() {
	alert("해당 기능은 준비중입니다.");
	return false;
}