const account = require('./account/lib.js');

module.exports = function (app) {
	
	/*C'est ici que l'ensemble des routes et des fonctions associ�es seront plac�es pour l'api /user*/
    app.post('/login',account.login);
    app.post('/signup',account.signup);
}