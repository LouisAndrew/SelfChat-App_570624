//
//  ChatPartner.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import Foundation

struct ChatPartner: Codable, Hashable {
 var name: String
}

struct ChatPartners: Codable {
 var partners: [ChatPartner]
}
