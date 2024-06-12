/**
 * Endpoints :
 * /api/v1/pizzas : Returns all pizzas
 * /api/v1/pizzas/:id : Returns a pizza with the given id
 * /api/v1/pizzas/:id/ingredients : Returns all ingredients of a pizza with the given id
 * /api/v1/drinks : Returns all drinks and their prices
 * /api/v1/drinks/:id : Returns a drink with the given id and its price
 * /api/v1/shipping : Returns all shipping cities and their costs
 */

/**
 * SQL Templates : Select ingredients for a pizza
    SELECT ingredients.name FROM ingredients INNER JOIN recipes ON
    ingredients.id = recipes.ingredient_id INNER JOIN pizzas ON
    recipes.pizza_id = pizzas.id
    WHERE pizzas.name = 'Bollywood';
 */

function registerEndpoints(app, pool) {
    app.get("/api/v1/pizzas", (req, res) => {
        pool.query("SELECT * FROM pizzas", (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.json(result.rows);
            }
        });
    });

    app.get("/api/v1/pizzas/:id", (req, res) => {
        const id = req.params.id;
        pool.query(
            "SELECT * FROM pizzas WHERE id = $1",
            [id],
            (err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    res.json(result.rows[0]);
                }
            }
        );
    });

    app.get("/api/v1/pizzas/:id/ingredients", (req, res) => {
        const id = req.params.id;
        pool.query(
            "SELECT ingredients.name FROM ingredients INNER JOIN recipes ON ingredients.id = recipes.ingredient_id INNER JOIN pizzas ON recipes.pizza_id = pizzas.id WHERE pizzas.id = $1",
            [id],
            (err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    res.json(result.rows);
                }
            }
        );
    });

    app.get("/api/v1/drinks", (req, res) => {
        pool.query("SELECT * FROM drinks", (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.json(result.rows);
            }
        });
    });

    app.get("/api/v1/drinks/:id", (req, res) => {
        const id = req.params.id;
        pool.query(
            "SELECT * FROM drinks WHERE id = $1",
            [id],
            (err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    res.json(result.rows[0]);
                }
            }
        );
    });

    app.get("/api/v1/shipping", (req, res) => {
        pool.query("SELECT * FROM shipping", (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.json(result.rows);
            }
        });
    });

    //endpoints for the products
    app.get("/api/v1/products", (req, res) => {
        pool.query("SELECT * FROM products", (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.json(result.rows);
            }
        });
    });

    //endpoint for the prices
    app.get("/api/v1/prices", (req, res) => {
        pool.query("SELECT * FROM price", (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.json(result.rows);
            }
        });
    });

    //endpoint from products and prices, to get the price by size of the product that is not null
    app.get("/api/v1/products/:id/prices", (req, res) => {
        const id = req.params.id;
        pool.query(
            "SELECT * FROM price WHERE product_id = $1",
            [id],
            (err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    res.json(result.rows);
                }
            }
        );
    });
    
}

exports.registerEndpoints = registerEndpoints;
