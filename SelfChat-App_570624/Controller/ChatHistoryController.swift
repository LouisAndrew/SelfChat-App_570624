//
//  ChatHistoryController.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import Foundation

let defaultChatHistoryModel = ChatHistory(chatPartner: "", messages: [])

class ChatHistoryController: BaseController<ChatHistory> {
    
    static let controller = ChatHistoryController()
    
    var currentChatPartner = ""
    @Published var chatHistory = defaultChatHistoryModel
    
    func getChatHistory(chatPartner: String) -> ChatHistory {
        if chatPartner != currentChatPartner {
            currentChatPartner = chatPartner
           setDocumentPath()
            let chatHistoryJSONString = readJSON(source: documentPath!)
            if chatHistoryJSONString != "" {
                return decodeJSON(jsonString: chatHistoryJSONString)
            } else {
                return ChatHistory(chatPartner: currentChatPartner, messages: [])
            }
        }
        
        return chatHistory
    }
    
    func setDocumentPath() {
        documentPath = getDocumentsPath().appendingPathComponent(currentChatPartner).appendingPathExtension("json")
    }
    
    override init() {
        super.init()
        defaultModel = defaultChatHistoryModel
        documentPath = getDocumentsPath().appendingPathComponent("sample").appendingPathExtension("json")
    }
    
    override func saveValues() {
        do {
            try writeJSON(source: documentPath!, jsonString: encodeToJSON(model: chatHistory))
        } catch {
            // Handle error
        }
    }
    
    func addNewMessage(message: Message) {
        chatHistory.messages.append(message)
        saveValues()
    }
}
