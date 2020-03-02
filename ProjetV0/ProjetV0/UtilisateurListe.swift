//
//  UtilisateurListe.swift
//  ProjetV0
//
//  Created by user164566 on 3/1/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation
import SwiftUI

class UtilisateurListe {
    
    init() {
        self.utilisateurs = []
        //importer les données depuis BD
        //fausses données TEST
        utilisateurs.append(Utilisateur(pseudo: "lau", email: "yahoo", password: "lau", isAdmin: true, ville: "montpellier"))
    }
    
    
    var utilisateurs : [Utilisateur]
    
    public func estUtilisateur (pseudo : String, password : String) -> Bool {
        var res : Bool = false
        for u in self.utilisateurs {
            if (u.getPseudo() == pseudo && u.getPassword() == password){
                res = true
            }
        }
        return res
    }
    
    //on sait que l'utilisateur est dans la base Mais on traite lerreur : sinon on renvoie lutilisateur anonyme
    public func getUtilisateur(pseudo : String, password : String) -> Utilisateur {
        var res : Utilisateur = Utilisateur (pseudo: "Anonyme", email: "Anonyme", password: "", isAdmin: false, ville: "Anonyme")
        for u in self.utilisateurs {
            if (u.getPseudo() == pseudo && u.getPassword() == password){
                res = u
            }
        }
        return res
    }
    
    public func insert(utilisateur : Utilisateur){
        self.utilisateurs.append(utilisateur)
    }
    
}
