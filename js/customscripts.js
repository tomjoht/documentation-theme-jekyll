// Theme scripts for the Documentation theme for Jekyll. Requires jQuery,
// navgoco, Bootstrap 5 (bootstrap.bundle.min.js), and AnchorJS.

$(document).ready(function() {

    // Sidebar accordion. The "active" class marks open folders. Saving the
    // state in a cookie is off because it conflicts with opening the folder
    // that contains the current page.
    $("#mysidebar").navgoco({
        caretHtml: '',
        accordion: true,
        openClass: 'active',
        save: false,
        slide: {
            duration: 300,
            easing: 'swing'
        }
    });

    // The accordion option closes the other folders whenever one opens, so
    // navgoco's own toggle can't expand everything at once. These handlers
    // open and close the folders directly instead.
    $("#collapseAll").click(function(e) {
        e.preventDefault();
        $("#mysidebar li.folder").removeClass("active").children("ul").slideUp(200);
    });

    $("#expandAll").click(function(e) {
        e.preventDefault();
        $("#mysidebar li.folder").addClass("active").children("ul").slideDown(200);
    });

    // The Nav button in the top navigation hides and shows the sidebar on
    // large screens. (On small screens, the sidebar opens as an offcanvas panel.)
    $("#tg-sb-link").click(function(e) {
        e.preventDefault();
        var hidden = $("body").toggleClass("sidebar-hidden").hasClass("sidebar-hidden");
        $("#tg-sb-icon").toggleClass("fa-toggle-on", !hidden).toggleClass("fa-toggle-off", hidden);
        $(this).attr("aria-expanded", hidden ? "false" : "true");
    });

    // Tooltips and popovers. Bootstrap 5 uses data-bs-toggle, but the
    // Bootstrap 3 attributes (data-toggle, data-original-title, data-content)
    // still work so that content written for earlier versions of the theme
    // doesn't break.
    document.querySelectorAll('[data-bs-toggle="tooltip"], [data-toggle="tooltip"]').forEach(function(el) {
        var title = el.getAttribute('data-bs-title') || el.getAttribute('title') || el.getAttribute('data-original-title') || '';
        new bootstrap.Tooltip(el, { title: title, placement: el.getAttribute('data-placement') || 'top', html: true });
    });
    document.querySelectorAll('[data-bs-toggle="popover"], [data-toggle="popover"]').forEach(function(el) {
        var content = el.getAttribute('data-bs-content') || el.getAttribute('data-content') || '';
        new bootstrap.Popover(el, { content: content, placement: el.getAttribute('data-placement') || 'right', trigger: el.getAttribute('data-trigger') || 'hover focus', html: true });
    });

    // Tooltip links often use href="#" as a placeholder. Without this, tapping one
    // on a phone follows the link and jumps to the top of the page.
    $('a[data-bs-toggle="tooltip"][href="#"], a[data-toggle="tooltip"][href="#"]').on('click', function(e) {
        e.preventDefault();
    });

    // AnchorJS adds a link icon next to headings.
    anchors.add('.post-content h2, .post-content h3, .post-content h4, .post-content h5');

});

// Remember the selected tab in nav tabs and pills across page loads.
// See Formatting > Nav tabs for details.
$(function() {
    var tabsState = {};
    try {
        tabsState = JSON.parse(localStorage.getItem("tabs-state") || "{}");
    } catch (e) {
        tabsState = {};
    }

    document.querySelectorAll('[data-bs-toggle="tab"], [data-bs-toggle="pill"]').forEach(function(el) {
        el.addEventListener('shown.bs.tab', function(e) {
            var list = e.target.closest("ul.nav");
            if (!list || !list.id) { return; }
            tabsState[list.id] = e.target.getAttribute('data-bs-target') || e.target.getAttribute('href');
            try {
                localStorage.setItem("tabs-state", JSON.stringify(tabsState));
            } catch (err) {}
        });
    });

    $.each(tabsState, function(listId, target) {
        var link = document.querySelector('#' + listId + ' [data-bs-target="' + target + '"], #' + listId + ' [href="' + target + '"]');
        if (link) {
            bootstrap.Tab.getOrCreateInstance(link).show();
        }
    });
});
