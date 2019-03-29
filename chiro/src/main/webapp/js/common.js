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

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if (this.formId == "commonForm") {
		$("#commonForm")[0].reset();
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.addParam = function addParam(key, value) {
		$("#" + this.formId).append(
				$("<input type='hidden' name='" + key + "' id='" + key + "' value='" + value + "' >")
		);
	};
	
	this.submit = function submit() {
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
	
	this.openPopup = function openPopup() {
		var frm = $("#" + this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.target = "commonForm";
		window.open('', "commonForm", "width=700, height=500");
		frm.submit();
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