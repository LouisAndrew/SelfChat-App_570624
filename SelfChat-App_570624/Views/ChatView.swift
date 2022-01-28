//
//  ChatView.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 28.01.22.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        Text(message.content)
            .foregroundColor(message.sender ? .black : .white)
            .background(message.sender ? .gray : .blue)
    }
}

struct ChatView: View {
    
    var chatPartner: ChatPartner
    @ObservedObject var chatHistoryController: ChatHistoryController
    
    @State var hasError: Bool = false
    @State var errorMessage: String = ""
    
    init(chatPartner: ChatPartner) {
        chatHistoryController = ChatHistoryController(chatPartner: chatPartner)
        self.chatPartner = chatPartner
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if hasError {
                    Text("Has error")
                    Text(errorMessage)
                }
                
                ForEach(chatHistoryController.chatHistory.messages, id: \.self) { message in
                    MessageView(message: message)
                }
                
                Button(action: {
                    do {
                        try chatHistoryController.addNewMessage(message: Message(content: "Hi", sender:  true))
                    } catch {
                        hasError = true
                        errorMessage = "Err: \(error)"
                    }
                }, label: {
                    Text("Send something")
                })
                
                Button(action: {
                    do {
                        try chatHistoryController.addNewMessage(message: Message(content: "Hello!", sender:  false))
                    } catch {
                        hasError = true
                        errorMessage = "Err: \(error)"
                    }
                }, label: {
                    Text("Receive something")
                })
            }
            .navigationTitle("Chatting with " + chatPartner.name)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatPartner: ChatPartner(name: "L1"))
    }
}
