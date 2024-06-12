function registerEndpoints(app) {
    app.get("/cart", (req, res) => {
        let cart_raw = req.cookies.cart;
        let cart = JSON.parse(cart_raw);
        res.render("cart", { cart: cart });
    });
}

exports.registerEndpoints = registerEndpoints;
