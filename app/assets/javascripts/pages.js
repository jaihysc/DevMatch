document.addEventListener("DOMContentLoaded", function(event) {
    $( document ).on('turbolinks:load', function() {
        //Fade out alert message
        $( '.alert').delay(8000).fadeOut(7800);
    })
});