//
//  ContenuCommentaires.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct LireCommentaires: View {
    var contenu : Propos
    
    @State var commentaire : String = ""
    
    //Pour retour page quand appuie sur bouton
    @Environment(\.presentationMode) var presentationMode
    
    
    init(contenu : Propos) {
        self.contenu = contenu
    }
    
    var body: some View {
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
                //NE PAS UTILISER CA MAIS FAIRE UNE SORTE DE DISMISS
                NavigationLink(destination : Accueil()) {
                    Button(action: {
                        self.contenu.commentaires.append(
                            Commentaire(contenu: self.commentaire))
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                    Text("Ajouter le commentaire")
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
