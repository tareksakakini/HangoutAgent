//
//  Users.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/22/25.
//

import Foundation

struct DemoData {
    static var users: [User] = [
        User(username: "tareksakakini", password: "temp123", subscriptions: ["kings_group", "mcgeorge_group"]),
        User(username: "erinannelore", password: "temp123", subscriptions: ["mcgeorge_group"])
    ]
    
    static var chatbots: [Chatbot] = [
        Chatbot(id: "kings_group", name: "Kings Group Agent", subscribers: ["tareksakakini"]),
        Chatbot(id: "mcgeorge_group", name: "McGeorge Group Agent", subscribers: ["tareksakakini", "erinannelore"]),
    ]
    
    static var chats: [Chat] = [
        Chat(userID: "tareksakakini", chatbotID: "kings_group", messages: [
            Message(text: "Hello kings", side: "user"),
            Message(text: "Hello, how are you", side: "bot"),
            Message(text: "I'm doing fine.", side: "user"),
            Message(text: "How about you?", side: "user"),
            Message(text: "I'm doing fine as well. Thanks for asking!", side: "bot")
        ]),
        Chat(userID: "tareksakakini", chatbotID: "mcgeorge_group", messages: [
            Message(text: "Hello mcgeorge", side: "user"),
            Message(text: "Hello, how are you", side: "bot"),
            Message(text: "I'm doing fine.", side: "user"),
            Message(text: "How about you?", side: "user"),
            Message(text: "I'm doing fine as well. Thanks for asking!", side: "bot")
        ]),
        Chat(userID: "erinannelore", chatbotID: "mcgeorge_group", messages: [
            Message(text: "Heyoo mcgeorge", side: "user"),
            Message(text: "Hello, how are you", side: "bot"),
            Message(text: "I'm doing fine.", side: "user"),
            Message(text: "How about you?", side: "user"),
            Message(text: "I'm doing fine as well. Thanks for asking!", side: "bot")
        ])
    ]
    
}
