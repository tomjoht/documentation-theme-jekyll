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

// needed for nav tabs
// script from http://stackoverflow.com/questions/10523433/how-do-i-keep-the-current-tab-active-with-twitter-bootstrap-after-a-page-reload
$(function() {
    var json, tabsState;
    $('a[data-toggle="pill"], a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
        var href, json, parentId, tabsState;

        tabsState = localStorage.getItem("tabs-state");
        json = JSON.parse(tabsState || "{}");
        parentId = $(e.target).parents("ul.nav.nav-pills, ul.nav.nav-tabs").attr("id");
        href = $(e.target).attr('href');
        json[parentId] = href;

        return localStorage.setItem("tabs-state", JSON.stringify(json));
    });

    tabsState = localStorage.getItem("tabs-state");
    json = JSON.parse(tabsState || "{}");

    $.each(json, function(containerId, href) {
        return $("#" + containerId + " a[href=" + href + "]").tab('show');
    });

    $("ul.nav.nav-pills, ul.nav.nav-tabs").each(function() {
        var $this = $(this);
        if (!json[$this.attr("id")]) {
            return $this.find("a[data-toggle=tab]:first, a[data-toggle=pill]:first").tab("show");
        }
    });
});