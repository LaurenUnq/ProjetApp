//
//  Login.swift
//  ProjetV0
//
//  Created by user164566 on 2/28/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State var utilisateur : Utilisateur

    //Pour faire un retour une fois qu'on a appuyé sur un bouton
    @Environment(\.presentationMode) var presentationMode
    
    @State var pseudo : String = ""
    @State var password : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text ("Connexion")
                Spacer()
                Form {
                    TextField("Pseudo : ", text: $pseudo)
                    TextField("Password : ", text : $password)
                    
                }
                NavigationLink(destination : Accueil()) {
                    Button(action: {
                        /* A MODIFIER */
                        if (self.pseudo == "" && self.password == "") {
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
                NavigationLink(destination : Inscription()){
                    Button(action: {
                    }) {
                    Text("S'inscrire")
                    }
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
