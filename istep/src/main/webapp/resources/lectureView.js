const video = document.body.querySelector(".video");
const tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function getVideoId() {

    var param = location.search.substr(location.search.indexOf("?") + 1);
    param = param.split("&"); 
    const temp = param[0].split("=");

    return temp[1];
}

let player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
    height: '360',
    width: '640',
    videoId: getVideoId(),
    });
}

function onPlayerReady(event) {
    event.target.playVideo();
}
var done = false;
function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(stopVideo, 6000);
    done = true;
    }
}
function stopVideo() {
    player.stopVideo();
}
