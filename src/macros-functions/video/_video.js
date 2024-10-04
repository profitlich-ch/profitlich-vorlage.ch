const videos = document.querySelectorAll('.macro-video');

let player = [];
videos.forEach(function (video, i) {
    // vimeo player for each video
    player[i] = new Vimeo.Player(video, {
        id: video.dataset.vimeoId
    });

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            // check whether video is visible in viewport
            if (entry.intersectionRatio > 0) {
                player[i].play();
            } else {
                player[i].pause();
            }
        });
    });

    // 'video' gets observed
    observer.observe(video);
});