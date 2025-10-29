//
//  LoisirDetailView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

struct LoisirDetailView: View {
    var hobby: Hobby
    @State var viewModel = HobbyViewModel()

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.background.ignoresSafeArea()
            
            VStack{
                AsyncImage(url: URL(string: hobby.image)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 250)
                                            .clipShape(UnevenRoundedRectangle(
                                                topLeadingRadius: 0,
                                                bottomLeadingRadius: 32,
                                                bottomTrailingRadius: 32,
                                                topTrailingRadius: 0
                                            ))
                                    } placeholder: {
                                        ProgressView().padding(.vertical, 100)
                                    }
                    
                HStack{
                    VStack(alignment: .leading){
                        Text(hobby.name.rawValue)
                            .mainTitle()
                            .foregroundColor(.textPrimary)
                        Text(hobby.description)
                            .secondaryText()
                            .foregroundColor(.textSecondary)
                    }
                    Spacer()
                    HStack{
                        switch hobby.level{
                        case .easy : Circle().fill(Color.green).frame(width: 8)
                        case .medium:
                            Circle().fill(Color.orange).frame(width: 8)
                        case .hard:
                            Circle().fill(Color.red).frame(width: 8)
                        }
                        Text(hobby.level.rawValue).tertiaryTitle().foregroundColor(.textPrimary)
                    }.padding(.leading, 8).padding(.vertical, 4).padding(.trailing, 12)
                        .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.03))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 4)
                                .blur(radius: 4)
                                .offset(x: 2, y: 2)
                                .mask(RoundedRectangle(cornerRadius: 8).fill(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.25), .gray.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondaryOrange.opacity(0.03), lineWidth: 8)
                                .blur(radius: 4)
                                .offset(x: -2, y: -2)
                                .mask(RoundedRectangle(cornerRadius: 8).fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                        ))
                }.padding(.horizontal, 24)
                    .padding(.bottom)
                
                DisclosureGroup {
                    ForEach(hobby.equipementNeeded){ item in
                        HStack {
                            Image(item.image)
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .mainTextBold()
                                    .foregroundColor(.textPrimary)
                                Text(item.description)
                                    .secondaryText()
                                    .foregroundColor(.textSecondary)
                            }
                            Spacer()
                        }.padding(8)
                            .background(Color.almostWhite)
                    }
                } label: {
                    Text("Materiel de base")
                        .secondaryTitle()
                        .foregroundColor(.textPrimary)
                }.padding(.horizontal, 24)
            }.ignoresSafeArea(edges: .top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Favorite", systemImage: "heart") {
                        
                    }.tint(Color.primaryPurpule)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadDetailImages(for: hobby)
            }
        }
        
    }
}

#Preview {
    let viewModel = HobbyViewModel()
    LoisirDetailView(hobby: viewModel.hobbies[0])
}
