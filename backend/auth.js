function registerEndpoints(app, pool) {
    app.post("/login", (req, res) => {
        const { email, password } = req.body;
        pool.query(
            "SELECT * FROM users WHERE email = $1 AND password = $2",
            [email, password],
            (err, result) => {
                if (err) {
                    console.log(err);
                } else {
                    if (result.rows.length > 0) {
                        res.cookie("user", result.rows[0].id);
                        res.render("login", {
                            user: result.rows[0],
                            error: null,
                        });
                    } else {
                        res.render("login", {
                            user: null,
                            error: "Email ou mot de passe incorrect",
                        });
                    }
                }
            }
        );
    });

    app.post("/register", (req, res) => {
        const {
            email,
            password,
            password_confirmation,
            address,
            phone,
            postal_code,
        } = req.body;
        if (password !== password_confirmation) {
            res.send("Les mots de passe ne correspondent pas");
        } else {
            pool.query(
                "INSERT INTO users (email, password, address, phone, postal_code) VALUES ($1, $2, $3, $4, $5)",
                [email, password, address, phone, postal_code],
                (err, result) => {
                    if (err) {
                        console.log(err);
                    } else {
                        if (result.rows.length > 0) {

                            res.cookie("user", result.rows[0].id);
                            res.redirect("/login");

                        } else {
                            console.log(result);
                            res.send("Erreur lors de l'inscription");
                        }
                    }
                }
            );
        }
    });
}

function checkLogin(req, res, next) {
    if (req.cookies.user || req.url === "/login" || req.url === "/register") {
        next();
    } else {
        next();
        //res.render("login");
    }
}

exports.registerEndpoints = registerEndpoints;
exports.checkLogin = checkLogin;
