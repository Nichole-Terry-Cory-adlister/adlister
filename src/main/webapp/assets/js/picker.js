var fsClient = filestack.init('A0F1pDy2ASHiaDMXRZkITz');

$(document).ready(function(){
        $('#profile-img').click(function(e) {
            openPicker();
        });


function openPicker() {
    fsClient.pick({
        fromSources:["local_file_system","imagesearch","facebook","instagram","dropbox"]
    }).then(function(response) {
        console.log(response.filesUploaded[0].url);
        $.post("/profile/image", {url: response.filesUploaded[0].url}).done(function( ) {
            window.location = "/profile";
        });
    });
}
    });
