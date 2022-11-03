const container = document.body.querySelector(".lecture_container");
const search = document.body.querySelector("#keyword");
let sbjCode = $("input[name='subject']:checked").val();
getData();

function getData(){
	let keyword = "자바의 정석";
	if(search.value!="null" && search.value!=""){
		keyword = search.value; 
	}
    $('.lecture_container').empty();
    $.ajax({
        method : "GET",
        url : "https://dapi.kakao.com/v2/search/vclip",
        data : {
            query : keyword,
            page : 1,
            size : 20
        },
        headers : {
            Authorization : "KakaoAK 6a4c077fca80e32384fcf93a071c6788"
        }
    }).done(function(response){
        const list = response.documents;
        list.forEach(e => {
            const title = e.title;
            const url = e.url;
            const datetime = e.datetime.substring(0,10);
            const thumbnail = e.thumbnail;
            const author = e.author;
			const code = url.split('=')[1];
			const playTime = calPlayTime(e.play_time);
            
            if(url.split('.')[1]==='youtube'){
                $('.lecture_container').append(
					`<article class="content">
						<form class="sendLecture" method="post" action="loadLecture">
							<input type="hidden" name="sbjCode" value="${sbjCode}" />
							<p class="title" name="title">${title}</p>
							<input class="code" name="code" type="hidden" value="${code}">
							<img class="thumbnail" name="thumbnail" src="${thumbnail}">
							<p class="author">${author}</p>
							<p class="author">${playTime}</p>
							<p class="datetime" name="datetime">${datetime}</p>
							<input class="view" type="submit" value="영상보기">
						</form>
					</article>`
				);
            }
        });
    })
}

function getSbjCode(_event){
	sbjCode = _event.target.value;
	console.log(sbjCode);
	getData();
}	

function calPlayTime(time){
	let result = "";
	let s = time%60;
	let m = (time/60)%60;
	let h = time/(60*60);
	if(h>0)
		result = h + ":" + m + ":" + ":" + s;
	else if(m>0)
		result = m + ":" + ":" + s;
	else
		result = "0:" + s;
	return result;
}
