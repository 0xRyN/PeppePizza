

function addEventListeners() {

    const navBar = document.querySelector(".navbar-nav");
    const navToggle = document.querySelector(".nav-toggle");

    navToggle.addEventListener("click", () => {
        const vis = navBar.getAttribute("data-visible");

       if (vis === "false") {
            navBar.setAttribute("data-visible", true);
            navToggle.setAttribute("aria-expanded", true);
        } else {
           navBar.setAttribute("data-visible", false); 
           navToggle.setAttribute("aria-expanded", false);
        }
    });
}

$(document).ready(function () {
    loadMain();
    addEventListeners();
});
