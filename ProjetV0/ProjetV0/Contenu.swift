//
//  Contenu.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import Foundation

class Contenu : Identifiable, ObservableObject {
    
    public init (contenu: String) {
        self.contenu = contenu
        self.like = 0
        self.dislike = 0
    }
    
    var description: String { return " \(self.contenu) / pertinent : \(self.like) impertinent : \(self.dislike)"}
    @Published var contenu : String
    @Published var like : Int
    @Published var dislike : Int
    var id = UUID()
    
    
    
}
