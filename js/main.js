function init(data) {
    var x = 0;
    var y = 0;

    for (var i = 0; i < data.length; i++) {
        x = Math.floor(Math.random()*300.0);
        y = Math.floor(Math.random()*300.0);
        $('#main').append('<div class="node circle" style="position: absolute; left: '+ x + 'px; top:' + y + 'px;" title="'+ data[i].tradition + '"><svg width="6" height="6"><circle cx="3" cy="3" r="3" fill="black" /></svg></div>');
    }
}

$(function() {
    $.ajax({
        url: '/nodes.json'
    }).done(init);
});
