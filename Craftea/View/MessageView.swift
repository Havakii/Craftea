//
//  MessageView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

public struct MessageView: View {
    //    @State private var selectedTab = "Message"
    public var body: some View {
        
        var conversations: [Conversation] = mockConversations
        NavigationStack {
            
            ZStack {
                
                Color.background.ignoresSafeArea()
                LinearGradient(gradient:Gradient(colors: [.clear, .primaryPurpule.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottom).ignoresSafeArea()
                
                ScrollView {
                    //                    VStack {
                    //                                SegmentedToggle(selection: $selectedTab, options: ["Message", "Notification"])
                    //
                    //                            }
                    //                            .padding()
                    
                    VStack(spacing: 15) {
                        ForEach(conversations) { conversation in
                            NavigationLink(destination: MessageDetailView(conversation: conversation)) {
                                MessageCardView(conversation: conversation)
                            }
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    MessageView()
}
