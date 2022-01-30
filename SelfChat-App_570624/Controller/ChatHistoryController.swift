//
//  ChatHistoryController.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import Foundation

let defaultChatHistoryModel = ChatHistory(chatPartner: "", messages: [])

class ChatHistoryController: BaseController<ChatHistory> {
    
    var currentChatPartner = ""
    @Published var chatHistory = defaultChatHistoryModel
    
    func getChatHistory() {
        let chatHistoryJSONString = readJSON(source: documentPath!)
        _chatHistory = Published(wrappedValue: decodeJSON(jsonString: chatHistoryJSONString))
    }
    
    init(chatPartner: ChatPartner) {
        super.init()
        currentChatPartner = chatPartner.name
        defaultModel = ChatHistory(chatPartner: currentChatPartner, messages: [])
        documentPath = getDocumentsPath().appendingPathComponent(currentChatPartner).appendingPathExtension("json")
        getChatHistory()
    }
    
    func saveValueWithError() throws {
        try writeJSON(source: documentPath!, jsonString: encodeToJSON(model: chatHistory))
    }
    
    func addNewMessage(message: Message) throws {
        chatHistory.messages.append(message)
        try saveValueWithError()
    }
}
