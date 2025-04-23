//
//  User.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/22/25.
//

import Foundation

struct User: Hashable {
    var username: String
    var password: String
    var subscriptions: [String]
}
