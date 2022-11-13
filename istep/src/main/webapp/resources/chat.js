const log = $('#log').val();

function viewAllChats() {
	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/group_channels",
		"method": "GET",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Accept": "application/json"
		},
	};  

	$.ajax(settings).done(function(response) {
		console.log(response);
		const list = response.channels;
		list.forEach(e => {
			const name = e.name;
			const channel_url = e.channel_url;
			const custom_type = e.custom_type;
			const member_count = e.member_count;
			const is_public = e.is_public;

			$('.container').append(
				`<div class="chat_room">
                        <span class="name"><strong>${name}</strong></span>
                        <span class="custom_type">${custom_type}</span>
                        <span class="member_count">${member_count}명</span>
						<span class="is_public">${is_public}</span>							
						<span><a href="chatView?url=${channel_url}">입장하기</a></span></a>
				</div>`
			);
		});
	});
}

viewMyChats(log);

function viewMyChats(log) {
	var user_id = log;
	
	
	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users/" + user_id + "/my_group_channels",
		"method": "GET",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Accept": "application/json"
		},
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
		const list = response.channels;
		list.forEach(e => {
			const name = e.name;
			const channel_url = e.channel_url;
			const custom_type = e.custom_type;
			const member_count = e.member_count;
			const is_public = e.is_public;

			$('.container').append(
				`<article>
                    <div>
                        <span class="name"><strong>${name}</strong></span>
                        <span class="custom_type">${custom_type}</span>
                        <span class="member_count">${member_count}명</span>
                        <span class="is_public">${is_public}</span>
						<span><a href="${channel_url}">입장하기</a></span></a>
                    </div>
                </article>`
			);
		});
	});
}