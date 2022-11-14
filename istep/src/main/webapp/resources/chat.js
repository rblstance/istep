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
			const data = e.data;
			const channel_url = e.channel_url;
			const custom_type = e.custom_type;
			const member_count = e.member_count;

			$('.container').append(
				`<div class="chat_room">
                    <p class="name"><strong>${name}</strong></p>
                    <p class="data">${data}</span>				
                    <p class="member_count">${member_count}명</p>
                    <p class="custom_type">${custom_type}</p>
					<p><a href="chatView?url=${channel_url}">입장하기</a></p></a>
				</div>`
			);
		});
	});
}

function viewMyChats() {
	var user_id = $('#log').val();

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

			$('.container').append(
				`<div>
                    <span class="name"><strong>${name}</strong></span>
                    <span class="custom_type">${custom_type}</span>
                    <span class="member_count">${member_count}명</span>
					<span><a href="${channel_url}">입장하기</a></span></a>
                </div>`
			);
		});
	});
}


function chatSet() {
	var channel_url = document.getElementById('channel_url');

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/group_channels/" + channel_url,
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
			const user = e.user.nickname;
			const message = e.message;
			const created_at = new Date(e.created_at*1000);

			$('.container').append(
				`<div>
                    <span class="user"><strong>${user}</strong></span>
                    <span class="message">${message}</span>
                    <span class="created_at">${created_at}</span>
					<span><a href="${channel_url}">입장하기</a></span></a>
                </div>`
			);
		});
	});
}