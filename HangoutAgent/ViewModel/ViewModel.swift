//
//  ViewModel.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/22/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var users: [User]
    @Published var chatbots: [Chatbot]
    @Published var chats: [Chat]
    
    init() {
        self.users = DemoData.users
        self.chatbots = DemoData.chatbots
        self.chats = DemoData.chats
    }
    
    func verifyUser(username: String, password: String) -> User? {
        for user in self.users {
            if user.username == username && user.password == password {
                return user
            }
        }
        return nil
    }
    
    func retrieveChat(username: String, chatbotID: String) -> Chat? {
        for chat in self.chats {
            if chat.userID == username && chat.chatbotID == chatbotID {
                return chat
            }
        }
        return nil
    }
}
