//
//  ProfilSignalButton.swift
//  Craftea
//
//  Created by Andréa  on 29/10/2025.
//

import SwiftUI

struct ProfilSignalButton: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationStack {
            Text("")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button (action: {showingAlert = true}) {
                            Image(systemName: "flag.fill")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color("primaryPurpule"))
                        }
                        .alert("Souhaitez-vous signaler ce profil ? ", isPresented: $showingAlert) {
                            
                            Button(role: .destructive) {
                            } label: {
                                Text("Signaler")
                            }
                            Button("Bloquer", role: .destructive) {
                            }
                            Button("Fermer", role: .cancel ){
                                
                            }
                        }
                    } 
                }
        }
        
    }
}

#Preview {
    ProfilSignalButton()
}
