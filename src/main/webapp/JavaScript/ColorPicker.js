var random_color;
var colors = ['#ff0000', '#00ff00', '#0000ff'];
random_color = colors[Math.floor(Math.random() * colors.length)];
$('').css('background-color', random_color);