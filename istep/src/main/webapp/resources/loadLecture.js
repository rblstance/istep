const container = document.body.querySelector(".lecture_container");
const search = document.body.querySelector("#keyword");
getDate();

function getDate(){
	let keyword = "자바의 정석";
	if(search.value!="null" && search.value!=""){
		keyword = search.value; 
	}
    $('.lecture_container').empty();
	console.log(keyword);
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
            
            if(url.split('.')[1]==='youtube'){
				// String 값으로 append 이벤트만 javasript 처리
                /*const content = document.createElement("article");
                content.setAttribute('class','content');

                const formtag = document.createElement("form");
                formtag.setAttribute('class', "sendLecture");
                formtag.setAttribute('method', "post");
                formtag.setAttribute('action', "loadLecture");

                const code = url.split('=')[1];
                const codetag = document.createElement("input");
                codetag.setAttribute('class', 'code');
                codetag.setAttribute('name', 'code');
                codetag.setAttribute('type', 'hidden');
                codetag.setAttribute('value', code);

                const imgtag = document.createElement("img");
                imgtag.setAttribute('class', 'thumbnail');
                imgtag.setAttribute('name', 'thumbnail');
                imgtag.setAttribute('src', thumbnail);
                
                const titletag = document.createElement("p");
                titletag.setAttribute('class', 'title');
                titletag.setAttribute('name', 'title');
                titletag.textContent = title;
                
                const authortag = document.createElement("p");
                authortag.setAttribute('class', 'author');
                authortag.textContent = author;
                
                const datetimetag = document.createElement("p");
                datetimetag.setAttribute('class', 'datetime');
                datetimetag.setAttribute('name', 'datetime');
                datetimetag.textContent = datetime;

                const sendBtn = document.createElement("input");
                sendBtn.setAttribute('class', 'view');
                sendBtn.setAttribute('type', 'submit');
                sendBtn.setAttribute('value', '영상보기');
                
                formtag.append(titletag);
                formtag.append(codetag);
                formtag.append(imgtag);
                formtag.append(authortag);
                formtag.append(datetimetag);
                formtag.append(sendBtn);*/
                

                
                container.append(`
					<article class="content">
						<form class="sendLecture" method="post" action="loadLecture">
							<p class="title" name="title">${title}</p>
							<input class="code" name="code" type="hidden" value="${code}">
							<img class="thumbnail" name="thumbnail" src="${url}">
							<p class="author">${author}</p>
							<p class="datetime" name="datetime">${datetime}</p>
							<input class="view" type="submit" value="영상보기">
						</form>
					</article>
				`);
            }
        });
    })
}