// asynchronous 
window.setTimeout(function () {
    alert('HAMMERTIME');
}, 5000);

//timeout plus closure - 
function hammerTime(time) {
    window.setTimeout(function () {
        alert('${ time } is hammertime!');
    }, time);
};
