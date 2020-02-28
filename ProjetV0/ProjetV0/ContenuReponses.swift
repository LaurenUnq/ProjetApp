//
//  ContenuReponses.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct ContenuReponses: View {
        var contenu : Propos
        
        @State var contenuR : String = ""
        @State var categorieR : String = ""
    
        init(contenu : Contenu) {
            self.contenu = Propos(contenu : contenu.contenu, categorie : contenu.categorie)
            self.contenu.jaime = contenu.jaime
            self.contenu.jaimePas = contenu.jaimePas
        }
        
        var body: some View {
            VStack {
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
                        NavigationLink(destination : Accueil()) {
                            Button(action: {
                                self.contenu.reponses.append(
                                    Reponse(contenu : self.contenuR, categorie : self.categorieR)
                                )
                                
                            }) {
                            Text("Ajouter la reponse")
                            }
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
