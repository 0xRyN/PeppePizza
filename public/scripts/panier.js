/* Set values + misc */
var promoCode;
var promoPrice;
var fadeTime = 300;

/* Assign actions */
$('.quantity input').change(function() {
  updateQuantity(this);
});

$('.remove button').click(function() {
  removeItem(this);
});

/* Recalculate cart */
function recalculateCart(onlyTotal) {
  var subtotal = 0;

  /* Sum up row totals */
  $('.basket-product').each(function() {
    subtotal += parseFloat($(this).children('.subtotal').text());
  });

  /* Calculate totals */
  var total = subtotal;

  /*If switch for update only total, update only total display*/
  if (onlyTotal) {
    /* Update total display */
    $('.total-value').fadeOut(fadeTime, function() {
      $('#basket-total').html(total.toFixed(2));
      $('.total-value').fadeIn(fadeTime);
    });
  } else {
    /* Update summary display. */
    $('.final-value').fadeOut(fadeTime, function() {
      $('#basket-subtotal').html(subtotal.toFixed(2));
      $('#basket-total').html(total.toFixed(2));
      if (total == 0) {
        $('.checkout-cta').fadeOut(fadeTime);
      } else {
        $('.checkout-cta').fadeIn(fadeTime);
      }
      $('.final-value').fadeIn(fadeTime);
    });
  }
}

/* Update quantity */
function updateQuantity(quantityInput) {
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;

  /* Update line price display and recalc cart totals */
  productRow.children('.subtotal').each(function() {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });

  productRow.find('.item-quantity').text(quantity);
  updateSumItems();
}

function updateSumItems() {
  var sumItems = 0;
  $('.quantity input').each(function() {
    sumItems += $(this).val();
  });
  $('.total-items').text(sumItems);
}

/* Remove item from cart */
function removeItem(removeButton) {
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
    updateSumItems();
  });
}

function renderItems() {
    //get size of localstorage
    let size = localStorage.length;
    //console.log(size);
    let baskettotal = 0;

    //iterate through the localstorage
    for (let i = 0; i < size; i++) {
        let key = localStorage.key(i);
        console.log("item : "+i + key);
        let value = localStorage.getItem(key);
        console.log(localStorage.getItem(key));
        if (key.includes("pizza")) {
            let obj = JSON.parse(value);
            let pizza = obj.pizzaID;
            let quantity = obj.quantity;
            let size = obj.size;
            baskettotal += quantity * i;

            $.get(`/api/v1/pizzas/${pizza}`, function (pizzas) {
                $(".basket").append(`
                    <div class="basket-product">
                        <div class="item">
                            <div class="product-image">
                                <img src="${pizzas.image}" alt="${pizzas.name}">
                            </div>
                            <div class="product-details">
                                <h3><strong><span class="item-quantity">${quantity}</span>x ${pizzas.name} 
                                Taille ${size} </strong></h3>
                                <p><strong>${pizzas.description}</strong></p>
                                <p class="basket-product-price">${i}</p>
                            </div>
                        </div>
                        <div class="price">${i}</div>
                        <div class="quantity">
                            <input type="number" value="${quantity}" min="1" max="10" class="quantity-field">
                        </div>
                        <div class="subtotal">${i * quantity}</div>
                        <div class="remove">
                            <button type="button" class="btn btn-outline-danger btn-sm">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>`);
                });
            }
        }
        
    updateSumItems(); 
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

    $('.empty-btn').click(function() {
        localStorage.clear();
        $('.basket-product').remove();
        updateSumItems();
        recalculateCart(true);
    });
}

$(document).ready(function () {
    addEventListeners();
    updateSumItems();
    renderItems();
});