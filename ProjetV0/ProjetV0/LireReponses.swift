//
//  ContenuReponses.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct LireReponses: View {
    
    let session : Utilisateur
    let listeBD : UtilisateurListe

    var contenu : Propos
    //Pour faire un retour une fois qu'on a appuyé sur un bouton
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var contenuR : String = ""
    @State var categorieR : String = ""

    init(contenu : Propos, utilisateur : Utilisateur, liste : UtilisateurListe) {
        self.session = utilisateur
        self.contenu = contenu
        self.listeBD = liste
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("Propos")
                Text(contenu.description)
                Spacer()
                Text("Espace réponses :")
                List {
                    ForEach(contenu.reponses) {
                        r in
                        Text(r.description)
                    }
                        
                }
                Text("Ajout d'une reponse :")
                Form {
                    TextField("Reponse : ", text: $contenuR)
                    TextField("Categorie : ", text : $categorieR)
                    
                }
                NavigationLink(destination : Accueil(session: self.session, listeBD: self.listeBD)) {
                    Button(action: {
                        self.contenu.reponses.append(
                            Reponse(contenu : self.contenuR, categorie : self.categorieR)
                        )
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                    Text("Ajouter la reponse")
                    }
                }
            }
        }
        
    }
}

/*

struct ContenuReponses_Previews: PreviewProvider {
    static var previews: some View {
        ContenuReponses()
    }
}
*/
