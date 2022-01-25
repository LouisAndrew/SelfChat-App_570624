//
//  ChatPartnersController.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import Foundation

class ChatPartnersController: BaseController<ChatPartners> {
    
    static let controller = ChatPartnersController()
    @Published var chatPartners = ChatPartners(partners: [])
    
    
    func getChatPartners() -> ChatPartners {
       let chatPartnersJSONString = readJSON(source: documentPath!)
        return decodeJSON(jsonString: chatPartnersJSONString)
    }
    
    override init() {
        super.init()
        defaultModel = ChatPartners(partners: [])
        documentPath = getDocumentsPath().appendingPathComponent("chat-partners").appendingPathExtension("json")
        _chatPartners = Published(wrappedValue: getChatPartners())
    }
    
    override func saveValues() {
        do {
            try writeJSON(source: documentPath!, jsonString: encodeToJSON(model: chatPartners))
        } catch {
            // Handle error
        }
    }
    
    func addChatPartner(name: String) {
       let chatPartner = ChatPartner(name: name)
        chatPartners.partners.append(chatPartner)
        saveValues()
    }
}
