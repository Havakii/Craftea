//
//  NotificationCardView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 29/10/2025.
//

import SwiftUI

public struct NotificationCardView: View {
    let notification: NotificationModel

       public init(notification: NotificationModel) {
           self.notification = notification
       }
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.almostWhite)
                .shadow(color:.gray.opacity(0.2), radius:4, x:0, y:2)
                .frame(width: 370, height: 100)
            HStack {
                Image(notification.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .overlay(
                        Rectangle().stroke(Color.gray, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 2)
                    .padding(.leading)
                VStack(alignment: .leading) {
                    HStack {
                        Text(notification.message)
                            .font(.title3)
                            .fontWeight(Font.Weight.light)
                      
                        Spacer()
                        
                    }
                    
                    Text(notification.timeAgo)
                        .font(Font.headline)
                        .fontWeight(Font.Weight.light)
                        .foregroundStyle(.textSecondary)
                }.padding(8)
                
                
                
            }.padding(7)
                .frame(width: 380)
            
            
        }
        }
    }


#Preview {
    NotificationCardView(notification: mockNotifications[0])
}
