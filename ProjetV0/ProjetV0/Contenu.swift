//
//  Contenu.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation

class Contenu : Identifiable, ObservableObject {
    
    public init (contenu: String, auteur : Utilisateur, liste : UtilisateurListe) {
        self.contenu = contenu
        self.like = 0
        self.dislike = 0
        self.auteur = auteur.getPseudo()
        self.ville = auteur.getVille()
        self.listeU = liste
        self.utilisateurLike = []
        for i in 0...(liste.size() - 1){
            self.utilisateurLike.append(false)
        }
        self.utilisateurDislike = []
        for i in 0...(liste.size() - 1){
            self.utilisateurDislike.append(false)
        }
        
    }
    
    var description: String { return " \(self.contenu) / pertinent : \(self.like) impertinent : \(self.dislike)"}
    @Published var contenu : String
    @Published var like : Int
    @Published var dislike : Int
    @Published var auteur : String
    @Published var ville : String
    var listeU : UtilisateurListe
    var utilisateurLike : [Bool]
    var utilisateurDislike : [Bool]
    
    var id = UUID()

    /*
     Si l'utilisateur n'est pas dans la liste des utilisateurs de cette classe, on l'ajoute (on sait qu'il existe)
     Si l'utilisateur n'a pas déjà liké :
        -si l'utilisateur avait dislike le contenu, on enleve son dislike
        -on ajoute un like
        - on sauvegarde l'infrmation comme quoi il a bien like
     */
    public func flike(utilisateur : Utilisateur) {
        if (self.listeU.estUtilisateur(pseudo: utilisateur.getPseudo(), password: utilisateur.getPassword()) != true) {
            self.listeU.insert(utilisateur: utilisateur)
            self.utilisateurLike.append(false)
            self.utilisateurDislike.append(false)
        }
        if (self.utilisateurLike[self.listeU.getIndex(utilisateur: utilisateur)] == false){
            if (self.utilisateurDislike[self.listeU.getIndex(utilisateur: utilisateur)] == true){
                self.utilisateurDislike[self.listeU.getIndex(utilisateur: utilisateur)] = false
                self.dislike -= 1
            }
            self.like += 1
            self.utilisateurLike[self.listeU.getIndex(utilisateur: utilisateur)] = true
        }
    }
    
    /*
    Si l'utilisateur n'est pas dans la liste des utilisateurs de cette classe, on l'ajoute (on sait qu'il existe)
    Si l'utilisateur n'a pas déjà disliké :
       -si l'utilisateur avait like le contenu, on enleve son like
       -on ajoute un dislike
       - on sauvegarde l'infrmation comme quoi il a bien dislike
    */
    public func fdislike(utilisateur : Utilisateur) {
        if (self.listeU.estUtilisateur(pseudo: utilisateur.getPseudo(), password: utilisateur.getPassword()) != true) {
            self.listeU.insert(utilisateur: utilisateur)
            self.utilisateurLike.append(false)
            self.utilisateurDislike.append(false)
        }
        if (self.utilisateurDislike[self.listeU.getIndex(utilisateur: utilisateur)] == false){
            if (self.utilisateurLike[self.listeU.getIndex(utilisateur: utilisateur)] == true){
                self.utilisateurLike[self.listeU.getIndex(utilisateur: utilisateur)] = false
                self.like -= 1
            }
            self.dislike = self.dislike + 1
            self.utilisateurDislike[self.listeU.getIndex(utilisateur: utilisateur)] = true
        }
    }
    
    
    
}
