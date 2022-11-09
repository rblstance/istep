const container = document.body.querySelector(".lecture_container");
const search = document.body.querySelector("#keyword");
let option = document.getElementsByTagName('selSbj');
let code = document.getElementById('codeArg');
let loadCode = document.getElementById('loadCode');
let sbjCode = $("input[name='subject']:checked").val();
let is_end = false;
let page = 1;
let firstLoad = false;

getData();

checkKind();

function checkKind(){
	let radio = $("input[type=radio]");
	radio[0].checked = true;
	console.log(loadCode.value);
	for(let i=0;i<radio.length;i++){
		if(radio[i].id===loadCode.value){
			radio[i].checked = true;
		}
	}
	
}


$(window).scroll(function() {
	let scrollTop = $(window).scrollTop();
    let innerHeight = $(window).innerHeight();
    let scrollHeight = $('body').prop('scrollHeight');
	
    if (scrollTop + innerHeight >= scrollHeight-5) {
        page++;
		wait(1);
		getData();
    }
});

function getData(){
	let keyword = "자바의 정석";
	if(search.value!="null" && search.value!=""){
		keyword = search.value; 
	}
    $.ajax({
        method : "GET",
        url : "https://dapi.kakao.com/v2/search/vclip",
        data : {
            query : keyword,
            page : page,
            size : 5
        },
        headers : {
            Authorization : "KakaoAK 6a4c077fca80e32384fcf93a071c6788"
        }
    }).done(function(response){
		console.log();
        const list = response.documents;
        list.forEach(e => {
            const title = e.title;
            const url = e.url;
            const regDate = e.datetime.substring(0,10);
            const thumbnail = e.thumbnail;
            const author = e.author;
			const code = url.split('=')[1];
			const playTime = e.play_time;
			
            
            if(url.split('.')[1]==='youtube'){
				firstLoad = true;
                $('.lecture_container').append(
					`<article class="content">
						<form class="sendLecture" method="post" action="loadLecture">
							<input type="hidden" name="sbjCode" value="${sbjCode}" readonly/>
							<input type="hidden" name="url" value="${url}" />
							<input type="hidden" name="time" value="${playTime}" />
							<input type="hidden" name="title" value="${title}" readonly>
							<input class="code" name="code" type="hidden" value="${code}" />
							<p class="title">"${title}"</p>
							<input type="image" class="thumbnail"  src="${thumbnail}">
							<input type="hidden" name="thumbnail" value="${thumbnail}"/>
							<input type="text" class="title" name="author" value=${author}"  readonly/>
							<input type="text" class="title" name="playTime" value="${calPlayTime(playTime)}" readonly />
							<input type="text" class="title" name="regDate" value="${regDate}"  readonly/>
						</form>
					</article>`
				);
            }
        });
    });
}

function getSbjCode(_event){
	sbjCode = _event.target.value;
	code.value = _event.target.value;
}	

function calPlayTime(time){
let result = "";
	let s = Math.floor(time%60);
	let m = Math.floor((time/60)%60);
	let h = Math.floor(time/(60*60));
	if(h>0)
		result = h + ":" + m + ":" + s;
	else if(m>0)
		result = m + ":" + s;
	else
		result = "0:" + s;
	return result;	
}

function backPage(){
	 if(page > 1){
        page--;
        getData();
    }
}

function nextPage(){
	if(is_end === false){
        page++;
        getData();
        $('.back_btn').show();
    }
}

function wait(sec) {
    let start = Date.now(), now = start;
    while (now - start < sec * 1000) {
        now = Date.now();
    }
}