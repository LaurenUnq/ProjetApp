//
//  Accueil.swift
//  ProjetV0
//
//  Created by user164566 on 2/16/20.
//  Copyright © 2020 user164566. All rights reserved.
//

import SwiftUI

struct Accueil: View {
    
    @State var session : Utilisateur
    @State var listeBD : UtilisateurListe
    @State var propos : [Propos] = [Propos(contenu: "Voici un propos", categorie: "Rue")]

    var body: some View {
        VStack {
            Text("Lady").font(.largeTitle).foregroundColor(Color.orange).bold()
            NavigationView {
                VStack  {
                    NavigationLink(destination : Login(session: self.$session, listeBD : self.$listeBD)) {
                        HStack {
                            Text("Login")
                        }
                    }
                    NavigationLink(destination : MonCompte(session: self.$session, listeBD : self.$listeBD)) {
                        HStack {
                            Text("Compte")
                        }
                    }
                    Text("Vous êtes connecté en tant que pseudo : " + self.session.getPseudo() )

                    Text("A propos").bold().padding(.top).multilineTextAlignment(.leading)
                    
                    Text("Ce site est destiné à reccueillir les propos sexistes des utilisateurs et à y apporter des exemples de réponses pour aider à contrer ces remarques désobligentes.")
                        .fontWeight(.light)
                        .padding(2.0)
                    List {
                        ForEach (propos) {
                            p in
                            NavigationLink(destination : ProposDetail(contenu : p, utilisateur: self.session, liste : self.listeBD)) {
                                HStack {
                                    Text(p.description)
                                }
                            }
                        }

                    }
                    NavigationLink(destination : AjoutPropos(session : self.$session, listeBD : self.$listeBD, globalPropos : self.$propos)) {
                        Text ("Ajouter un propos")
                    }.navigationBarTitle("Accueil")
                }
            }
        }
    }
}

struct Accueil_Previews: PreviewProvider {
    static var previews: some View {
        Accueil(session: Utilisateur(pseudo: "pseudo", email: "email", password: "pass", isAdmin: true, ville: "Montpellier"), listeBD: UtilisateurListe())
    }
}
