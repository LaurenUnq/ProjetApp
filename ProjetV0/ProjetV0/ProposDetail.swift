//
//  ContenuDetail.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct ProposDetail: View {
    
    let session : Utilisateur
    let listeBD : UtilisateurListe

    var contenu : Propos
    
    init(contenu : Contenu, utilisateur : Utilisateur, liste : UtilisateurListe) {
        self.contenu = contenu as! Propos
        self.session = utilisateur
        self.listeBD = liste
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("Propos")
                Text(contenu.description)
                Spacer()
                NavigationLink(destination : LireCommentaires(contenu: self.contenu, utilisateur: self.session, liste: self.listeBD)) {
                   Text("Commentaires")
                }
                NavigationLink(destination : LireReponses(contenu: self.contenu, utilisateur: self.session, liste : self.listeBD)) {
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
