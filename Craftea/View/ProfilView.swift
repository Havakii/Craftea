//
//  ProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct ProfilView: View {
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    Image(systemName:"person.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                    Text("\(otherUser[0].name)").mainTitle()
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ses Loisirs").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                    ForEach(otherUser[0].favoritesHobby as! [Hobby]) { hobby in VerticalHobbyView(hobby: hobby)                        }
                        }
                    }
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 20) {
                    Text("Ses Articles de Troc").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                    ForEach(otherUser[0].favoritesHobby as! [Hobby]) { hobby in VerticalHobbyView(hobby: hobby)                        }
                        }
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
