//
//  ContenuDetail.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct ProposDetail: View {
    var contenu : Propos
    
    init(contenu : Contenu) {
        self.contenu = contenu as! Propos
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("Propos")
                Text(contenu.description)
                Spacer()
                NavigationLink(destination : LireCommentaires(contenu: self.contenu)) {
                   Text("Commentaires")
                }
                NavigationLink(destination : LireReponses(contenu: self.contenu)) {
                   Text("Reponses")
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
