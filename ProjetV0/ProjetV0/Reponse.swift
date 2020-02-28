//
//  Reponse.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation

class Reponse : Contenu {
    
    public init(contenu: String, categorie : String) {
        super.init(contenu : contenu)
        self.categorie = categorie
    }
    
    public override init (contenu: String) {
        super.init(contenu : contenu)
        self.categorie = "Autre"
    }
    
    @Published var categorie : String = ""
}
