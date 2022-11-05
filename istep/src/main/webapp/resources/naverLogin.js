getData();
function getData(){
	const Id = "f_9l7U2Ws6U7DuoYxc5s";
	const secret = "vvD17C3mZh";
	const token = window.location.hash.split("&")[0].split("=")[1];
	let apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
	apiUrl += "client_id=" + Id;
	apiUrl += "&client_secret=" + secret;
	apiUrl += "&access_token=" + token;
	apiUrl += "&state=f3ba75e2-3891-4bb4-9c9e-ca773d3d3fe6&service_provider=NAVER";
    apiUrl
    $.ajax({
        method : "GET",
        url : "https://nid.naver.com/oauth2.0/authorize"
    }).done((resopnse) => {
 	})
}