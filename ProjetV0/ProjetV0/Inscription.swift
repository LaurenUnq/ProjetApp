//
//  Inscription.swift
//  ProjetV0
//
//  Created by user164566 on 2/28/20.
//  Copyright © 2020 user164566. All rights reserved.
//


import SwiftUI

struct Inscription: View {
    @Binding var session : Utilisateur
    @Binding var listeBD : UtilisateurListe

    //Pour faire un retour une fois qu'on a appuyé sur un bouton
    @Environment(\.presentationMode) var presentationMode
    
    @State var pseudo : String = ""
    @State var password : String = ""
    @State var email : String = ""
    @State var ville : String = ""
    //admin .??
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("Connexion")
                Spacer()
                Form {
                    TextField("Pseudo : ", text: $pseudo)
                    TextField("Password : ", text : $password)
                    TextField("Email : ", text : $email)
                    TextField("Ville : ", text : $ville)
                    
                }
                NavigationLink(destination : Accueil(session: self.session, listeBD: self.listeBD)) {
                    Button(action: {
                        self.session = Utilisateur(pseudo: self.pseudo, email: self.email, password: self.password, isAdmin: true, ville: self.ville)
                        self.session.log()
                        self.listeBD.insert(utilisateur: self.session)
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                    Text("S'inscrire")
                    }
                }
            }
        }
    }
}

/*
struct Inscription_Previews: PreviewProvider {
    static var previews: some View {
        Inscription()
    }
}
*/
