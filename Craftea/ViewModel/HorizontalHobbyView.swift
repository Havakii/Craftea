//
//  HorizontalHobbyView.swift
//  Craftea
//
//  Created by apprenant75 on 27/10/2025.
//

import SwiftUI

struct HorizontalHobbyView: View {
    var body: some View {
        NavigationLink(destination:LoisirDetailView()){
            ZStack{
                Color.almostWhite
                HStack(alignment:.top){
                    VStack(alignment:.leading, spacing: 4){
                        Text("catégorie")
                            .textCase(.uppercase)
                            .categoryText().foregroundColor(.secondaryOrange)
                        Text("Titre")
                            .mainTextBold().foregroundColor(.textPrimary)
                        //TODO : add the level
                        Text("description")
                            .secondaryText().foregroundColor(.textSecondary)
                    }
                    Spacer()
                    Image(systemName: "xmark")
                        .frame(width: 147, height: 128)
                        .border(Color.secondary, width: 4)
                        .cornerRadius(8)
                }.padding(8)
            }.frame(height: 144)
                .cornerRadius(16)
                .shadow(color:.gray.opacity(0.2), radius:4, x:0, y:2)
        }
    }
}

#Preview {
    HorizontalHobbyView()
}
