function registerEndpoints(app, pool) {
    // Called when a user clicks place order on their cart page
    app.post("/checkout", (req, res) => {
        const user = parseInt(req.cookies.user);
        const cart = req.body.cart;

        // Print all cart items
        for (let i = 0; i < cart.length; i++) {
            console.log(cart[i]);
            //pool.query("INSERT INTO orders (user_id, pizza_id, quantity) VALUES ($1, $2, $3)", [user, cart[i].id, cart[i].quantity]);
        }
    });
}

exports.registerEndpoints = registerEndpoints;
