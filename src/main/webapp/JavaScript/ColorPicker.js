//Specify the class that you want to select
var x = document.getElementsByClassName("ms-webpart-chrome-title");
var i;
var c;

//specify the colors you want to use
var colors = ["#E95420", "#AEA79F", "#38B44A", "#17a2b8", "#EFB73E", "#772953"];
var d = colors.length;

for (i = 0; i < x.length; i++){
    while (i < d) {
        c = i;
        var random_color = colors[c];
        x[i].style.borderTopColor = random_color;
        i++;
    }
    while (i >= d) {
        var random_color = colors[Math.floor(Math.random() * colors.length)];
        x[i].style.borderTopColor = random_color;
        i++;
    }
}