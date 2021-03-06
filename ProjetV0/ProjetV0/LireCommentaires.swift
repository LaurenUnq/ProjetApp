//
//  ContenuCommentaires.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct LireCommentaires: View {
    
    let session : Utilisateur
    let listeBD : UtilisateurListe

    var contenu : Propos
    
    @State var commentaire : String = ""
    
    //Pour retour page quand appuie sur bouton
    @Environment(\.presentationMode) var presentationMode
    
    
    init(contenu : Propos, utilisateur : Utilisateur, liste : UtilisateurListe) {
        self.contenu = contenu
        self.session = utilisateur
        self.listeBD = liste
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
                        if (self.session.getActive() == true){
                            Button(action : {
                                c.flike(utilisateur : self.session)
                            }) {
                                Text("Like")
                            }
                            Button(action : {
                                c.fdislike(utilisateur : self.session)
                            }) {
                                Text("Dislike")
                            }
                        }

                    }
                        
                }
                Text("Ajout d'un commentaire :")
                Form {
                    TextField("Commentaire : ", text: $commentaire)
                    
                }
                //NE PAS UTILISER CA MAIS FAIRE UNE SORTE DE DISMISS
                NavigationLink(destination : Accueil(session: self.session, listeBD: self.listeBD)) {
                    Button(action: {
                        self.contenu.commentaires.append(
                            Commentaire(contenu: self.commentaire, auteur: self.session, liste: self.listeBD))
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
