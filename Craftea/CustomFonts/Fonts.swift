//
//  Fonts.swift
//
//
//  Created by apprenant75 on 27/10/2025.
//

import SwiftUI


extension View {
    func mainTitle() -> some View {
        return self.font(.custom("Manrope-Bold", size: 28))
    }
    func secondaryTitle() -> some View {
        return self.font(.custom("Manrope-Bold", size: 21))
    }
    func tertiaryTitle() -> some View {
        return self.font(.custom("Manrope-Regular", size: 16))
    }
    func mainText() -> some View {
        return self.font(.custom("Inter_24pt-Regular", size: 16))
    }
    func secondaryText() -> some View {
        return self.font(.custom("Inter_24pt-Regular", size: 14))
    }
    func mainTextBold() -> some View {
        return self.font(.custom("Inter_24pt-SemiBold", size: 16))
    }
    func categoryText() -> some View {
        return self.font(.custom("Manrope-ExtraBold", size: 12))
    }
}



