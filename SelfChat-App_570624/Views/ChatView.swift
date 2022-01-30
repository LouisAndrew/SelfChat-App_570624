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
                .padding(10)
                .background(message.sender ? Color(red: 240/255, green: 240/255, blue: 240/255) : .blue)
                .cornerRadius(10)
                .foregroundColor(message.sender ? .black : .white)
                .multilineTextAlignment(message.sender ? .trailing : .leading)
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
            ScrollView {
                VStack {
                    if hasError {
                        Text("Has error")
                        Text(errorMessage)
                    }
                    
                    ForEach(chatHistoryController.chatHistory.messages, id: \.self) { message in
                        MessageView(message: message)
                            .frame(idealWidth: 100, maxWidth: .infinity, alignment: message.sender ? .trailing : .leading)
                            .padding(message.sender ? .trailing : .leading, 10)
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
            }
            .navigationTitle("Chatting with " + chatPartner.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatPartner: ChatPartner(name: "L1"))
    }
}
