var shiftWindow = function() {
    if (location.hash.length !== 0) {
        window.scrollBy(0, -50);
    }
};
window.addEventListener("hashchange", shiftWindow);

var highlightCurrentSidebarNav = function() {
    var href = location.pathname;
    var item = $('#sidebar-nav [href$="' + href + '"]');
    if (item) {
        var li = item.parent();
        li.addClass("active");

        if (li.parent() && li.parent().is("ul")) {
            do {
                var ul = li.parent();
                if (ul.hasClass("collapse")) {
                    ul.collapse("show");
                }
                li = ul.parent();
            } while (li && li.is("li"));
        }
    }
};

$(document).ready(function() {
    // Scroll to anchor of location hash, adjusted for fixed navbar.
    window.setTimeout(function() {
        shiftWindow();
    }, 1);

    // Flip the caret when submenu toggles are clicked.
    $(".sidebar-submenu").on("show.bs.collapse", function() {
        var toggle = $('[href$="#' + $(this).attr('id') + '"]');
        if (toggle) {
            toggle.addClass("dropup");
        }
    });
    $(".sidebar-submenu").on("hide.bs.collapse", function() {
        var toggle = $('[href$="#' + $(this).attr('id') + '"]');
        if (toggle) {
            toggle.removeClass("dropup");
        }
    });

    // Highlight the current page on the sidebar nav.
    highlightCurrentSidebarNav();
});