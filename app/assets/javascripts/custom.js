$(document).ready(function(){
    $("#SignIn").on('click', function(event) {
        var btn = $('#SignIn').button('loading');
        setTimeout(function () {
            btn.button('reset');
        }, 10000);
    })
});

$(document).ready(function(){
    $("#SignUp").on('click', function(event) {
        var btn = $('#SignUp').button('loading');
        setTimeout(function () {
            btn.button('reset');
        }, 10000);
    })
});