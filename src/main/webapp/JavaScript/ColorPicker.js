var colors = ["#E95420", "#AEA79F", "#38B44A", "#17a2b8", "#EFB73E", "#772953"];
var random_color = colors[Math.floor(Math.random() * colors.length)];
document.getElementsByClassName("box").style.color = random_color;