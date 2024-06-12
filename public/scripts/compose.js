let totalprice = 0;
let count = countChecked();

function createingredientcheckbox() {
    const ingredientField = document.querySelector("#ingredients");
    $.get("/api/v1/ingredients", function (data) {
        data.forEach(function (ingredient) {
            if (ingredient.price > 0) {
                ingredientField.append(`
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="${ingredient.id}" id="${ingredient.name}">
                        <label class="form-check-label" for="${ingredient.name}">
                            ${ingredient.name} (${ingredient.price}€)
                        </label>
                    </div>
                `);
            }
        });
    });
}

function addEventListeners() {

    //add ingredient price to total price when checkbox is checked
    const ingredientField = document.querySelector("#ingredients");
    ingredientField.addEventListener("change", function (event) {
        const ingredientId = event.target.value;
        $.get("/api/v1/ingredients/" + ingredientId, function (data) {
            totalprice += data.price;
            document.querySelector("#totalprice").innerHTML = totalprice;
        });
    });

    //remove ingredient price from total price when checkbox is unchecked
    ingredientField.addEventListener("change", function (event) {
        const ingredientId = event.target.value;
        $.get("/api/v1/ingredients/" + ingredientId, function (data) {
            totalprice -= data.price;
            document.querySelector("#totalprice").innerHTML = totalprice;
        });
    });

    //if count > 6, disable all the other checkboxes
    ingredientField.addEventListener("change", function (event) {
        count = countChecked();
        if (count === 6) {
            ingredientField.querySelectorAll("input").forEach(function (input) {
                input.disabled = true;
            });
        } else {
            ingredientField.querySelectorAll("input").forEach(function (input) {
                input.disabled = false;
            });
        }
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
}

//require at least three ingredients
function requireThreeIngredients() {
    const ingredientField = document.querySelector("#ingredients");
    const ingredientCheckboxes = ingredientField.querySelectorAll("input");
    let count = 0;
    ingredientCheckboxes.forEach(function (input) {
        if (input.checked) {
            count++;
        }
    });
    if (count < 3) {
        alert("Please select at least three ingredients");
        return false;
    } else {
        return true;
    }
}

//get radio input type id
function getRadioId() {
    const radioField = document.querySelector("#radio");
    const radioInputs = radioField.querySelectorAll("input");
    let id = "";
    radioInputs.forEach(function (input) {
        if (input.checked) {
            id = input.id;
        }
    });
    return id;
}

//increments count by 1 when checkbox is checked, decrements count by 1 when checkbox is unchecked
function countChecked() {
    const ingredientField = document.querySelector("#ingredients");
    let count = 0;
    ingredientField.addEventListener("change", function (event) {
        if (event.target.checked) {
            count += 1;
        } else {
            count -= 1;
        }
    });
    return count;
}

$(document).ready(function () {
    addEventListeners();
});