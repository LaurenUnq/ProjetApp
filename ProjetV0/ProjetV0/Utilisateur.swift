//
//  Utilisateur.swift
//  ProjetV0
//
//  Created by user164566 on 2/28/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation
import SwiftUI

class Utilisateur : Identifiable, ObservableObject {
    
    init(pseudo: String, email: String, password: String, isAdmin: Bool, ville : String) {
        self.pseudo = pseudo
        self.email = email
        self.password = password
        self.isAdmin = isAdmin
        self.isActive = false
        self.ville = ville
    }
    
    @Published var pseudo : String
    @Published var email : String
    @Published var password : String
    @Published var ville : String
    @Published var isAdmin : Bool
    @Published var isActive : Bool
    
    /*
    static var utilisateurs : [Utilisateur] { get { return self.utilisateurs} set{ self.utilisateurs = newValue} }
    
   */
    
    public func log () {
        isActive = true;
    }
    
    public func logout () {
        isActive = false
    }
    
    public func setPseudo (new : String) {
        self.pseudo = new;
    }
    
    public func setEmail (new : String) {
        self.email = new;
    }
    
    public func setAdmin (new : Bool) {
        self.isAdmin = new;
    }
    
    public func setVille (new : String) {
        self.ville = new;
    }
    
    public func getVille () -> String {
        return self.ville;
    }
    
    public func getPassword () -> String {
        return self.password;
    }
    
    public func getPseudo () -> String {
        return self.pseudo;
    }
    
    public func getEmail () -> String {
        return self.email;
    }
    
    public func getActive () -> Bool {
        return self.isActive;
    }
    
}
