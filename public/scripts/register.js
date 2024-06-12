function checkPassword() {
    let password = $("#password");
    let password_confirmation = $("#password_confirmation");
    password_confirmation.on("keyup", function () {
        if (password.val() != password_confirmation.val()) {
            password_confirmation.css("border", "1px solid red");
        } else {
            password_confirmation.css("border", "none");
        }
    });
}

function checkValidity() {
    if ($("#password").value != $("#password_confirmation").value) return false;
    return true;
}

function addSubmit() {
    let form = $("#form");
    form.on("submit", function (e) {
        if (!checkValidity()) {
            e.preventDefault();
            return false;
        }
    });
}

function registerEventListeners() {
    // TODO: Add other checks
    checkPassword();
    addSubmit();
}

$(document).ready(function () {
    registerEventListeners();
});
