//
//  MessageView.swift
//  Craftea
//
//  Created by Hava Bakrieva on 27/10/2025.
//

import SwiftUI

public struct MessageView: View {
    public var body: some View {
        var conversations: [Conversation] = mockConversations
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
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
