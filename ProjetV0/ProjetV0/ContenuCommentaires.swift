//
//  ContenuCommentaires.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct ContenuCommentaires: View {
    var contenu : Contenu
    
    @State var commentaire : String = ""
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
                    Text("Espace commentaire :")
                    List {
                        ForEach(contenu.commentaires) {
                            c in
                            Text(c.description)
                        }
                            
                    }
                    Text("Ajout d'un commentaire :")
                    Form {
                        TextField("Commentaire : ", text: $commentaire)
                        
                    }
                    NavigationLink(destination : Accueil()) {
                        Button(action: {
                            self.contenu.commentaires.append(
                                Commentaire(contenu: self.commentaire))
                            
                        }) {
                        Text("Ajouter le commentaire")
                        }
                    }
                }
            }
        }
        
    }
}
/*
struct ContenuCommentaires_Previews: PreviewProvider {
    static var previews: some View {
        ContenuCommentaires()
    }
}
*/
