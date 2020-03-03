//
//  Propos.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation

class Propos : Contenu {
 
    public init(contenu: String, categorie : String, auteur : Utilisateur, liste : UtilisateurListe) {
        super.init(contenu : contenu, auteur: auteur, liste : liste)
        self.categorie = categorie
    }
    
    public override init (contenu: String, auteur : Utilisateur, liste : UtilisateurListe) {
        super.init(contenu : contenu, auteur: auteur, liste : liste)
        self.categorie = "Autre"
    }
    
    @Published var categorie : String = ""
    var reponses : [Contenu] = [Reponse]()
    var commentaires : [Contenu] = [Commentaire]()
}

