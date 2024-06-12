let curHighlightedId = 0;

let nbItems = 0;


//add to cart
function addToCart(id) {
    $.post("/api/v1/panier", function (pizza) {

    });
}

function loadMainPizzas(){
    let main = $("#main");

}

function loadMain() {
    let cards = $("#cards");
    cards.append(`
    <div class="card">
        <img class="card-img-top" src="/assets/pizza/Americaine.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Nos pizzas</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="/pizzas" class="btn btn-primary pizzas">Voir nos recettes</a>
        </div>
    </div>
    <div class="card">
        <img class="card-img-top" src="/assets/pizza/Miel.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Composez !</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Composez votre pizza </a>
        </div>
    </div>
    <div class="card  text-light">
        <img class="card-img-top menu-top" src="/assets/menus/menu.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Menus</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Voir nos menus</a>
        </div>
    </div>
    `);
}

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
