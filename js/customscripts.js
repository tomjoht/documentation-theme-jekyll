$('.sub_menu').hide();
$('.clickable').toggle(function (){
    $(this).next('ul').slideToggle();
    $(this).css('background-position', '0px -12px');
}, function (){
        $(this).next('ul').slideToggle();
        $(this).css('background-position', '0px 5px');
});

$('ul.sub_menu').has('a.active').css('display', 'block');

$('#myButton').tooltip();

// this does the highlighting for the active tab of the sidebar

$(function () {
    setNavigation();
});

function setNavigation() {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");
    path = decodeURIComponent(path);

    $(".nav a").each(function () {
        var href = $(this).attr('href');
        if (path.substring(0, href.length) === href) {
            $(this).closest('li').addClass('active');
             $(this).closest('li').parents().addClass('active');

        }

            $("ul.pagination a").each(function () {
        var href = $(this).attr('href');
        if (path.substring(0, href.length) === href) {
            $(this).closest('li').addClass('active');
             $(this).closest('li').parents().addClass('active');

        }


    })
        }

)}

$('#mysidebar').height($(".nav").height());

// only use the affix class if the viewport is greater than 500px. otherwise it gets cut off. 

$( document ).ready(function() {
    var h = $(window).height();
    console.log (h);
    if (h > 600) {
   $( "#mysidebar" ).attr("class", "nav affix");
   }
});



$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });
});