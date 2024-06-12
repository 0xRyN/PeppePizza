let curHighlightedId = 0;

let nbItems = 0;

function loadHighlights(index = 0) {
    // Maybe choose a highlight randomly from pizzas
    let highlightedId = index;
    let image = $("#highlight-image");
    let title = $("#highlight-title");
    let ingredients = $("#highlight-ingredients");
    let description = $("#highlight-description");
    let prix = $("#highlight-price");

    // First, we get the highlighted pizza name, image and description
    $.get(`/api/v1/pizzas/${highlightedId}`, function (pizza) {
        // Then, we get the pizza's ingredients
        $.get(`/api/v1/pizzas/${highlightedId}/ingredients`, function (ingr) {
            // Then, we get the pizza's prices
            $.get(`/api/v1/prices`, function (prices) {
                let price = prices.find((price) => price.product_id === pizza.product_id);
            // Then, we update the page
            image.attr("src", pizza.image);
            title.text(pizza.name);
            let ingredientsToString = ingr
                .map((ingredient) => ingredient.name)
                .join(", ");
            ingredients.text("Ingredients : " + ingredientsToString);
            description.text(pizza.description);
            prix.text(`M : ${price.m}€ / L : ${price.l}€ / XL : ${price.xl}€`);
            });
        });
    });
}

function loadCards() {
    let cards = $("#cards");
    $.get("/api/v1/pizzas", function (pizzas) {
        for (let pizza of pizzas) {
            $.get("/api/v1/prices", function (prices) {
                let price = prices.find((price) => price.product_id === pizza.product_id);
                cards.append(`
                <div class="card">
                    <img
                        class="card-img-top"
                        src="${pizza.image}"
                        alt="Card image cap"
                    />
                    <div class="card-body">
                        <h5 class="card-title text-black text-bold">${pizza.name}</h5>
                        <p class="card-text text-white">
                            Description : ${pizza.description}
                            
                        </p>
                        <p class="card-text text-white">À partir de : ${price.m} €</p>
                        <button class="btn btn-primary cart card-btn"
                        data-toggle="modal" 
                        data-target="#addToCart${pizza.id}"
                        id="${pizza.id}">
                        Ajouter au panier
                        </button>
                    </div>
                </div>
                `);
            });
        }
    });
}

//add to cart
function addToCart(id) {
    let highlightedId = curHighlightedId;
    let image = $("#highlight-image");
    let title = $("#highlight-title");
    let ingredients = $("#highlight-ingredients");
    let description = $("#highlight-description");
    // Stringify product_id, size and quantity, store it into cookie "cart"
    let itemNumber = "pizza" + nbItems;
    let pizza = {};
    pizza.pizzaID = id;
    pizza.quantity = $("#quantity").val();
    pizza.size = $("#size").val();
    localStorage.setItem(itemNumber, JSON.stringify(pizza));
    console.log(itemNumber);
    console.log(JSON.stringify(pizza));
    //console.log(pizza);
}

function loadButtons() {
    let buttons = $("#highlight-btn");
    let highlightedId = curHighlightedId;
    buttons.append(` 
        <button class="btn bi-arrow-left-circle text-light" id="highlight-btn-prev"> Précédent</button>
        <button class="btn bi-arrow-right-circle text-light" id="highlight-btn-next"> Suivant</button>
        <button class="btn text-light" data-target="#add-${highlightedId}" data-toggle="modal">Ajouter au panier</button>
    `);
}

function loadMainPizzas() {
    let main = $("#main");
}

function addEventListeners() {
    $("#highlight-btn-prev").click(function () {
        curHighlightedId--;
        if (curHighlightedId < 0) {
            curHighlightedId = $("#cards").children().length - 1;
        }
        loadHighlights(curHighlightedId);
    });
    $("#highlight-btn-next").click(function () {
        curHighlightedId++;
        if (curHighlightedId >= $("#cards").children().length) {
            curHighlightedId = 0;
        }
        loadHighlights(curHighlightedId);
    });

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

    let targetName;

    const title = $("#modal-title");
    const desc = $("#modal-txt");
    const mimage = $("#modal-img");

    //get id attribute on hover
    $(document).on("mouseenter", ".card-btn", function () {
        targetName = $(this).attr("id");
        const mod = document.querySelector(".modal");

        mod.setAttribute("id", "addToCart" + targetName);
        $.get(`/api/v1/pizzas/${targetName}`, function (pizzas) {
            title.text(pizzas.name);
            desc.text(pizzas.description);
            mimage.attr("src", pizzas.image);
        });
    });

    $(`#add-${curHighlightedId}`).click(function () {
        const mod = document.querySelector(".modal");

        mod.setAttribute("id", "addToCart" + curHighlightedId);
        $.get(`/api/v1/pizzas/${curHighlightedId}`, function (pizzas) {
            title.text(pizzas.name);
            desc.text(pizzas.description);
            mimage.attr("src", pizzas.image);
        });
    });

    //add to cart
    $("#add-item").click(function () {
        let itemNumber = "pizza" + nbItems;
        let pizza = {};
        pizza.pizzaID = targetName;
        pizza.quantity = $("#quantity").val();
        pizza.size = $("#size").val();
        localStorage.setItem(itemNumber, JSON.stringify(pizza));
        console.log(itemNumber);
        console.log(JSON.stringify(pizza));
        //console.log(pizza);
        //console.log(localStorage.getItem(itemNumber));
        nbItems++;
    });
}

function generateCart(pizzaID) {}

$(document).ready(function () {
    loadHighlights();
    loadCards();
    loadButtons();
    addEventListeners();
});
