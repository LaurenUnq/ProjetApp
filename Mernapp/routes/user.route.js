let mongoose = require('mongoose'),
  express = require('express'),
  router = express.Router();

const keys = require('../config/keys');
// Express middleware pour validator
const {check, validationResult} = require('express-validator');

// Protocole de hashage de mot de passe
const bcrypt = require('bcrypt')

// Permet de gérer l'authentification grâce à des tokens
const jwt = require('jsonwebtoken')

// Permet de vérifier si un utilisateur est connecté et si son token est valide
const login = require('../middleware/login')

// User Model
let User = require('../models/User');

//Propos Model
let Propos = require('../models/Propos');

// Route qui vérifie si un utilisateur est login via son token. Si oui, renvoie ses infos (sans le mdp) sinon ne renvoie rien
router.get('/', login, async (req, res) => {
    try {
        const user = await User.findById(req.user.id).select("-password")
        res.json(user)
    } catch (error) {
        console.error(error.message)
        res.status(500).send('Erreur du serveur')
    }
})

// Retourne tous les propos d'un utilisateur (qu'il a créé)
router.get('/:userId/propos', (req, res, next) => {
    const user = req.params.userId
    if (user.length != 24)
        return res.status(400).json({msg:'ID invalide'})
    Propos.find((error, data) => {
      if (error)
          return next(error)
      else
          res.json(data)
    }).where('creator').equals(user).populate('likesPropos').populate('likesCommentaires').populate('likesReponses')
  })

// Route pour l'inscription
router.post('/register',
    // Conditions pour que la requête soit validée
    [
        check('email', 'Entrez un email valide').isEmail(),
        check('pseudo', 'Entrez un pseudo').not().isEmpty(),
        check('password', 'Entrez un mot de passe d\'au moins 6 caractères').isLength({min: 6})
    ],    
    async (req, res) => {
        const errors = validationResult(req)
        // Si la requête n'est pas valide, on affiche les erreurs
        if(!errors.isEmpty()) {
            return res.status(400).json({ error: errors.array() })
        }
        // Sinon on récupère les paramètres dans le body
        const { email, pseudo, password } = req.body
        try {
            // On check si l'utilisateur n'est pas déjà enregistré dans la base de données
            let user = await User.findOne({ email })
            if (user)
                return res.status(400).json({msg:'Cet utilisateur existe déjà'})
            // Création de l'utilisateur
            user = new User({
                email,
                pseudo,
                password
            })
            // Cryptage du mot de passe pour la sauvegarde dans la base de données
            const salt = await bcrypt.genSalt(10)
            user.password = await bcrypt.hash(password, salt)
            // Sauvegarde de l'utilisateur dans la base de données
            await user.save()
            // Création du payload avec l'id de l'utilisateur précédemment créé pour le token
            const payload = {
                user: {
                    id: user.id
                }
            }
            // Création du token et envoi en réponse à la sauvegarde de l'utilisateur dans la base de données
            jwt.sign(payload, keys.secretOrKey, {
                expiresIn:3600
            }, (err, token) => {
                if (err) throw error
                res.send({ token })
            })
        } catch (error) {
            console.error(error.message)
            res.status(500).send("Erreur du serveur")
            
        }
    })

// Route pour l'authentification 
router.post('/login',
// Conditions pour que la requête soit validée
[
    check('email', 'Entrez un email valide').isEmail(),
    check('password', 'Entrez un mot de passe d\'au moins 6 caractères').isLength({min: 6})
],    
async (req, res) => {
    const errors = validationResult(req)
    // Si la requête n'est pas valide, on affiche les erreurs
    if(!errors.isEmpty()) {
        return res.status(400).json({ error: errors.array() })
    }
    // Sinon on récupère les paramètres dans le body
    const { email, password } = req.body
    try {
        // On check si l'utilisateur n'est pas déjà enregistré dans la base de données
        let user = await User.findOne({ email })
        if (!user)
            return res.status(400).json({msg:'Email ou mot de passe incorrect'})
        // Compare le mot de passe stocké dans la base de données et celui donné pour l'authentification
        const match = await bcrypt.compare(password, user.password)
        if (!match)
            return res.status(400).json({msg:'Email ou mot de passe incorrect'})
        // Création du payload avec l'id de l'utilisateur logged in pour le token
        const payload = {
            user: {
                id: user.id
            }
        }
        // Création du token et envoi en réponse à la sauvegarde de l'utilisateur dans la base de données
        jwt.sign(payload, keys.secretOrKey, {
            expiresIn:3600
        }, (err, token) => {
            if (err) throw error
            res.send({ token })
        })
    } catch (error) {
        console.error(error.message)
        res.status(500).send("Erreur du serveur")
        
    }
})

module.exports = router;