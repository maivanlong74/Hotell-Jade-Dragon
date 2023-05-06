window.addEventListener('load', function () {
    var keotruot = document.getElementsByClassName('keotruot')[0];
    keotruot.scrollIntoView({ behavior: 'smooth' });
});

$('#XemMap').click(function () {
    var body = document.getElementById("htkhachsan");
    var mapElement = document.getElementById("map");

    body.classList.remove("keotruot");
    mapElement.classList.add("keotruot");
    var keotruot = document.querySelector('.keotruot');
    if (keotruot) {
        keotruot.scrollIntoView({ behavior: 'smooth' });
    }
});

$('#XemKS').click(function () {
    var body = document.getElementById("htkhachsan");
    var mapElement = document.getElementById("map");

    mapElement.classList.remove("keotruot");
    body.classList.add("keotruot");
    var keotruot = document.querySelector('.keotruot');
    if (keotruot) {
        keotruot.scrollIntoView({ behavior: 'smooth' });
    }
});