//
//  Message.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import Foundation

struct Message: Codable, Hashable {
    var content: String
    var sender: Bool
}

struct ChatHistory: Codable {
    var chatPartner: String
    var messages: [Message]
}
