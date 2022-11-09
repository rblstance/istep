function makeChannel() {

	var host_id = document.getElementById('host_id').value;
	var users = [host_id];
	 $("input[name=users]").each(function(){    
	    var value = $(this).val();
		users.push(value);
	  });
	var name = document.getElementById('name').value;
	var custom_type = $('input[name=custom_type]:checked').val();
	var data = document.getElementById('data').value;
	var access_code = document.getElementById('access_code').value;
	
	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/group_channels",
		"method": "POST",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Content-Type": "application/json",
			"Accept": "application/json"
		},
		"data": JSON.stringify({
			"user_ids": users,
			"operator_ids": [host_id],
			"name": name,
			"custom_type": custom_type,
			"data": data,
			"is_distinct": "",
			"is_public": "true",
			"access_code": access_code
		}),
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}