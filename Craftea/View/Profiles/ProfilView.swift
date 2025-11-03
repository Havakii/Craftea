//
//  ProfilView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//
import SwiftUI

struct ProfilView: View {
    @Environment(Session.self) private var session
    //@Environment(User.self) private var user
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationLink(destination: SettingsView(), label: {
                        ProfilSettingButton()
                    })
                    .padding(.leading,300)
                    .padding(.top, 50)
                    Image(systemName:"person.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                    HStack{
                        Text("\(session.currentUser.name)").mainTitle()
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
                    Text("Mes Loisirs").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(session.currentUser.favoritesHobby) { hobby in VerticalHobbyView(hobby: hobby)}
                            .padding(.trailing ,20)}
                        .padding(20)
                    }
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("Mes Favoris").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(session.currentUser.favoriteEquipment) { materiel in MaterielCard(materiel: materiel)}
                                .padding(.trailing ,20)
                        }
                        .padding(20)
                        
                    }
                    Spacer()
                }
                
    VStack(alignment: .leading) {
                    Text("Mes Articles de Troc").mainTitle()
                        .padding(5)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(session.currentUser.favoriteEquipment) { materiel in MaterielCard(materiel: materiel)}
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
        .environment(Session(currentUser: users[0]))
        .environment(HobbyViewModel())
}
