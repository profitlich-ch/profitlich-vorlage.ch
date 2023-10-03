const videos = document.querySelectorAll('.macro-video');

let player = [];
videos.forEach(function (video, i) {
    // Vimeo-Player für jedes Video
    player[i] = new Vimeo.Player(video, {
        id: video.dataset.vimeoId
    });

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            // Überprüfen Sie, ob das Video im Viewport sichtbar ist
            if (entry.intersectionRatio > 0) {
                player[i].play();
            } else {
                player[i].pause();
            }
        });
    });

    // 'video' wird überwacht
    observer.observe(video);
});