//
//  AjoutContenu.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct AjoutPropos: View {
    
    @Binding var session : Utilisateur
    @Binding var listeBD : UtilisateurListe
    
    @Binding var globalPropos : [Propos]
    @State var contenu : String = ""
    @State var categorie : String = ""
    @State var jaime : Int = 0
    @State var jaimePas : Int = 0
    
    /*
    init(utilisateur : Utilisateur, liste : UtilisateurListe, propos : Binding<[Propos]>){
        self.session = utilisateur
        self.listeBD = liste
        //self.$globalPropos = propos
    }
    */
    
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
                NavigationLink(destination : Accueil(session: self.session, listeBD : self.listeBD)) {
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
