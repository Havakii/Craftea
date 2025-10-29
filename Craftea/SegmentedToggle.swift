//
//  SegmentedToggle.swift
//  Craftea
//
//  Created by Apprenant 80 on 28/10/2025.
//

import SwiftUI

struct SegmentedToggle: View {
    @Binding var selection: String
    let options = ["Occasion", "Neuf"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selection = option
                }) {
                    Text(option)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            selection == option ? Color.white : Color.primaryPurpule.opacity(0.2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .padding(4)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .padding(.horizontal)
    }
}
