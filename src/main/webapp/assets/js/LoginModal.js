$(document).ready(function(){


    $('#myButton').click(function(e) {
        $('#loginModal').modal('show');
        e.preventDefault();
        console.log("test");
    });


    $('#loginModal').modal();

});