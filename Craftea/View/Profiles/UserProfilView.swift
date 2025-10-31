//
//  UserProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI
struct UserProfilView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Button(action: {
                        showingAlert = true
                    })
                    { ProfilSignalButton()}
                        .padding(.leading,300)
                        .padding(.top, 50)
                    Image(systemName:"person.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                    HStack{
                        Text("\(otherUser[1].name)").mainTitle()
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("5")
                        }
                    }
                    .padding(.top)
                    
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                }
                VStack(alignment: .leading) {
                    Text("Ses Loisirs").mainTitle()
                        .padding(15)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(otherUser[1].favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)}
                                .padding(.trailing ,20)}
                        .padding(20)
                    }
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("Ses Articles de Troc").mainTitle()
                        .padding(15)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(otherUser[1].favoritesHobby ) { hobby in VerticalHobbyView(hobby: hobby)                        }
                                .padding(.trailing ,20)
                        }
                        .padding(20)
                        
                    }
                    Spacer()
                }
                
                
            }
            .background(Color("Background"))
            .ignoresSafeArea()
        }
    }
}
#Preview {
    UserProfilView()
}
