//
//  AjoutContenu.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct AjoutPropos: View {
    @Binding var globalPropos : [Contenu]
    @State var contenu : String = ""
    @State var categorie : String = ""
    @State var jaime : Int = 0
    @State var jaimePas : Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ajout d'un contenu")
                Form {
                    TextField("Contenu : ", text: $contenu)
                    TextField("Categorie : ", text: $categorie)
                    
                }
                //Attention Bien faire le retour ou effacer les champs
                NavigationLink(destination : Accueil()) {
                    Button(action: {
                        self.globalPropos.append(
                            Propos(contenu: self.contenu, categorie: self.categorie))
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                    Text("Ajouter")
                    }
                }

            }
        }
    }
}

/*
struct AjoutContenu_Previews: PreviewProvider {
    static var previews: some View {
        AjoutContenu()
    }
}
*/
