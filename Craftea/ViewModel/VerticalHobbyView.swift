//
//  VarticalHobbyView.swift
//  Craftea
//
//  Created by apprenant75 on 28/10/2025.
//

import SwiftUI

struct VerticalHobbyView: View {
    var hobby: Hobby
    
    var body: some View {
        NavigationLink(destination:LoisirDetailView()){
            ZStack{
                Color.almostWhite
                VStack(alignment:.leading){
                    
                    ZStack(alignment:.topLeading){
                        Image(hobby.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 147, height: 128)
                            .border(Color.secondary, width: 1) //remove when we have actual images
                            .cornerRadius(8)
                        Text(hobby.category.rawValue)
                            .textCase(.uppercase)
                            .categoryText().foregroundColor(.secondaryOrange)
                            .padding(.horizontal, 8).padding(.bottom, 4)
                            .background(
                                        UnevenRoundedRectangle(
                                            topLeadingRadius: 0,
                                            bottomLeadingRadius: 8,
                                            bottomTrailingRadius: 8,
                                            topTrailingRadius: 0
                                        )
                                        .fill(Color.almostWhite))
                                .padding(.leading)
                    }

                    VStack(alignment:.leading, spacing: 4){
                        
                        HStack{
                            switch hobby.level{
                            case .easy : Circle().fill(Color.green).frame(width: 8)
                            case .medium:
                                Circle().fill(Color.orange).frame(width: 8)
                            case .hard:
                                Circle().fill(Color.red).frame(width: 8)
                            }
                            Text(hobby.level.rawValue)
                                .tertiaryTitle()
                                .foregroundColor(.textPrimary)
                        }.padding(.leading, 8).padding(.vertical, 4).padding(.trailing, 12)
                            .glassEffect(in: .rect(cornerRadius:8)).padding(.bottom, 4)
                        
                        Text(hobby.name.rawValue)
                            .mainTextBold().foregroundColor(.textPrimary)
                        
                        Text(hobby.description)
                            .secondaryText().foregroundColor(.textSecondary).multilineTextAlignment(.leading)
                    }
                }.padding(8)
                    
                    
            }.frame(width: 164.5, height: 252)
                .cornerRadius(16)
                .shadow(color:.gray.opacity(0.2), radius:4, x:0, y:2)
        }
    }
}

#Preview {
    VerticalHobbyView(hobby: hobbies[0])
}
