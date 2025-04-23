//
//  User.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/22/25.
//

import Foundation

struct Chat: Hashable {
    var userID: String
    var chatbotID: String
    var messages: [Message]
}
