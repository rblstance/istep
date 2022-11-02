const container = document.body.querySelector(".lecture_container");
const subject = document.body.querySelector(".subject");
getDate();

function getDate(){
    $('.lecture_container').empty();
    $.ajax({
        method : "GET",
        url : "https://dapi.kakao.com/v2/search/vclip",
        data : {
            query : subject.value,
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
            
            if(url.split('.')[1]==='youtube'){
                const content = document.createElement("article");
                content.setAttribute('class','content');

                const formtag = document.createElement("form");
                formtag.setAttribute('method', "post");
                formtag.setAttribute('action', "lectureView.jsp");

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
                formtag.append(sendBtn);

                content.append(formtag);

                
                container.append(content);
            }
        });
    })
}