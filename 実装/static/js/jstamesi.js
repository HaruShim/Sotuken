// (function($){
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

var csrftoken = getCookie('csrftoken');

function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

$.ajaxSetup({
    beforeSend: function (xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});

$('#ajax-number').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
        'url': '{% url "jstamesi:ajax_number" %}',
        'type': 'POST',
        'data': {
            'number1': $('#number1').val(),
            'number2': $('#number2').val(),
        },
        'dataType': 'json'
    })
    .done(function(response){
        $('.result').prepend('<p>引き算結果：' + response.minus + '</p>');
        $('.result').prepend('<p>足し算結果：' + response.plus + '</p>');
    });
});
// }(jQuery));