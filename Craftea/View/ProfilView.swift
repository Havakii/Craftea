//
//  ProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct ProfilView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Button(action: {
                showingAlert = true
                    })
                    { ProfilSignalButton()}
                    .alert("Important message", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .padding(.leading,(250))
                    Image(systemName:"person.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                    Text("\(otherUser[0].name)").mainTitle()}
                .padding(.top,60)
                
                VStack(alignment: .leading) {
                    Text("Ses Loisirs").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(otherUser[0].favoritesHobby as! [Hobby]) { hobby in VerticalHobbyView(hobby: hobby)}
                                .padding(.trailing ,20)}
                        .padding(20)
                    }
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("Ses Articles de Troc").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(otherUser[0].favoritesHobby as! [Hobby]) { hobby in VerticalHobbyView(hobby: hobby)                        }
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
    ProfilView()
}
