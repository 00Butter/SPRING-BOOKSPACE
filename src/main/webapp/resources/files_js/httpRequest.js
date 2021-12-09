/**
 * 
 */

	var httpRequest = null;
		
	function getXMLHttpRequest() {
		if(window.ActiveXObject) {
			try {
				return new ActiveXObject("Msxml12.XMLHTTP");
			} catch(e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e1) {
					return null;
				}
			}			
		} else if(window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	}

	
	function sendRequest(url, params, callback, method) {
		
		httpRequest = getXMLHttpRequest();
		
		if(method != null) {
			method = method.toUpperCase();
		}
		var httpMethod = method ? method : "GET"; // null이면 Get
		if(httpMethod != "GET" && httpMethod != "POST") {
			httpMethod = "GET";
		}
		
		var httpParams = 
			(params == null || params == "") ? null : params;
		
		var httpUrl = url;
		if(httpMethod == "GET" && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		
		httpRequest.onreadystatechange = callback;
		
		httpRequest.open(httpMethod, httpUrl, true);
		
		httpRequest.setRequestHeader(
			"Content-Type", "application/x-www-form-urlencoded"
		);
		
		httpRequest.send(httpMethod == "POST" ? httpParams : null);
	}
	













