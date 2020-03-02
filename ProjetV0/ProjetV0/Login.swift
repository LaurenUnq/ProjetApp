//
//  Login.swift
//  ProjetV0
//
//  Created by user164566 on 2/28/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct Login: View {
    @Binding var session : Utilisateur
    //let utilisateurs: [Utilisateur] = [Utilisateur(pseudo: "lauren", email: "lauren", password: "lauren", isAdmin: true, ville: "Montpellier")]
    @Binding var listeBD : UtilisateurListe
    
    //Pour faire un retour une fois qu'on a appuyé sur un bouton
    @Environment(\.presentationMode) var presentationMode
    
    @State var pseudo : String = ""
    @State var password : String = ""
    
    /*
    init(liste : UtilisateurListe, session : Utilisateur){
        self.listeBD = liste
        self.session = session
    }
    */
    var body: some View {
        NavigationView {
            VStack {
                Text ("Connexion")
                Spacer()
                Form {
                    TextField("Pseudo : ", text: $pseudo)
                    TextField("Password : ", text : $password)
                    
                }
                NavigationLink(destination : Accueil(session : self.session, listeBD: self.listeBD)) {
                    Button(action: {
                        /* A MODIFIER */
                        if (self.listeBD.estUtilisateur(pseudo : self.pseudo, password : self.password)) {
                            self.session = self.listeBD.getUtilisateur (pseudo : self.pseudo, password : self.password)
                            self.session.log()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        /*  */
                        else {
                            Text("Ce n est pas le bon identifiant ! Le bon login est \"\" et le bon mdp est \"\" ")
                        }
                        
                    }) {
                    Text("Se connecter")
                    }
                }
                NavigationLink(destination : Inscription(session : self.$session, listeBD : self.$listeBD)){
                    Text("S'inscrire")
                    
                }
            }
        }
    }
}

/*
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
*/
