//
//  ChatView.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/22/25.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject private var vm: ViewModel
    
    @State var user: User
    @State var chatbot: Chatbot
    @State var chat: Chat? = nil
    
    var body: some View {
        NavigationStack {
            if let chat {
                ForEach(chat.messages, id: \.self) {message in
                    Text(message.text)
                        .frame(maxWidth: .infinity, alignment: message.side == "user" ? .trailing : .leading)
                        .padding(.horizontal)
                }
                .navigationTitle(chatbot.name)
            }
            
            Spacer()
           
                
            
        }
        .onAppear() {
            chat = vm.retrieveChat(username: user.username, chatbotID: chatbot.id)
        }
    }
}

#Preview {
    ChatView(user: DemoData.users[0], chatbot: DemoData.chatbots[0])
        .environmentObject(ViewModel())
}
