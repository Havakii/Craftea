//
//  CrafteaApp.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

@main
struct CrafteaApp: App {
    @State var userSession = users[0]
    @State var viewModel = HobbyViewModel()
    @State var welcome = welcomeSentence()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(userSession).environment(viewModel).environment(welcome)
        }
    }
}
