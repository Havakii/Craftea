//
//  ProfilSignalButton.swift
//  Craftea
//
//  Created by Andréa  on 29/10/2025.
//

import SwiftUI

struct ProfilSignalButton: View {
    var body: some View {
        Image(systemName: "flag.fill")
                .font(.system(size: 30))
                .foregroundColor(Color("primaryPurpule"))
                .padding(15)
                .background(Circle()
                    .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3))
    }
}

#Preview {
    ProfilSignalButton()
}
