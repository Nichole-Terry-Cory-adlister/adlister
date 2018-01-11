$(document).ready(function(){


    $('#myButton').click(function(e) {
        $('#loginModal').modal('show');
        e.preventDefault();
        console.log("test");
    });



    $('#profileBtn').click(function(e) {
        $('#profileModal').modal('show');
        e.preventDefault();
        console.log("test");
    });



});


