//
//  ContenuDetail.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct ContenuDetail: View {
    var contenu : Contenu
    
    init(contenu : Contenu) {
        self.contenu = contenu
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text ("Propos")
                    Text(contenu.description)
                    Spacer()
                    NavigationLink(destination : ContenuCommentaires(contenu: self.contenu)) {
                       Text("Commentaires")
                    }
                    NavigationLink(destination : ContenuReponses(contenu: self.contenu)) {
                       Text("Reponses")
                    }
                }
            }
        }
        
    }
}

/*
struct ContenuDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContenuDetail()
    }
}
*/
