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
    
    func getPartners(odd: Bool) -> [ChatPartner] {
        let modValue = odd ? 0 : 1
        return partners.enumerated().filter({ $0.offset % 2 == modValue }).map({ $0.element })
    }
}
