$(document).ready(function(){
    var path = window.location.pathname;
    var start_point = path.lastIndexOf("/")+1;
    var current_state = path.substring(start_point, path.length-3);

    $("#"+current_state).css({"color": "white", "background-color": "#006633"})
    $("#current_nav_menu").text($("li#"+current_state+" > span").text());
});