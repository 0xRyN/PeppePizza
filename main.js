const express = require("express");
const app = express();
const path = require("path");
const { Pool, Client } = require("pg");
const api = require("./backend/api");
const auth = require("./backend/auth");
const cookieParser = require("cookie-parser");
const checkout = require("./backend/checkout");
const cart = require("./backend/cart");

app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cookieParser());
app.set("view engine", "ejs");

// Database connection

const pool = new Pool({
    user: "pepe",
    host: "localhost",
    database: "pepepizza",
    password: "pepe",
    port: 5432,
});

/*
    ROUTES
    /
    /produits
    /livraison
    /panier
*/

// Register API endpoints (/api/v1)

api.registerEndpoints(app, pool);

// Register authentication endpoints (/auth)

auth.registerEndpoints(app, pool);

// Register checkout endpoints (/checkout)

checkout.registerEndpoints(app, pool);

// Register cart endpoints (/cart)

cart.registerEndpoints(app, pool);

app.use(auth.checkLogin);

app.get("/", (req, res) => {
    res.render("index");
});

app.get("/produits", (req, res) => {
    res.send("Liste des produits");
});

app.get("/pizzas", (req, res) => {
    res.render("pizzas");
});

app.get("/menus", (req, res) => {
    res.render("menus");
});

app.get("compose", (req, res) => {
    res.render("compose");
});

app.get("/livraison", (req, res) => {
    res.send("Livraison");
});

app.get("/login", (req, res) => {
    res.render("login");
});

app.get("/register", (req, res) => {
    res.render("register");
});

app.listen(3000, () => {
    console.log("Serveur lancé sur le port 3000");
});
